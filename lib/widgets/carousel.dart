import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit/widgets/carouselwid/pineapple.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCarouselSlider extends StatefulWidget {
  const BuildCarouselSlider({super.key});

  @override
  State<BuildCarouselSlider> createState() => _BuildCarouselSliderState();
}

class _BuildCarouselSliderState extends State<BuildCarouselSlider> {
  List carouselwidget = [
    Pineapple(),
    Pineapple(),
    Pineapple(),
    Pineapple(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int _totalDots = carouselwidget.length;

    int _validPosition(int position) {
      if (position >= _totalDots) return 0;
      if (position < 0) return _totalDots - 1;
      return position;
    }

    return CarouselSlider.builder(
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = _validPosition(index);
          });
        },
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: 15,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        child: carouselwidget[_currentIndex],
      ),
    );
  }
}
