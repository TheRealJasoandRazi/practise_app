import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'secondpage.dart';

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

Widget _longBottomRectangles(double borderRadius, double width, Color color, BuildContext context, String title, String author){
  return Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width * width, // 90% of screen width
      decoration: BoxDecoration(
        //color: color,
        gradient: LinearGradient(
          colors: [
              darkenColor(color, 0.3), // Darker pink
              darkenColor(color, 0.9), // Lighter pink
          ],
          begin: Alignment.topLeft, // Start point of the gradient
          end: Alignment.bottomRight, // End point of the gradient
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          // Make the Container take up the first quarter (25%) of the Row
          Expanded(
            flex: 1, // The flex value for the Container
            child: Container(
              alignment: Alignment.center, // Center the icon in the Container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius), // Set the top-left corner radius
                  bottomLeft: Radius.circular(borderRadius), // Set the bottom-left corner radius
                ),
                color: darkenColor(color, 0.5), // You can specify a different color or shade
              ),
              child: Icon(
                Icons.play_arrow, // You can change the icon to your preferred one
                color: Colors.white,
                size: 40, // Adjust the icon size as needed
              ),
            ),
          ),
          // Make the Column take up the remaining space
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left side
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    author,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ),
  );
}

Color darkenColor(Color color, double factor) {
  // Ensure the factor is between 0 and 1, where lower means darker
  assert(factor >= 0 && factor <= 1);

  // Calculate the darker RGB values
  int red = (color.red * factor).toInt().clamp(0, 255);
  int green = (color.green * factor).toInt().clamp(0, 255);
  int blue = (color.blue * factor).toInt().clamp(0, 255);

  // Return a new color with the darker RGB values
  return Color.fromARGB(color.alpha, red, green, blue);
}

Widget _editorsChoiceBlocks(double width, double height, String imageUrl, String title, String author, BuildContext context){
  return Container(
    width: width,
    height: height,
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
                  imageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: height / 3, // One third of the container height
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8), // Semi-transparent black background
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space text and icon apart
                children: [
                  // Left-aligned text
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),Text(
                          author,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 18,
                          ),
                        ),
                      ]
                    ),
                  ),
                  // Right-aligned icon
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                      icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 24,
                      ),
                      onPressed: () {
                        print('Icon clicked!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.10, // Set the desired height
              width: double.infinity, // Set the width to match the container width
              child: ListView.separated(
                padding: const EdgeInsets.all(8), // Add padding
                itemCount: 8, // Total number of boxes
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                itemBuilder: (context, index) {
                    // Return the box widget for the given index
                    List<Map<String, dynamic>> data = [
                        {'text': 'All', 'icon': Icons.holiday_village},
                        {'text': 'Classic', 'icon': Icons.cabin},
                        {'text': 'Podcasts', 'icon': Icons.podcasts},
                        {'text': 'Trending', 'icon': Icons.fire_extinguisher},
                        {'text': 'Hip Hop', 'icon': Icons.power_input},
                        {'text': "90's Pop", 'icon': Icons.music_note},
                        {'text': "Jazz", 'icon': Icons.piano},
                        {'text': "UK Drill", 'icon': Icons.bathroom}
                    ];
                    return _buildBoxWithTextAndIcon(
                        data[index]['text'],
                        data[index]['icon'],
                        small_box_width,
                        small_box_height,
                    );
                },
                separatorBuilder: (context, index) {
                    // Return a SizedBox to create spacing between boxes
                    return SizedBox(width: 12);
                },
              ),
            ),
            _showPlainText(16.0, "Editor's Choice", 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _editorsChoiceBlocks(screenWidth * 0.4, screenHeight * 0.25, 
                  "https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg",
                  "Stupid Love", "Lady Gaga", context),
                _editorsChoiceBlocks(screenWidth * 0.4, screenHeight * 0.25, 
                "https://assets-global.website-files.com/655e0fa544c67c1ee5ce01c7/655e0fa544c67c1ee5ce0f7c_how-to-start-a-band-and-get-booked-header-p-800.jpeg",
                "Dark Horse", "Katy Perry", context),
              ],
            ),
            _showPlainText(16.0, "Popular", 30),
            Expanded( //bottom three rectangles
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center containers in the column
                children: [
                  _longBottomRectangles(30, 0.9, const Color.fromARGB(255, 163, 67, 67), context, "Boom, Boom, Boom", "Vengaboys"),
                  SizedBox(height: 10), // Add space between containers
                  _longBottomRectangles(30, 0.9, const Color.fromARGB(255, 48, 82, 110), context, "Djadja", "Aya Nikamura"),
                  SizedBox(height: 10), // Add space between containers
                  _longBottomRectangles(30, 0.9, const Color.fromARGB(255, 16, 42, 63), context, "Du Hast", "Rammstein"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
          ],
        ),
      ),
    );
  }
}