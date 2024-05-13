import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/shop.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}



class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(const Duration(seconds: 3), () {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> const ShopScreen()));
   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/c.jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/shop.png"),
                ),
                SpinKitThreeInOut(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index.isEven ? Colors.black : Colors.black,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
