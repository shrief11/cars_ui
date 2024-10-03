import 'package:flutter/material.dart';
import '../constants/style.dart';

class Stories extends StatelessWidget {
  final List<String> storyImages = [
    'assets/images/lotus.jpeg',
    'assets/images/lamborghini.jpeg',
    'assets/images/ferrari.jpeg',
    'assets/images/mclaren.jpg',
    'assets/images/bmw.jpg',
    'assets/images/Mercedes.jpg',
    'assets/images/jeep.png',
  ];

  final List<String> storyNames = [
    'lotus',
    'lamborghini',
    'ferrari',
    'mclaren',
    'BMW',
    'Mercedes',
    'jeep',
  ];

  Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: storyImages.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4), // Spacing between stories
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 60, // Width of the story circle
                        height: 60, // Height of the story circle
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kBord, width: 2), // Border for story
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            storyImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Space below the story
                  Text(storyNames[index]), // Display the corresponding name
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


