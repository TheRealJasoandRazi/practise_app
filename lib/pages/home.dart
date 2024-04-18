import 'package:flutter/material.dart';

Widget _buildBoxWithTextAndIcon(String text, IconData iconData, double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final small_box_width = screenWidth * 0.10;
    final small_box_height = screenHeight * 0.06;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: false,
        title: Text(
          'Choose Song',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            ),
        )
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBoxWithTextAndIcon('All', Icons.holiday_village, small_box_width, small_box_height),
              _buildBoxWithTextAndIcon('Classic', Icons.cabin, small_box_width, small_box_height),
              _buildBoxWithTextAndIcon('Podcasts', Icons.podcasts, small_box_width, small_box_height),
              _buildBoxWithTextAndIcon('Trending', Icons.fire_extinguisher, small_box_width, small_box_height),
              _buildBoxWithTextAndIcon('Hip Hop', Icons.power_input, small_box_width, small_box_height),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(16.0), // Adding left padding
              child: Text(
                "Editor's Choice",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.25,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20), // Adding border radius
                ),
              ),
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.25,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20), // Adding border radius
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(16.0), // Adding left padding
              child: Text(
                "Popular",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.9, // 80% of screen width
              height: screenHeight * 0.15, // Adjust the height as needed
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 163, 67, 67),
                borderRadius: BorderRadius.circular(30)
              ),
            ),
            SizedBox(height: 10), // Add space between rectangles
            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 80% of screen width
              height: screenHeight * 0.15, // Adjust the height as needed
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 48, 82, 110),
                borderRadius: BorderRadius.circular(30)
              ),
            ),
            SizedBox(height: 10), // Add space between rectangles
            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 80% of screen width
              height: screenHeight * 0.15, // Adjust the height as needed
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 16, 42, 63),
                borderRadius: BorderRadius.circular(30)
              ),
            ),
        ],
      ),
    );
  }
}