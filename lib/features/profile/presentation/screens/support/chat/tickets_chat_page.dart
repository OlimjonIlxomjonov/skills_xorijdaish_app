import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/flush_bar_wg.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_files.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_message_data.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/send_message/send_message_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/send_message/send_message_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/tickets_message/tickets_message_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/tickets_message/tickets_message_state.dart';

import '../../../../../../core/services/token_storage/token_storage_service_impl.dart';
import '../../../../data/model/tickets_message/tickets_message_model.dart';
import '../../../widget/file_opener_wg.dart';

class TicketsChatPage extends StatefulWidget {
  final int ticketId;

  const TicketsChatPage({super.key, required this.ticketId});

  @override
  State<TicketsChatPage> createState() => _TicketsChatPageState();
}

class _TicketsChatPageState extends State<TicketsChatPage> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController messageController = TextEditingController();
  final List<File> files = [];
  final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  final tokenStorage = TokenStorageServiceImpl();

  @override
  void initState() {
    super.initState();

    context.read<TicketsMessageBloc>().add(
      TicketsMessageEvent(widget.ticketId),
    );

    _connectPusher();
  }

  Future<void> _connectPusher() async {
    final token = await tokenStorage.getAccessToken();

    try {
      await pusher.init(
        apiKey: "mbzfd4y116py2cjxflm4",
        cluster: "mt1",
        useTLS: true,
        onConnectionStateChange: (String currentState, String previousState) {
          debugPrint(
            "Pusher state changed from $previousState to $currentState",
          );
        },
        onError: (message, code, e) {
          debugPrint("Pusher error: $message | Code: $code | Exception: $e");
        },
        onAuthorizer: (channelName, socketId, options) async {
          final response = await http.post(
            Uri.parse("https://skills.avacoder.uz/broadcasting/auth"),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            body: jsonEncode({
              "channel_name": channelName,
              "socket_id": socketId,
            }),
          );

          if (response.statusCode != 200) {
            debugPrint("Auth failed: ${response.body}");
          }
          return response.body;
        },
      );

      await pusher.connect();

      await pusher.subscribe(
        channelName: "private-chat.${widget.ticketId}",
        onEvent: (event) {
          debugPrint("Event: ${event.eventName} => ${event.data}");

          if (event.eventName == "new-message") {
            try {
              // final msg = TicketsMessageModel.fromJson(jsonDecode(event.data));
              context.read<TicketsMessageBloc>().add(
                TicketsMessageEvent(widget.ticketId),
              );
            } catch (e) {
              debugPrint("Failed to parse new message: $e");
            }
          }
        },
      );
    } catch (e) {
      debugPrint("Pusher connect error: $e");
    }
  }

  @override
  void dispose() {
    pusher.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: "Qo'llab quvvatlash"),
      body: BlocBuilder<TicketsMessageBloc, TicketsMessageState>(
        builder: (context, state) {
          if (state is TicketsMessageLoading) {
            return Center(child: LinearProgressIndicator());
          } else if (state is TicketsMessageLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: appW(20)),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: state.response.data.length,
                      itemBuilder: (context, index) {
                        final message = state.response.data[index];

                        final now = DateTime.now();

                        final datePart = message.sentAt.split(',')[1].trim();
                        final parts = datePart.split('.');
                        final currentDate = DateTime(
                          int.parse(parts[2]),
                          int.parse(parts[1]),
                          int.parse(parts[0]),
                        );

                        bool showDateLabel = true;
                        if (index < state.response.data.length - 1) {
                          final nextMessage = state.response.data[index + 1];
                          final nextDatePart =
                              nextMessage.sentAt.split(',')[1].trim();
                          final nextParts = nextDatePart.split('.');
                          final nextDate = DateTime(
                            int.parse(nextParts[2]),
                            int.parse(nextParts[1]),
                            int.parse(nextParts[0]),
                          );
                          showDateLabel = currentDate != nextDate;
                        }

                        final yesterday = now.subtract(const Duration(days: 1));
                        String dateText;
                        if (currentDate.year == now.year &&
                            currentDate.month == now.month &&
                            currentDate.day == now.day) {
                          dateText = 'Bugun';
                        } else if (currentDate.year == yesterday.year &&
                            currentDate.month == yesterday.month &&
                            currentDate.day == yesterday.day) {
                          dateText = 'Kecha';
                        } else {
                          dateText =
                              "${currentDate.day.toString().padLeft(2, '0')}.${currentDate.month.toString().padLeft(2, '0')}.${currentDate.year}";
                        }

                        final String onlyTime =
                            message.sentAt.split(',')[0].trim();
                        final files = message.files;

                        return Column(
                          crossAxisAlignment:
                              message.isAdmin
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                          children: [
                            if (showDateLabel)
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: appH(10),
                                  ),
                                  child: Text(
                                    dateText,
                                    style: AppTextStyles.source.bold(
                                      fontSize: 14,
                                      color: AppColors.textGrey,
                                    ),
                                  ),
                                ),
                              ),
                            message.isAdmin
                                ? adminText(message, files, onlyTime)
                                : userText(message, files, context, onlyTime),
                          ],
                        );
                      },
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(bottom: appH(10)),
                    decoration: BoxDecoration(
                      color: Color(0xffF7F7F8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        if (files.isNotEmpty)
                          SizedBox(
                            height: 70,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: files.length,
                              separatorBuilder: (_, __) => SizedBox(width: 8),
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        files[index],
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            files.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                            shape: BoxShape.circle,
                                          ),
                                          padding: EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.close,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),

                        TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 12),
                            border: InputBorder.none,
                            hintText: 'Message',
                            prefixIcon: IconButton(
                              onPressed: () async {
                                final XFile? pickedFile = await _picker
                                    .pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 80,
                                    );
                                if (pickedFile != null) {
                                  setState(() {
                                    files.add(File(pickedFile.path));
                                  });
                                }
                              },
                              icon: Icon(Icons.attach_file),
                            ),
                            suffixIcon: BlocListener<
                              SendMessageBloc,
                              SendMessageState
                            >(
                              listener: (context, state) {
                                if (state is SendMessageLoaded) {
                                  setState(() {
                                    messageController.clear();
                                    files.clear();
                                  });
                                  context.read<TicketsMessageBloc>().add(
                                    TicketsMessageEvent(widget.ticketId),
                                  );
                                }
                                if (state is SendMessageError) {
                                  showErrorFlushbar(
                                    context,
                                    "Maydon bo'sh bolmasilig shart!",
                                  );
                                }
                              },
                              child: IconButton(
                                onPressed: () {
                                  final text = messageController.text.trim();
                                  final filesToSend = List<File>.from(files);

                                  context.read<SendMessageBloc>().add(
                                    SendMessageEvent(
                                      widget.ticketId,
                                      text,
                                      filesToSend,
                                    ),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  AppVectors.sendPlane,
                                  width: appW(20),
                                  height: appH(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Column adminText(
    MessageData message,
    List<TicketFiles> files,
    String onlyTime,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: appH(20)),
          padding: EdgeInsets.only(
            left: appW(15),
            right: appW(10),
            bottom: appH(4),
          ),
          decoration: BoxDecoration(
            color: Color(0xffF7F7F8),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (files.isNotEmpty) ...[
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      files.map<Widget>((file) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => ImageViewerWg(
                                      ticketId: widget.ticketId.toString(),
                                      fileId: file.id.toString(),
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              file.fileName,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
              SizedBox(height: 4),
              if (message.text.isNotEmpty)
                Text(
                  message.text,
                  style: AppTextStyles.source.regular(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
              SizedBox(height: 4),
              Text(
                textAlign: TextAlign.left,
                onlyTime,
                style: AppTextStyles.source.regular(
                  color: AppColors.textGrey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column userText(
    MessageData message,
    List<TicketFiles> files,
    BuildContext context,
    String onlyTime,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: appH(20)),
          padding: EdgeInsets.only(
            left: appW(15),
            right: appW(10),
            bottom: appH(4),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff5F82FF), Color(0xff335EF7)],
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              files.isNotEmpty ? SizedBox(height: appH(8)) : SizedBox.shrink(),
              if (files.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      files.map<Widget>((file) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => ImageViewerWg(
                                      ticketId: widget.ticketId.toString(),
                                      fileId: file.id.toString(),
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: appW(160),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              file.fileName,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
              SizedBox(height: appH(5)),
              if (message.text.isNotEmpty)
                Text(
                  message.text,
                  style: AppTextStyles.source.regular(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              SizedBox(height: 4),
              Text(
                onlyTime,
                style: AppTextStyles.source.regular(
                  color: AppColors.white.withOpacity(0.7),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
