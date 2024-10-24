import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teen_patti/model/player_model.dart';
import 'package:teen_patti/providers/thirty_one_game_provider.dart';
import 'package:teen_patti/widgets/game_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final ThirtyOneGameProvider _gameProvider;

  @override
  void initState() {
    _gameProvider = Provider.of<ThirtyOneGameProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Game"),
        actions: [
          TextButton(
            onPressed: () async {
              final players = [
                PlayerModel(name: "Tyler", isHuman: true),
                PlayerModel(name: "Bot", isHuman: false),
              ];

              await _gameProvider.newGame(players);
            },
            child: const Text(
              "New Game",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: const GameBoard(),
    );
  }
}