import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class BottomAdds extends StatefulWidget {
  const BottomAdds({Key? key}) : super(key: key);

  @override
  State<BottomAdds> createState() => _BottomAddsState();
}

class _BottomAddsState extends State<BottomAdds> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'asset/image/hotel1.jpeg',
      'asset/image/hotel2.jpeg',
      'asset/image/hotel3.jpeg',
      'asset/image/hotel4.jpeg',
      'asset/image/hotel5.jpeg',
      // Add more image paths as needed
    ];

    return Container(
      alignment: Alignment.bottomCenter,
      height: 210,
      decoration: BoxDecoration(
       // color: Theme.of(context).colorScheme,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            // Set the height of the slider
            enableInfiniteScroll: true,
            // Allow infinite scrolling
            autoPlay: true,
            // Auto-play the slider
            autoPlayInterval: const Duration(seconds: 3),
            // Auto-play interval
            autoPlayAnimationDuration: const Duration(milliseconds: 900),
            // Animation duration
            pauseAutoPlayOnTouch: true,
            // Pause auto-play on touch
            enlargeCenterPage: true, // Enlarge the center image
          ),
          items: images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  // width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(199, 2, 5, 52),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        width: double.infinity,
                        height: 80,
                        child: const Text(
                          'Some Message Comes with advertisement ',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            wordSpacing: 2,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            textBaseline: TextBaseline.alphabetic,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
