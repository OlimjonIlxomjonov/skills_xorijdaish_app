import 'dart:convert';
import 'dart:typed_data';
import 'package:html/parser.dart' as htmlParser;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/notif_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/notif_state.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/read_all/read_all_bloc.dart';

import '../../../block/notifications/notif_count/notif_count_bloc.dart';

class AppNotifications extends StatefulWidget {
  const AppNotifications({super.key});

  @override
  State<AppNotifications> createState() => _AppNotificationsState();
}

class _AppNotificationsState extends State<AppNotifications> {
  @override
  void initState() {
    super.initState();
    context.read<NotifBloc>().add(NotificationsEvent(1));
  }

  int? expandedIndex;
  bool isVisible = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Xabarnoma',
          style: AppTextStyles.source.medium(
            color: AppColors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() => _isPressed = true);
              context.read<ReadAllBloc>().add(ReadAllEvent());
              context.read<NotifCountBloc>().add(NotifCountEvent());

              Future.delayed(Duration(milliseconds: 500), () {
                setState(() => _isPressed = false);
              });
              context.read<NotifBloc>().add(NotificationsEvent(1));
            },
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder:
                  (child, anim) => ScaleTransition(scale: anim, child: child),
              child:
                  _isPressed
                      ? Icon(
                        Icons.check,
                        key: ValueKey('check'),
                        color: Colors.grey,
                      )
                      : Icon(
                        Icons.mark_email_read,
                        key: ValueKey('read'),
                        color: Colors.grey,
                      ),
            ),
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: BlocBuilder<NotifBloc, NotifState>(
        builder: (context, state) {
          if (state is NotifLoading) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (_, __) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                    left: appW(20),
                    right: appW(20),
                    top: appH(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyScale.grey50,
                          offset: Offset(0, 5),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: appH(10),
                                  horizontal: appW(16),
                                ),
                                width: appH(60),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: appH(10),
                                  horizontal: appW(16),
                                ),
                                width: appH(230),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is NotifError) {
            return Text('Error');
          } else if (state is NotifLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<NotifBloc>().add(NotificationsEvent(1));
              },
              child: ListView.builder(
                itemCount: state.response.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.response.data.length) {
                    final lastPage = state.response.metaData.lastPage;
                    final currentIndex = state.response.metaData.currentPage;
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap:
                          currentIndex != lastPage
                              ? () {
                                context.read<NotifBloc>().add(
                                  NotificationsEvent(currentIndex + 1),
                                );
                              }
                              : null,
                      child: Center(
                        child:
                            currentIndex != lastPage
                                ? Icon(IconlyLight.arrow_down_2)
                                : SizedBox.shrink(),
                      ),
                    );
                  }

                  final notif = state.response.data[index];
                  final now = DateTime.now();
                  final currentDate = DateTime(
                    notif.createdAt.year,
                    notif.createdAt.month,
                    notif.createdAt.day,
                  );

                  bool showDateLabel = true;
                  if (index > 0) {
                    final prev = state.response.data[index - 1];
                    final prevDate = DateTime(
                      prev.createdAt.year,
                      prev.createdAt.month,
                      prev.createdAt.day,
                    );
                    showDateLabel = currentDate != prevDate;
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

                  final isThisExpanded = expandedIndex == index;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: appH(10)),
                        if (showDateLabel)
                          Text(
                            dateText,
                            style: AppTextStyles.source.semiBold(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                        SizedBox(height: appH(20)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isThisExpanded) {
                                expandedIndex = null;
                              } else {
                                expandedIndex = index;
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      notif.isRead
                                          ? AppColors.greyScale.grey50
                                          : Colors.green.shade200,
                                  offset:
                                      notif.isRead
                                          ? Offset(0, 5)
                                          : Offset(0, 0),
                                  blurRadius: notif.isRead ? 20 : 5,
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                notif.title,
                                style: AppTextStyles.source.medium(
                                  color: AppColors.black,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Builder(
                                    builder: (context) {
                                      final document = htmlParser.parse(
                                        notif.text,
                                      );
                                      final imgTag = document.querySelector(
                                        'img',
                                      );
                                      final hasImage =
                                          imgTag != null &&
                                          (imgTag.attributes['src']?.startsWith(
                                                'data:image',
                                              ) ??
                                              false);

                                      final plainText =
                                          document.body?.text ?? '';

                                      if (!isThisExpanded) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                plainText,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            if (hasImage) ...[
                                              SizedBox(width: 8),
                                              Icon(
                                                Icons.image,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ],
                                        );
                                      }

                                      List<Widget> expandedWidgets = [];
                                      if (hasImage) {
                                        try {
                                          final base64Str =
                                              imgTag.attributes['src']!
                                                  .split('base64,')
                                                  .last;
                                          final bytes = base64Decode(base64Str);
                                          expandedWidgets.add(
                                            buildGestureDetector(
                                              context,
                                              bytes,
                                            ),
                                          );
                                        } catch (e) {
                                          expandedWidgets.add(
                                            Text("Invalid image data"),
                                          );
                                        }
                                      }

                                      if (plainText.isNotEmpty) {
                                        expandedWidgets.add(
                                          Text(
                                            plainText,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        );
                                      }

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: expandedWidgets,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context, Uint8List bytes) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  backgroundColor: Colors.black,
                  body: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Center(
                      child: PhotoView(
                        backgroundDecoration: BoxDecoration(
                          color: AppColors.inputGreyColor,
                        ),
                        imageProvider: MemoryImage(bytes),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 3,
                      ),
                    ),
                  ),
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Image.memory(bytes, width: double.infinity, fit: BoxFit.cover),
      ),
    );
  }
}
