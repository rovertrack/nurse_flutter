import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCarousel extends StatefulWidget {
  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0; // Track the current slide index
  final List<String> _bannerImages = [
    'images/banner.png', // Replace with your image paths
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items:
              _bannerImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(color: Colors.black12,blurStyle: BlurStyle.solid),BoxShadow(
                            color: Colors.black12,
                            blurRadius: 23,
                            offset: Offset(2, 1),
                            spreadRadius: -20,)],
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.95,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
            height: 200.0, // Height of the carousel
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Update the current index
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              _bannerImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap:
                      () => setState(() {
                        _currentIndex = entry.key;
                      }),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == entry.key
                              ? Colors.blue
                              : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
