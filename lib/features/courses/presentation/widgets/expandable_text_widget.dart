import 'package:flutter/material.dart';

import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/common/textstyles/app_text_styles.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => ExpandableTextWidgetState();
}

class ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final int maxLines = _expanded ? 100 : 2;
    final overflow = _expanded ? TextOverflow.visible : TextOverflow.ellipsis;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: maxLines,
          overflow: overflow,
          style: AppTextStyles.source.regular(
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 4),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Text(
            _expanded ? 'See less' : 'See more',
            style: AppTextStyles.source.regular(
              fontSize: 14,
              color: AppColors.secondBlue,
            ),
          ),
        ),
      ],
    );
  }
}
