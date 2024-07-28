import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../util/dt_assets.dart';

class FeaturedBookBanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(

      child: CarouselSlider(
        options: CarouselOptions(
          height: screenHeight*0.3,
          aspectRatio: 20 / 9,
          viewportFraction:0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: [
          DTImages.b17,
          DTImages.b18,

        ].map((imagePath) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset(
                imagePath,
                fit: BoxFit.cover,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
