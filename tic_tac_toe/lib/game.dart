import 'package:flutter/foundation.dart';

class TicTacToe with ChangeNotifier {
  List<String> _board = List.filled(9, '');
  String _currentPlayer = 'X';

  List<String> get board => _board;
  String get currentPlayer => _currentPlayer;

  void play(int index) {
    if (_board[index] == '' && !isGameOver()) {
      _board[index] = _currentPlayer;
      notifyListeners();
      if (isGameOver()) {
        // Handle end of game (you might want to show a dialog or reset the game)
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
    }
  }

  bool isGameOver() {
    // Check rows, columns, and diagonals for a win
    return _checkWin('X') || _checkWin('O') || !_board.contains('');
  }

  bool _checkWin(String player) {
    final winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    return winPatterns.any((pattern) =>
        _board[pattern[0]] == player &&
        _board[pattern[1]] == player &&
        _board[pattern[2]] == player);
  }

  void reset() {
    _board = List.filled(9, '');
    _currentPlayer = 'X';
    notifyListeners();
  }
}
