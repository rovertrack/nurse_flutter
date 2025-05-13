import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCarousel extends StatefulWidget {
  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0; // Track the current slide index
  final List<String> _bannerImages = [
    'assets/icons/pin.png', // Replace with your image paths
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
                    return Card(
                      elevation: 4, // Add shadow to the card
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ), // Rounded corners
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          15,
                        ), // Clip image to match card corners
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width:
                              double.infinity, // Make the image fill the card
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
