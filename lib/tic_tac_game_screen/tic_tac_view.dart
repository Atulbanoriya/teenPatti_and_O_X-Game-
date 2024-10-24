import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teen_patti/tic_tac_game_screen/tic_tac_controller.dart';

class TicTacView extends GetView<TicTacController> {
  const TicTacView({super.key});

  @override
  Widget build(BuildContext context) {
    final TicTacController controller = Get.put(TicTacController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin Patii - Tic Tac Toe'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Current Player: ${controller.currentPlayer.value}',
              style: const TextStyle(fontSize: 24),
            )),
            const SizedBox(height: 20),
            _buildBoard(controller),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.winner.isNotEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) {
                    _showAnimatedWinnerDialog(context, controller.winner.value);
                  }
                });
              }
              return const SizedBox(); // Return an empty widget when no winner
            }),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: controller.resetGame,
              child: Container(
                width: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffafca1e)
                ),
                child: const Center(
                    child: Text(
                      "Reset Game",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the 3x3 board using a GridView
  Widget _buildBoard(TicTacController controller) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => controller.makeMove(index),
          child: Obx(() => Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                controller.board[index], // Observable state used here
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
        );
      },
    );
  }

  // Function to show animated winner dialog
  void _showAnimatedWinnerDialog(BuildContext context, String winnerName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: AnimationController(
              vsync: NavigatorState(),
              duration: const Duration(milliseconds: 500),
            )..forward(),
            curve: Curves.easeInOut,
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text('🎉 Winner! 🎉', style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
            content: Text('Congratulations, $winnerName!', textAlign: TextAlign.center),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}



