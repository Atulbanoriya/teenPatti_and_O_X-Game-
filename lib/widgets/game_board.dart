import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teen_patti/model/card_model.dart';
import 'package:teen_patti/model/player_model.dart';
import 'package:teen_patti/providers/thirty_one_game_provider.dart';
import 'package:teen_patti/widgets/card_list.dart';
import 'package:teen_patti/widgets/deck_pile.dart';
import 'package:teen_patti/widgets/discard_pile.dart';
import 'package:teen_patti/widgets/player_info.dart';


class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThirtyOneGameProvider>(builder: (context, model, child) {
      return model.currentDeck != null
          ? Column(
        children: [
          PlayerInfo(turn: model.turn),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await model
                                  .drawCards(model.turn.currentPlayer);
                            },
                            child: DeckPile(
                              remaining: model.currentDeck!.remaining,
                            ),
                          ),
                          const SizedBox(width: 8),
                          DiscardPile(
                            cards: model.discards,
                            onPressed: (card) {
                              model.drawCardsFromDiscard(
                                  model.turn.currentPlayer);
                            },
                          ),
                        ],
                      ),
                      if (model.bottomWidget != null &&
                          model.showBottomWidget)
                        model.bottomWidget!
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CardList(
                    player: model.players[1],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (model.turn.currentPlayer ==
                            model.players[0])
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ...model.additionalButtons
                                .map((button) => Padding(
                              padding:
                              const EdgeInsets.only(
                                  right: 4),
                              child: ElevatedButton(
                                  onPressed: button.enabled
                                      ? button.onPressed
                                      : null,
                                  child:
                                  Text(button.label)),
                            ))
                                .toList(),
                            ElevatedButton(
                                onPressed: model.canEndTurn
                                    ? () {
                                  model.endTurn();
                                }
                                    : null,
                                child: const Text("End Turn"))
                          ],
                        )
                            : Container(),
                      ),
                      CardList(
                        player: model.players[0],
                        onPlayCard: (CardModel card) {
                          model.playCard(
                              player: model.players[0], card: card);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
          : Center(
        child: TextButton(
          child: Text("New Game?"),
          onPressed: () {
            final players = [
              PlayerModel(name: "Tyler", isHuman: true),
              PlayerModel(name: "Bot", isHuman: false),
            ];
            model.newGame(players);
          },
        ),
      );
    });
  }
}