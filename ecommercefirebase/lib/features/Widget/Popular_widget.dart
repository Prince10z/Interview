import 'package:ecommercefirebase/features/Models/Popular.dart';
import 'package:flutter/material.dart';

class PopularGridItem extends StatefulWidget {
  final Popular popularItem;
  const PopularGridItem({super.key, required this.popularItem});

  @override
  State<PopularGridItem> createState() => _PopularGridItemState();
}

class _PopularGridItemState extends State<PopularGridItem> {
  bool _isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 240,
          width: 200,
          child: Stack(
            // clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: 150,
                  width: 200,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onDoubleTap: () {
                      if (_isfavorite == false) {
                        setState(() {
                          _isfavorite = true;
                        });
                      }
                    },
                    child: Image.asset(
                      widget.popularItem.image_add,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 20,
                child: InkWell(
                  onTap: () {
                    if (_isfavorite == false) {
                      setState(() {
                        _isfavorite = true;
                      });
                    } else {
                      setState(() {
                        _isfavorite = false;
                      });
                    }
                  },
                  child: Container(
                      height: 35,
                      width: 35,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: (_isfavorite == true)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border),
                      )),
                ),
              ),
              Positioned(
                bottom: 50,
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: Center(
                    child: Text(
                      widget.popularItem.name,
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[800],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[800],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[800],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[800],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[800],
                      ),
                      Text("(${widget.popularItem.rating.toString()})"),
                    ],
                  )),
                ),
              ),
            ],
          )),
    );
  }
}
