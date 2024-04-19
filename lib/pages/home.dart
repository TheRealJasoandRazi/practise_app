import 'package:flutter/material.dart';

Widget _buildBoxWithTextAndIcon(String text, IconData iconData, double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(15),
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

Widget _showPlainText(double padding, String text, double fontsize) {
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.all(padding), // Adding left padding
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontsize,
          color: Colors.white
        ),
        textAlign: TextAlign.start,
      ),
    ),
  );
}

Widget _longBottomRectangles(double borderRadius, double width, Color color, BuildContext context){
  return Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width * width, // 90% of screen width
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final small_box_width = screenWidth * 0.15;
    final small_box_height = screenHeight * 0.08;

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
          _showPlainText(16.0, "Editor's Choice", 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.25,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      // Add other widgets (text, icons, etc.) here if needed
                    ],
                  ),
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
          _showPlainText(16.0, "Popular", 30),
          Expanded( //bottom three rectangles
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center containers in the column
              children: [
                _longBottomRectangles(30, 0.9, const Color.fromARGB(255, 163, 67, 67), context),
                SizedBox(height: 10), // Add space between containers
                _longBottomRectangles(30, 0.9, const Color.fromARGB(255, 48, 82, 110), context),
                SizedBox(height: 10), // Add space between containers
                _longBottomRectangles(30, 0.9, const Color.fromARGB(255, 16, 42, 63), context),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
        ],
      ),
    );
  }
}