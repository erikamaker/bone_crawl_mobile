class GamePiece {
  List<String> targets;
  List<List<int>> coords;

  GamePiece(this.targets, this.coords);

  bool includesPlayer(List<int> position) {
    for (var position in coords) {
      if (coords[0] == position[0] &&
          coords[1] == position[1] &&
          coords[2] == position[2]) {
        return true;
      }
    }
    return false;
  }

  void displayBackdrop() {
    // Override this method in subclasses.
  }
}

class Dungeon extends GamePiece {
  String backdrop;

  Dungeon(List<String> targets, List<List<int>> coords, this.backdrop)
      : super(targets, coords);

  @override
  String displayBackdrop() {
    return backdrop;
  }
}

class IronDoor extends GamePiece {
  String backdrop;

  IronDoor(List<String> targets, List<List<int>> coords, this.backdrop)
      : super(targets, coords);

  @override
  String displayBackdrop() {
    return backdrop;
  }
}

class BrassKey extends GamePiece {
  String backdrop;

  BrassKey(List<String> targets, List<List<int>> coords, this.backdrop)
      : super(targets, coords);

  @override
  String displayBackdrop() {
    return backdrop;
  }
}
