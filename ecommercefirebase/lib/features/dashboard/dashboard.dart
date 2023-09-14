import 'package:ecommercefirebase/features/Widget/Grocery_widget.dart';
import 'package:ecommercefirebase/features/Widget/Hot_offer_widget.dart';
import 'package:ecommercefirebase/features/Widget/Popular_widget.dart';
import 'package:ecommercefirebase/features/data/Grocery.dart';
import 'package:ecommercefirebase/features/data/Hot_offer_data.dart';
import 'package:ecommercefirebase/features/data/Popular_data.dart';
import 'package:flutter/material.dart';
import 'package:ecommercefirebase/features/data/Category_data.dart';
import 'package:ecommercefirebase/features/Widget/Category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 30,
            )),
        actions: [
          InkWell(
            child: Icon(
              Icons.favorite_outline,
              size: 30,
            ),
            onTap: () {},
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            splashColor: Colors.grey,
            child: Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            onTap: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 7.8 / 10,
                        child: TextFormField(
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Search Here",
                              labelStyle: TextStyle(
                                fontSize: 19,
                                color: Colors.grey,
                              ),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.sort_outlined,
                            color: Colors.amber[900],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: verity.length,
                        separatorBuilder: (BuildContext context, int index) {
                          // This is the separator between items, you can customize it
                          return SizedBox(
                              width: 16.0); // Adjust the width as needed
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 170, // Set the desired width for each item
                            child: CategoryGridItem(item: verity[index]),
                          );
                        },
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Item",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: popular_items.length,
                        separatorBuilder: (BuildContext context, int index) {
                          // This is the separator between items, you can customize it
                          return SizedBox(
                              width: 10.0); // Adjust the width as needed
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 200, // Set the desired width for each item
                            child: PopularGridItem(
                                popularItem: popular_items[index]),
                          );
                        },
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hot Offers",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 400,
                      // width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: offer_items.length,
                        separatorBuilder: (BuildContext context, int index) {
                          // This is the separator between items, you can customize it
                          return SizedBox(
                              width: 10.0); // Adjust the width as needed
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 260, // Set the desired width for each item
                            child: HotOfferGridItem(food: offer_items[index]),
                          );
                        },
                      )),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    children: [
                      Text(
                        "Convenience,Grocery",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: grocery_list.length,
                        separatorBuilder: (BuildContext context, int index) {
                          // This is the separator between items, you can customize it
                          return SizedBox(
                              width: 10.0); // Adjust the width as needed
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 500, // Set the desired width for each item
                            child: GroceryGridItem(
                                groceryItem: grocery_list[index]),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width * 2 / 3,
                            height: MediaQuery.of(context).size.height / 4,
                            child: Image.network(
                              "https://media.istockphoto.com/id/1077980738/photo/green-peas-or-matar-paneer-curry-recipe-served-in-a-bowl-selective-focus.jpg?s=612x612&w=0&k=20&c=SShuhVPIWBpUaJXqvdWqjPrh0AqsR6VR68GInZlyw6Y=",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                              ),
                              Text(
                                "Fantastic food and",
                                style: TextStyle(
                                    color: Colors.yellow.shade900,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                              ),
                              Text(
                                "where to find them!",
                                style: TextStyle(
                                    color: Colors.yellow.shade900,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 2 / 3,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.yellow[900],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Explore more",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 15,
                                        color: Colors.yellow[900],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width * 2 / 3,
                            height: MediaQuery.of(context).size.height / 4,
                            child: Image.network(
                              "https://thumbs.dreamstime.com/b/fruits-vegetables-15528773.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                              ),
                              Text(
                                "Fantastic food and",
                                style: TextStyle(
                                    color: Colors.green.shade600,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                              ),
                              Text(
                                "where to find them!",
                                style: TextStyle(
                                    color: Colors.green.shade600,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 2 / 3,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.green.shade600,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Explore more",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 15,
                                        color: Colors.green.shade600,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            child: Container(
                              height: 25,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade900,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  "Back to Top",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 11,
                            right: 31,
                            child: Material(
                              clipBehavior: Clip.none,
                              shape: CircleBorder(),
                              elevation: 3,
                              child: InkWell(
                                onTap: () {
                                  _scrollController.animateTo(
                                    0.0,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
