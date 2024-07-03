import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  String _selectedCategory = "All";
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            const Icon(Icons.share,size: 25),
            const SizedBox(width: 10,),
            const Icon(Icons.search,size: 27,),
            const SizedBox(width: 10,),
            PopupMenuButton(
              elevation: 8,
              onSelected: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              itemBuilder: (BuildContext context) =>[
                const PopupMenuItem(
                  value: 'All',
                  child: Text('All'),
                ),
                const PopupMenuItem(
                  value: 'Electronics',
                  child: Text('Electronics'),
                ),
                const PopupMenuItem(
                  value: 'Clothing',
                  child: Text('Clothing'),
                ),
                // Add more categories as needed
              ],
            ),

          ],
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor:const  Color(0xffF5D33B),
          title: Text("product Details",
              style: GoogleFonts.abel(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ))),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                    decoration: const BoxDecoration(

                    ),
                  child: ClipRRect(

                        borderRadius: BorderRadius.circular(20),

                    child: const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrIcH-f_rDSW-x4NyYBOpvvl9ccs7lSScXHg&s")),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(

                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(top:10,left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Branded Mens Shoes",
                            style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                    fontSize: 30,
                                    color: Colors
                                        .black,
                                    fontWeight:
                                    FontWeight
                                        .bold)),
                          ),





                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10,left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Rs.",
                            style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: Colors
                                        .black,
                                    fontWeight:
                                    FontWeight
                                        .bold)),
                          ),
                          const SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "100",
                              style: GoogleFonts.abel(
                                  textStyle: const TextStyle(
                                      fontSize: 30,
                                      color: Colors
                                          .black,
                                      fontWeight:
                                      FontWeight
                                          .bold)),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Text(
                            "-11%",
                            style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors
                                      .black,
                                )),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            "Off",
                            style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors
                                      .black,
                                )),
                          ),
                          const SizedBox(width: 70,),
                          Text(
                            "total",
                            style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors
                                      .black,
                                )),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            "41",
                            style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors
                                      .black,
                                )),
                          ),
                          const SizedBox(width: 10,), IconButton(
                            color: Colors.black,

                            icon: Icon(
                              size: 30,
                              isFavorite
                                  ? Icons.favorite
                                  : Icons
                                  .favorite_border,
                              color: isFavorite
                                  ? Colors.yellow
                                  : null,
                            ),
                            onPressed:
                            toggleFavorite,
                          ),







                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text(
                          "Ratings",
                          style: GoogleFonts.abel(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors
                                    .black,
                              )),
                        ),
                        const SizedBox(width: 10,),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 17,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 17,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 17,
                        ),



                      ],
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        width: double.infinity,
                        height: 70,

                        child: Row(
                          children: [

                          Expanded(
                            flex:2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              const Icon(Icons.add_shopping_cart,size: 40,),
                              const SizedBox(width: 10,),
                              Text(
                                "Free Delivery",
                                style: GoogleFonts.abel(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        color: Colors
                                            .black,
                                        fontWeight:
                                        FontWeight
                                            .bold)),
                              ),
                            ],),
                          ),
                          const Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              Icon(Icons.arrow_forward_ios,size: 30,),
                              SizedBox(width: 10,),

                            ],),
                          )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        width: double.infinity,
                        height: 70,

                        child: Row(
                          children: [

                            Expanded(
                              flex:2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 15,),
                                  Text(
                                    "Free Return",
                                    style: GoogleFonts.abel(
                                        textStyle: const TextStyle(
                                            fontSize: 30,
                                            color: Colors
                                                .black,
                                            fontWeight:
                                            FontWeight
                                                .bold)),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Icon(Icons.check_circle_outline,size: 40,),

                                ],),
                            ),

                          ],
                        ),
                      ),
                    ),



                  ],
                ),

              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.yellow,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 5,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                            Container(
                              height: 60,
                              width:50,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: const Image(image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrIcH-f_rDSW-x4NyYBOpvvl9ccs7lSScXHg&s"
                                )),
                              ),

                            ),
                              const Text("large",style: TextStyle(fontSize: 20,
                              ),)
                          ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width:50,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Image(image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrIcH-f_rDSW-x4NyYBOpvvl9ccs7lSScXHg&s"
                                  )),
                                ),

                              ),
                              const Text("medium",style: TextStyle(fontSize: 20,
                              ),)
                            ],),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width:50,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Image(image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrIcH-f_rDSW-x4NyYBOpvvl9ccs7lSScXHg&s"
                                  )),
                                ),

                              ),
                              const Text("small",style: TextStyle(fontSize: 20,
                              ),)
                            ],),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)

                            ),
                            child: const Center(
                              child: Text("Add To Cart",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),


              ),
            ),


          ],
        )
      ),
    );
  }
}
