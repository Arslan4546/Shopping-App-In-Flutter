import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/utilities/api_call/api_service.dart';
void main(){
  runApp(const ShopScreen());
}

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  String _selectedCategory = "All";

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ApiService apiService = ApiService();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const  Drawer(
        ),
        appBar: AppBar(
          actions: [
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
          title: Text("Your Right Shopping",
              style: GoogleFonts.aladin(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ))),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: "search your product",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),

              Expanded(
                  child: FutureBuilder(
                      future: apiService.getApiData(),
                      builder: (context, snapshot){
                       if(!snapshot.hasData){
                         return ListView.builder(
                           itemCount: 4,
                             itemBuilder:
                             (context,index){
                               return Shimmer.fromColors(
                                 baseColor: Colors.grey.shade700,
                                 highlightColor: Colors.grey.shade100,
                                 child: Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: SizedBox(
                                         height: screenHeight * 0.15,
                                         width: double.infinity,
                                         child: Card(
                                           child: Row(
                                             children: [
                                               Padding(
                                                 padding:
                                                 const EdgeInsets.all(8.0),
                                                 child: Container(
                                                   height: screenHeight * 0.30,
                                                   width: screenWidth * 0.30,
                                                   decoration: BoxDecoration(
                                                     color: Colors.white,
                                                     borderRadius:
                                                     BorderRadius.circular(20),
                                                   ),
                                                 ),
                                               ),
                                               Padding(
                                                 padding:
                                                 const EdgeInsets.all(9.0),
                                                 child: Column(
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.start,
                                                   children: [
                                                     Container(
                                                       height: 5,
                                                       width: 100,
                                                       color: Colors.white,
                                                     ),
                                                     Container(
                                                       height: 5,
                                                       width: 100,
                                                       color: Colors.white,
                                                     ),
                                                     Container(
                                                       height: 5,
                                                       width: 100,
                                                       color: Colors.white,
                                                     ),
                                                     Container(
                                                       height: 5,
                                                       width: 100,
                                                       color: Colors.white,
                                                     )
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               );
                             });
                       }else{
                         return ListView.builder(
                             itemCount:5,
                             itemBuilder:(context ,index){
                               String name = snapshot.data!.carts![index].products![index].title.toString();
                               if(searchController.text.isEmpty){
                                 return  Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child:  SizedBox(
                                     height: screenHeight * 0.15,
                                     width: double.infinity,
                                     child: Card(
                                       color: const Color(0xffF5D33B),
                                       child: Row(
                                         children: [
                                           Padding(
                                             padding:
                                             const EdgeInsets.only(top: 8.0,left: 8,bottom: 8),
                                             child: Container(
                                               height: screenHeight * 0.30,
                                               width: screenWidth * 0.30,
                                               decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadius.circular(
                                                     20),
                                               ),
                                               child: Image(
                                                 image: NetworkImage(snapshot
                                                     .data!
                                                     .carts![index]
                                                     .products![index].thumbnail.toString()),
                                                 fit: BoxFit.cover,
                                               ),
                                             ),
                                           ),
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 8.0,top: 5),
                                                 child: Row(
                                                   children: [
                                                     Text(
                                                       snapshot.data!.carts![index].products![index].title
                                                           .toString(),



                                                       textAlign: TextAlign.start, // Align the text to start (left)
                                                       style: GoogleFonts.abel(
                                                         textStyle: const TextStyle(
                                                           fontSize: 20,
                                                           color: Colors.black,
                                                           fontWeight: FontWeight.bold,
                                                         ),
                                                       ),
                                                     ),

                                                   ],
                                                 ),
                                               ),

                                               Padding(
                                                 padding: const EdgeInsets.only(left: 10),
                                                 child: Row(
                                                   children: [
                                                     Text(
                                                       "Quantity",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               fontSize: 20,
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),

                                                     Text(
                                                       snapshot.data!.carts![index].products![index].quantity
                                                           .toString(),
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               fontSize: 20,
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),
                                                     Text(
                                                       "total",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               fontSize: 20,
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),
                                                     Text(
                                                       snapshot.data!.carts![index].products![index].total
                                                           .toString(),
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               fontSize: 20,
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
                                                 padding: const EdgeInsets.only(top:15,left: 10),
                                                 child: Row(
                                                   children: [
                                                     Text(
                                                       "Rs.",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontSize: 25,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),

                                                     Text(
                                                       snapshot.data!.carts![index].products![index].price
                                                           .toString(),
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               fontSize: 25,
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width:40,
                                                     ),
                                                     SizedBox(
                                                         height: 35,
                                                         width: 70,
                                                         child: Card(
                                                           color: Colors.black,
                                                           child: Center(
                                                             child: Text(
                                                               "${snapshot.data!.carts![index].products![index].discountPercentage
                                                                   .toString()} %",
                                                               style: GoogleFonts.abel(
                                                                   textStyle: const TextStyle(
                                                                       color: Colors
                                                                           .white,
                                                                       fontWeight:
                                                                       FontWeight
                                                                           .bold)),
                                                             ),
                                                           ),
                                                         )



                                                     ),
                                                     SizedBox(
                                                       width:10,
                                                     ),
                                                     Text(
                                                       "off",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontSize: 25,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 );

                               }else if(name.toLowerCase().contains(searchController.text.toString())){
                                 return Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child:  SizedBox(
                                     height: screenHeight * 0.15,
                                     width: double.infinity,
                                     child: Card(
                                       color: const Color(0xffF5D33B),
                                       child: Row(
                                         children: [
                                           Padding(
                                             padding:
                                             const EdgeInsets.only(top: 8.0,left: 8,bottom: 8),
                                             child: Container(
                                               height: screenHeight * 0.30,
                                               width: screenWidth * 0.30,
                                               decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadius.circular(
                                                     20),
                                               ),
                                               child: Image(
                                                 image: NetworkImage(snapshot
                                                     .data!
                                                     .carts![index]
                                                     .products![index].thumbnail.toString()),
                                                 fit: BoxFit.cover,
                                               ),
                                             ),
                                           ),
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 8.0),
                                                 child: Row(
                                                   children: [
                                                     Text(
                                                       snapshot.data!.carts![index].products![index].title
                                                           .toString(),
                                                       maxLines: 1,
                                                       overflow: TextOverflow.ellipsis,
                                                       softWrap: true, // This property is not needed when maxLines is 1
                                                       textAlign: TextAlign.start, // Align the text to start (left)
                                                       style: GoogleFonts.abel(
                                                         textStyle: const TextStyle(
                                                           fontSize: 18,
                                                           color: Colors.black,
                                                           fontWeight: FontWeight.bold,
                                                         ),
                                                       ),
                                                     ),

                                                   ],
                                                 ),
                                               ),
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 10.0),
                                                 child: Row(

                                                   children: [
                                                     const Icon(
                                                       Icons.star,
                                                       color: Colors.white,
                                                       size: 17,
                                                     ),
                                                     const Icon(
                                                       Icons.star,
                                                       color: Colors.white,
                                                       size: 17,
                                                     ),
                                                     const Icon(
                                                       Icons.star,
                                                       color: Colors.white,
                                                       size: 17,
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),

                                                     Text(
                                                       "3.7",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
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
                                                 padding: const EdgeInsets.only(top: 8.0,left: 10),
                                                 child: Row(
                                                   children: [
                                                     Text(
                                                       "Quantity",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),

                                                     Text(
                                                       snapshot.data!.carts![index].products![index].quantity
                                                           .toString(),
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),
                                                     Text(
                                                       "total",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),
                                                     Text(
                                                       snapshot.data!.carts![index].products![index].total
                                                           .toString(),
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
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
                                                 padding: const EdgeInsets.only(top: 8.0,left: 10),
                                                 child: Row(
                                                   children: [
                                                     Text(
                                                       "Rs.",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.02,
                                                     ),

                                                     Text(
                                                       snapshot.data!.carts![index].products![index].price
                                                           .toString(),
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontWeight:
                                                               FontWeight
                                                                   .bold)),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.15,
                                                     ),
                                                     SizedBox(
                                                         height: 30,
                                                         width: 50,
                                                         child: Card(
                                                           color: Colors.black,
                                                           child: Center(
                                                             child: Text(
                                                               snapshot.data!.carts![index].products![index].discountPercentage
                                                                   .toString(),
                                                               style: GoogleFonts.abel(
                                                                   textStyle: const TextStyle(
                                                                       color: Colors
                                                                           .white,
                                                                       fontWeight:
                                                                       FontWeight
                                                                           .bold)),
                                                             ),
                                                           ),
                                                         )



                                                     ),],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 );
                               }else{
                                 return Container();
                               }
                             } );
                       }
                      })
              )


            ],
          ),
        ),

      ),
    );
  }
}
