// ignore_for_file: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'player.dart';
import 'hud.dart';
import 'gamepiece.dart';
import 'level_1.dart';

// The main function where the app starts
void main() {
  runApp(MyApp());
}

// MyApp class
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// _MyAppState class
class _MyAppState extends State<MyApp> {
  late Player player;
  late Dungeon dungeon;
  late BrassKey key;
  late IronDoor door;
  late String storyText; // Declare new variable here

  void initState() {
    super.initState();
    player = Player();
    dungeon = levelPieces[0] as Dungeon; // Example Dungeon
    key = levelPieces[1] as BrassKey; // Example Key
    door = levelPieces[2] as IronDoor;
    storyText = dungeon.backdrop + door.backdrop + key.backdrop;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      title: 'Bone Crawl Demo', // App title
      home: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 14, 1, 26), // Set background color
          child: Column(
            children: [
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Hud(
                    hearts: player.hearts,
                    spirit: player.spirit,
                    keys: player.inventory['keys'] ?? 0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 150.0,
                      bottom: 50.0), // Added bottom padding of 40 pixels
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        storyText,
                        // Duplicating for scrollable test
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontFamily: 'Courier New',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0), // Added this
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 50.0),
                  child: Row(
                    children: [
                      IconTheme(
                        data: IconThemeData(
                          size: 60,
                        ),
                        child: Icon(Icons.keyboard_arrow_right,
                            color: Colors.blueGrey),
                      ),
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.grey[200],
                              fontFamily: 'Courier New',
                              fontSize: 20.0),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80.0,
          child: BottomAppBar(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left, color: Colors.orange),
                  iconSize: 40.0,
                  onPressed: () {
                    print("Left arrow pressed");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.orange),
                  iconSize: 30.0,
                  onPressed: () {
                    setState(() {
                      print("Menu button pressed");
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right, color: Colors.orange),
                  iconSize: 40.0,
                  onPressed: () {
                    print("Right arrow pressed");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
