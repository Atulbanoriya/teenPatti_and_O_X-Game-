import 'package:get/get.dart';
import 'package:playing_cards/playing_cards.dart';
import 'dart:math';

class TinPattiController extends GetxController {
  RxList<PlayingCard> playerCards = <PlayingCard>[].obs;
  RxList<PlayingCard> dealerCards = <PlayingCard>[].obs;
  RxBool isPlayerTurn = true.obs;
  RxBool isGameOver = false.obs;
  RxString winner = ''.obs;

  final Random _random = Random();

  @override
  void onInit() {
    startGame();
    super.onInit();
  }


  void startGame() {
    playerCards.clear();
    dealerCards.clear();
    isGameOver.value = false;
    winner.value = '';
    playerCards.addAll(_generateRandomCards(3));
    dealerCards.addAll(_generateRandomCards(3));
  }


  List<PlayingCard> _generateRandomCards(int count) {
    List<PlayingCard> cards = [];
    for (int i = 0; i < count; i++) {
      cards.add(PlayingCard(

        Suit.values[_random.nextInt(4)],
        CardValue.values[_random.nextInt(13)],

        //
        // PlayingCardSuit.values[_random.nextInt(4)],  // Random suit (0-3)
        // PlayingCardValue.values[_random.nextInt(13)], // Random value (0-12)
        )
      );
    }
    return cards;
  }


  void checkWinner() {
    isGameOver.value = true;
    winner.value = "Player Wins";
  }

  // Reset the game
  void resetGame() {
    startGame();
  }
}
