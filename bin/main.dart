import 'dart:io';

// Last time you wrote PrintBoard function which takes in the board and prints it to the console
// Today you have to take user input and populate the Board at required location

// Challenge 1
// Take user input like A1, B3, C2 etc. and put 'X' or 'O' in required places turn by turn

//  A   B   C
// 1   |   |
//  ---+---+---
// 2   |   |
//  ---+---+---
// 3   |   |

// X's move:
// A2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  X |   |
//    ---+---+---
//  3    |   |

//  0's move:
//  B2

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    |   |

//  X's move:
//  B3

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    | X |

//  0's move:
//  A2

//  A   B   C
// 1    |   |
//   ---+---+---
// 2  0 | 0 |
//   ---+---+---
// 3    | X |

//  X's move:
//  B2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  0 | X |
//    ---+---+---
//  3    | X |
//  0's move:

// HINT: to get string character you can use [], example String name ='Arnav'; name[0] gives 'A'

// Challenge 2
// Validate the move
// In case if there is already an entry on board print invalid move

main() {
  String input = null;
  int count = 1;
  int i = 1;
  var boardSize = 3;
  List<List<String>> board =
      List.generate(boardSize, (_) => List.filled(boardSize, ' '));
  printBoard(board);
  while (i <= 9) {
    if (count % 2 != 0) {
      print('X\'s move ');
      input = stdin.readLineSync();
      if (board[rowGetter(input)][colGetter(input)] == ' ') {
        board[rowGetter(input)][colGetter(input)] = 'X';
        printBoard(board);
      } else {
        print('invalid move');
        print('X\'s move ');
        input = stdin.readLineSync();
        board[rowGetter(input)][colGetter(input)] = 'X';
        printBoard(board);
      }
      count += 1;
    } else {
      print('O\'s move ');
      input = stdin.readLineSync();
      if (board[rowGetter(input)][colGetter(input)] == ' ') {
        board[rowGetter(input)][colGetter(input)] = 'O';
        printBoard(board);
      } else {
        print('invalid move');
        print('O\'s move ');
        input = stdin.readLineSync();
        board[rowGetter(input)][colGetter(input)] = 'O';
        printBoard(board);
      }
      count += 1;
    }
    i += 1;
  }
}

int colGetter(String x) => (['A', 'B', 'C'].indexOf(x[0]));

int rowGetter(String x) => ([1, 2, 3].indexOf(int.parse(x[1])));

void printBoard(List<List<String>> board) {
  List<String> rows = board.map(rowToString).toList();
  print('   A   B   C ');
  print('1 ${rows[0]}');
  print('  ---+---+---');
  print('2 ${rows[1]}');
  print('  ---+---+---');
  print('3 ${rows[2]}');
}

String rowToString(List<String> row) {
  return row.map((String val) => ' $val ').join('|');
}
