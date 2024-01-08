import 'package:flutter/material.dart';

import '../../../../core/constants/theme/app_colors.dart';
import '../../../../core/constants/theme/border_radii.dart';
import '../../../../core/constants/theme/font_size.dart';

class EventContainerWidget extends StatelessWidget {
  const EventContainerWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.textTheme,
  });

  final double screenWidth;
  final double screenHeight;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.2,
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://vivahthiruvalla.com/wp-content/uploads/2021/05/46c6469a7759c21670e83594a57fae13-1.jpeg"),
            ),
          ),
        ),
        Container(
          width: screenWidth,
          height: screenHeight * 0.2,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.65),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marriage Event',
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.white,
                    fontSize: FontSizes.size_20,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: Text(
                    'en the industry\'s standard dummy text  an unknown printer took',
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                      fontSize: FontSizes.size_16,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: screenWidth * 0.37,
                  height: 40.0,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(BorderRadii.size_12),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Join the Event",
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: FontSizes.size_14,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 10.0,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
