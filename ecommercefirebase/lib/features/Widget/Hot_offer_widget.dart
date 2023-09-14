import 'package:ecommercefirebase/features/Models/Hot_offers.dart';
import 'package:flutter/material.dart';

class HotOfferGridItem extends StatelessWidget {
  const HotOfferGridItem({super.key, required this.food});
  final Hot_offer food;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: 400,
            width: 250,
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4, // Add elevation for a card-like effect
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 240,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage(food.image_add),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Text(
                                food.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 250,
                              child: Text(
                                "Up to ${food.offer.toString()}% off",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      // Spacer(), // Expand to fill remaining space
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          child: SizedBox(
            width: 250,
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    elevation: 1,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
