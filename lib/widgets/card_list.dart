import 'package:flutter/material.dart';
import 'package:teen_patti/model/player_model.dart';
import 'package:teen_patti/widgets/constants.dart';
import 'package:teen_patti/widgets/playing_card.dart';

import '../model/card_model.dart';

class CardList extends StatelessWidget {
  final double size;
  final PlayerModel player;
  final Function(CardModel)? onPlayCard;

  const CardList({
    super.key,
    required this.player,
    this.size = 1,
    this.onPlayCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CARD_HEIGHT * size,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: player.cards.length,
        itemBuilder: (context, index) {
          final card = player.cards[index];
          return PlayingCard(
            card: card,
            size: size,
            // visible: player.isHuman,
            visible: true,
            onPlayCard: onPlayCard,
          );
        },
      ),
    );
  }
}