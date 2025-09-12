import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/banners/banners_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/banners/banners_state.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/constants/colors/app_colors.dart';

class AutoScrollBanner extends StatefulWidget {
  const AutoScrollBanner({super.key});

  @override
  State<AutoScrollBanner> createState() => _AutoScrollBannerState();
}

class _AutoScrollBannerState extends State<AutoScrollBanner> {
  @override
  void initState() {
    super.initState();
    context.read<BannersBloc>().add(BannersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersBloc, BannersState>(
      builder: (context, state) {
        if (state is BannersLoaded) {
          return CarouselSlider(
            options: CarouselOptions(
              height: appH(200),
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: .9,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items:
                state.response.data.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: GestureDetector(
                          onTap: () {
                            _launchLink(url.link);
                          },
                          child: Image.network(
                            url.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
          );
        } else if (state is BannersLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: appH(200),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: appW(20)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        } else if (state is BannersError) {
          return Text(
            'Check the internet connection!',
            style: AppTextStyles.source.bold(
              color: AppColors.red,
              fontSize: 22,
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  void _launchLink(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
      }
    } catch (e) {
      print('Failed to launch $url: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Linkni ochib bo‘lmadi")));
    }
  }
}
