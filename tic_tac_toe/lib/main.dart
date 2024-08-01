import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TicTacToe(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToePage(),
    );
  }
}

class TicTacToePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<TicTacToe>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => game.play(index),
                child: Container(
                  margin: EdgeInsets.all(4.0),
                  color: Colors.blue[100],
                  child: Center(
                    child: Text(
                      game.board[index],
                      style: TextStyle(fontSize: 32.0),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => game.reset(),
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }
}
