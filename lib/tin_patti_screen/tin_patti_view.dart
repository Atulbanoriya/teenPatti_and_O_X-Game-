import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/routes.dart';
import 'tin_patti_controller.dart';
import 'package:playing_cards/playing_cards.dart';

class TinPattiGameScreen extends StatelessWidget {
  TinPattiGameScreen({super.key});
  final TinPattiController controller = Get.put(TinPattiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Tin Patti Game'),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDealerHand(),
              const SizedBox(height: 20),
              _buildPlayerHand(),
              const SizedBox(height: 20),
              _buildGameControls(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Click Here to Play?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      if (context.mounted) {
                        Get.toNamed('/tin_patti_view');
                      }
                    },
                    child: const Text(
                      "Tic Tac Game",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.greenAccent,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDealerHand() {
    return Column(
      children: [
        const Text('Dealer\'s Cards', style: TextStyle(fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.dealerCards.map((card) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 80, // You can adjust the width/height as per your design
                height: 100, // Adjust the height as well
                child: PlayingCardView(
                  card: card,
                  showBack: true,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPlayerHand() {
    return Column(
      children: [
        const Text('Your Cards', style: TextStyle(fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.playerCards.map((card) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 80, // Set the width for the card
                height: 100, // Set the height for the card
                child: PlayingCardView(
                  card: card,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildGameControls() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Expanded(
              child: GestureDetector(
                onTap: controller.isGameOver.value ? null : controller.checkWinner,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffafca1e)
                  ),

                  child: const Center(
                      child: Text(
                      "Check Winner",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),
                ),
              ),
            ),


            const SizedBox(
              width: 20,
            ),

            Expanded(

              child: GestureDetector(
                onTap: controller.resetGame,
                child: Container(
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
            ),
          ],
        ),


        const SizedBox(
          height: 20,
        ),

        if (controller.isGameOver.value)
          Text('Winner: ${controller.winner.value}', style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}

