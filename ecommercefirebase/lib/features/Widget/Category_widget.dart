import 'package:ecommercefirebase/features/Models/Category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final Category item;
  const CategoryGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: item.color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.image_add,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            item.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
