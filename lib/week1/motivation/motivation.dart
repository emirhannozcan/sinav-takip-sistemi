import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Motivation extends StatelessWidget {
  Motivation({Key? key}) : super(key: key);
  late String text;

  List<Widget> photos = [
    Image.asset(
      'assets/images/resim1.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/resim2.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/resim3.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/resim4.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/resim5.png',
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageSlideshow(
        width: double.infinity,
        height: double.infinity,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        children: photos,
        autoPlayInterval: 3000,
        isLoop: true,
      ),
    );
  }
}
