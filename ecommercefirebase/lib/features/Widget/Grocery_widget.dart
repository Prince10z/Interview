import 'package:ecommercefirebase/features/Models/Convenience_Grocery.dart';
import 'package:flutter/material.dart';

class GroceryGridItem extends StatelessWidget {
  final Grocery groceryItem;
  const GroceryGridItem({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 300,
          width: 400,
          child: Stack(
            // clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: 200,
                  width: 400,
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    groceryItem.image_add,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 20,
                child: Container(
                    height: 100,
                    width: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 188, 14, 2)),
                    child: Center(
                      child: Text.rich(TextSpan(
                          text: "upto\n\t\t",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                          children: [
                            TextSpan(
                                text: ("${groceryItem.discount.toString()}%"),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                                children: const [
                                  TextSpan(
                                    text: "\n\t\t\t\t\t\t\t\t\t\t\t\toff",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ])
                          ])),
                    )),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  width: 400,
                  height: 50,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child: Text(groceryItem.name)),
                      Container(
                          child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber[800],
                          ),
                          Text("(${groceryItem.rating.toString()})"),
                        ],
                      )),
                    ],
                  )),
                ),
              ),
            ],
          )),
    );
  }
}
