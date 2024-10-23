import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchanything,
                  hintStyle: TextStyle(
                    color: textfieldGrey,
                  ),
                ),
              ),
            ),
            //swiper brands
            VxSwiper.builder(
              aspectRatio: 16/9,
              autoPlay: true,
              height: 150,
              enlargeCenterPage: true,
              itemCount: slidersList.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  slidersList[index],
                  fit: BoxFit.fill,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
