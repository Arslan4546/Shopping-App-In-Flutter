import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/utilities/api_call/api_service.dart';


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
    return  Scaffold(
        backgroundColor: Color(0xffE3E6E6),
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
          backgroundColor:const  Color(0xffE2CC34),
          title: Text(" Shopping ",
              style: GoogleFonts.aladin(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ))),
          centerTitle: true,
        ),
        drawer: const  Drawer(
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

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
                                       color: const  Color(0xffFFFFFF),
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
                                                 padding: const EdgeInsets.only(left: 8.0,top: 8),
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
        )),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.01,
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
                                                                   .bold
      )),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.09,
                                                     ),
                                                     Text(
                                                       "total",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               fontSize: 20,
                                                               color: Colors
                                                                   .black,

      )),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.01,
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
                                                 padding: const EdgeInsets.only(top:5,left: 10),
                                                 child: Row(
                                                   children: [
                                                     Text(
                                                       "Rs.",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontSize: 18,
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
                                                    const  SizedBox(
                                                       width:30,
                                                     ),
                                                     SizedBox(
                                                         height: 35,
                                                         width: 70,
                                                         child: Card(
                                                           color:  Color(0xffE2CC34),
                                                           child: Center(
                                                             child: Text(
                                                               "${snapshot.data!.carts![index].products![index].discountPercentage
                                                                   .toString()} %",
                                                               style: GoogleFonts.abel(
                                                                   textStyle: const TextStyle(
                                                                       color: Colors
                                                                           .black,
                                                                       fontWeight:
                                                                       FontWeight
                                                                           .bold)),
                                                             ),
                                                           ),
                                                         )



                                                     ),
                                                    const  SizedBox(
                                                       width:5,
                                                     ),
                                                     Text(
                                                       "off",
                                                       style: GoogleFonts.lobster(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontSize: 25,
        )),
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
                                       color: const  Color(0xffFFFFFF),
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
                                                 padding: const EdgeInsets.only(left: 8.0,top: 8),
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
                                                           )),
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
                                                                   .bold
                                                           )),
                                                     ),
                                                     SizedBox(
                                                       width: screenWidth *
                                                           0.09,
                                                     ),
                                                     Text(
                                                       "total",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                             fontSize: 20,
                                                             color: Colors
                                                                 .black,

                                                           )),
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
                                                 padding: const EdgeInsets.only(top:10,left: 10),
                                                 child: Row(
                                                   children: [
                                                     Text(
                                                       "Rs.",
                                                       style: GoogleFonts.abel(
                                                           textStyle: const TextStyle(
                                                               color: Colors
                                                                   .black,
                                                               fontSize: 18,
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
                                                     const  SizedBox(
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
                                                     const  SizedBox(
                                                       width:8,
                                                     ),
                                                     Text(
                                                       "off",
                                                       style: GoogleFonts.lobster(
                                                           textStyle: const TextStyle(
                                                             color: Colors
                                                                 .black,
                                                             fontSize: 25,
                                                           )),
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

      );
  }
}
