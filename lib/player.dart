// Imports Hud class
import 'hud.dart';

// Declare Player class with vitals / position / inventory
class Player {
  int hearts;
  int spirit;
  List<int> position;
  Map<String, int> inventory;

  // Define the constructor for this class / initialize instance variables with default values.
  // Like `def initialize` in Ruby, this sets the initial state for our class instances.
  Player()
      : hearts = 3,
        spirit = 4,
        position = [0, 0, 0],
        inventory = {'silver': 0, 'keys': 2};

  // Define method `buildhud` which builds the returned Hud class after passing player values.
  Hud buildHud() {
    return Hud(
      hearts: hearts,
      spirit: spirit,
      keys: inventory['keys'] ??
          0, // Null aware operator `??` checks if inventory has keys (if not, default becomes `0` instead of null.)
    );
  }
}
