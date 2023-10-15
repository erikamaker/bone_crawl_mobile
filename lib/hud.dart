// Imports Flutter Material package, for standard design and widgit tools.
import 'package:flutter/material.dart';

// Declares new class for heads up display.
// Stateless widgets describe part of the user interface which doesn't change dynamically.
class Hud extends StatelessWidget {
  // Declares immutable integer variables. `final` == value cannot change once set.
  // That said, with every new main loop, the `final` value may change depending on the Player.
  // IE: If the Player updates these attributes, the new Hud snapshot will change.
  final int hearts;
  final int spirit;
  final int keys;

  // This is the constructor for the Hud class. It initializes instances of the Hud class with these required attributes.
  Hud({required this.hearts, required this.spirit, required this.keys});

  // It takes an integer count as an argument and returns a list of Flutter Widgets.
  // This returns the widgit list for hearts.
  List<Widget> buildHearts(int count) {
    List<Widget> list = []; // Declare an empty list
    for (var i = 0; i < count; i++) {
      // Declare default value for i, and increment if less than Player's count of hearts.
      list.add(Icon(Icons.favorite, color: Colors.red));
    } // Filled hearts.
    for (var i = count; i < 4; i++) {
      // Keep old value, and increment a cyan heart until we finally hit a count of 4.
      list.add(Icon(Icons.favorite, color: Colors.cyan));
    } // Empty hearts.
    return list; // Return the full widgit list of red and cyan hearts.
  }

  // Parallell logic to the buildHearts method. Easy peasy.
  List<Widget> buildSquares(int count) {
    List<Widget> list = [];
    for (var i = 0; i < count; i++) {
      list.add(Icon(Icons.crop_square, color: Colors.yellow));
    } // Filled spirit.
    for (var i = count; i < 4; i++) {
      list.add(Icon(Icons.crop_square, color: Colors.cyan));
    } // Empty spirit.
    return list;
  }

  // The build method in our Hud class is overriding the build method from its superclass, StatelessWidget.
  // This is standard to Flutter. We are expected to provide our own `build`, to define what the UI should actually look like.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set the height of our header.
      padding: const EdgeInsets.all(16.0), // Add padding to our header items.
      color: Colors.black, // Set the color of the header.

      child: Padding(
        // Add padding to the sides of the Hud icon list widgit.
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        // This configures the following children to line up horizontally, on a row.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Squares (Spirit)
            Row(
              children: buildSquares(spirit),
            ),
            // Spacer
            SizedBox(width: 20),
            // Hearts
            Row(
              children: buildHearts(hearts),
            ),
            // Spacer
            SizedBox(width: 20),
            // Keys

            // Set icon style, then update color / transparency based on key count.
            Icon(Icons.key_sharp,
                color: keys > 0 ? Colors.orange : Colors.transparent),
          ],
        ),
      ),
    );
  }
}
