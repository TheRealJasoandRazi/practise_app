import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              Container(
                width: screenWidth * 0.10,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20), // Adding border radius
                ),
              ),
              Container(
                width: screenWidth * 0.10,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20), // Adding border radius
                ),
              ),
              Container(
                width: screenWidth * 0.10,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20), // Adding border radius
                ),
              ),
              Container(
                width: screenWidth * 0.10,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20), // Adding border radius
                ),
              ),
              Container(
                width: screenWidth * 0.10,
                height: screenHeight * 0.06,
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