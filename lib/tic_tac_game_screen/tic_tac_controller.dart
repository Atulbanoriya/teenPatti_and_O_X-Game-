import 'package:get/get.dart';

class TicTacController extends GetxController {
  var board = List.filled(9, '').obs;
  var currentPlayer = 'X'.obs;
  var winner = ''.obs;
  var isGameOver = false.obs;

  // Reset the game board
  void resetGame() {
    board.value = List.filled(9, '');
    currentPlayer.value = 'X';
    winner.value = '';
    isGameOver.value = false;
  }

  void makeMove(int index) {
    if (board[index].isEmpty && !isGameOver.value) {
      board[index] = currentPlayer.value;
      if (checkWinner()) {
        winner.value = '${currentPlayer.value} wins!';
        isGameOver.value = true;
      } else if (board.every((element) => element.isNotEmpty)) {
        winner.value = 'It\'s a Draw!';
        isGameOver.value = true;
      } else {
        currentPlayer.value = currentPlayer.value == 'X' ? 'O' : 'X';
      }
    }
  }

  // Check for winner
  bool checkWinner() {
    const winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6]             // Diagonals
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]] == currentPlayer.value &&
          board[combo[1]] == currentPlayer.value &&
          board[combo[2]] == currentPlayer.value) {
        return true;
      }
    }
    return false;
  }
}
