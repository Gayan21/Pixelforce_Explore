import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/models/experience_model.dart';
import '../../../core/styles/app_text.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel exp;
  const ExperienceCard({super.key, required this.exp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.15 * 255).toInt()),
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
              imageUrl: exp.image,
              height: 150,
              width: 140,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: Colors.grey[300]),
              errorWidget: (_, __, ___) => Container(color: Colors.grey[300]),
            ),
          ),
          
          Positioned(
            bottom: 8,
            left: 8,
            right: 8, 
            child: Text(
              exp.name,
              style: AppText.cardTitle16.copyWith(
                color: Colors.white,
                shadows: const [
                  Shadow(color: Colors.black, blurRadius: 6),
                ],
              ),
              maxLines: 1, 
              overflow: TextOverflow.ellipsis, 
            ),
          ),
        ],
      ),
    );
  }
}
