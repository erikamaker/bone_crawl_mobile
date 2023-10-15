import 'gamepiece.dart';

final List<GamePiece> levelPieces = [
  Dungeon([
    "cell",
    "dungeon",
    "prison",
    "jail"
  ], [
    [0, 0, 0],
    [0, 1, 0],
    [0, 2, 0]
  ], "- You're in a cold prison cell.\nIt's dark and mostly empty.\n\n\n"),

//

  BrassKey([
    "key",
    "skeleton key",
    "brass key",
  ], [
    [0, 0, 0]
  ], " - A brass key lies on the floor.\n\n\n"),

//

  IronDoor([
    "door",
    "iron door",
  ], [
    [0, 0, 0]
  ], "- You stand at the threshold of\n a thick and rusty iron door.\n\n\n"),
];
