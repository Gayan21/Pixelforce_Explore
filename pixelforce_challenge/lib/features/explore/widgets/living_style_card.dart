import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/models/living_style.dart';
import '../../../core/styles/app_text.dart';

class LivingStyleCard extends StatelessWidget {
  final LivingStyle style;
  const LivingStyleCard({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 182,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: style.image,
              height: 211,
              width: 182,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: Colors.grey[300]),
              errorWidget: (_, __, ___) => Container(color: Colors.grey[300]),
            ),
          ),
          
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 52,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFFFDFDFD),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                style.name,
                style: AppText.cardTitle16,
                maxLines: 1, 
                overflow: TextOverflow.ellipsis, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
