import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/helpers/date_time_helper.dart';
import '../../constants/helpers/is_dark_theme_helper.dart';

class NewsCard extends StatelessWidget {
  final String newsTitle;
  final String newsDescription;
  final String imageURL;
  final DateTime? publishedAt;

  const NewsCard({
    super.key,
    required this.newsTitle,
    required this.newsDescription,
    required this.imageURL,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    String timeAgo = publishedAt != null ? timeAgoSinceDate(publishedAt!) : '';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? ColorPalettes.darkBackground
            : ColorPalettes.lightBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: imageURL.isEmpty ? 4 : 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  newsDescription,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  timeAgo,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          imageURL.isEmpty
              ? const SizedBox.shrink()
              : Container(
                  height: 119,
                  width: 119,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
