import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';

class ToppingCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onAdd;

  const ToppingCard({
    super.key,
    required this.image,
    required this.title,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(image, height: 80, fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: onAdd,
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
