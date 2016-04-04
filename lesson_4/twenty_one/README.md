# Rules of Twenty-One

* You start with a normal 52-card deck consisting of the 4 suits (hearts, diamonds, clubs, and spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).

* The goal of Twenty-One is to try to get as close to 21 as possible, without going over. If you go over 21, it's a "bust" and you lose.

* Setup: The game consists of a "dealer" and a "player". Both participants are initially dealt 2 cards. The player can see their 2 cards, but can only see one of the dealer's cards.

* Card values: card values are pretty straight forward, except for the ace. All numbers 2 through 10 are worth their face value. Jack, queen and king are worth 10. An ace, however, can be worth either 1 or 11. For example, if you have a hand of: 4, ace, jack, then the total value of your hand is 15. The ace in this case is worth 1, because if it were worth 11, the hand would be worth 25, which is a bust. It can get tricky if there are multiple aces in a hand, so your program must account for that.

Card         | Value
------------ | -------------
2 - 10 | face value
jack, queen, king | 10
ace | 1 or 11

* Player turn: the player goes first, and can decide to either "hit" or "stay". A hit means the player will ask for another card. Remember that if the total exceeds 21, then the player "busts" and loses. The decision to hit or stay will depend on what the player's cards are and what the player thinks the dealer has. For example, if the dealer is showing a "10" (the other card is hidden), and the player has a "2" and a "4", then the obvious choice is for the player to "hit". The player can continue to hit as many times as they want. The turn is over when the player either busts or stays. If the player busts, the game is over and the dealer won.

* Dealer turn: when the player stays, it's the dealer's turn. The dealer must follow a strict rule for determining whether to hit or stay: hit until the total is at least 17. If the dealer busts, then the player wins.

* Comparing cards: when both the player and the dealer stay, it's time to compare the total value of the cards and see who has the highest value.

## Examples of Gameplay

To give you an idea of how to play, try to decide what to do in each scenario:

1.
Dealer has: Ace and unknown card
You have: 2 and 8

You should "hit" in this scenario. You see the dealer has an "Ace", which means the dealer has a high probability of having a 21, the optimal number. On top of that, your total of 10 can only benefit from an extra card, as there's no way you can bust.

2.
Dealer has: 7 and unknown card
You have: 10 and 7

You should "stay" here, because chances are good that the unknown card is not an Ace, which is the only situation where you can lose. Most likely, you're going to win with 17, or tie. There's a very small chance you will lose.

3.
Dealer has: 5 and unknown card
You have: Jack and 6

This one is a little tricky, and at first glance, you may think that either a "hit" or "stay" would be appropriate. You have 16 and you could maybe try to get lucky and land a card less than 6. That would be ok reasoning, except for the fact that the dealer has a 5. You're anticipating that the unknown card is worth 10, thereby making the dealer's cards worth 15. This means the dealer must hit, and there's a good chance the dealer will bust. The best move here is to "stay", and hope the dealer busts.

Hopefully that gives you an idea of how fun and tricky this game can be, despite the simple rules!

## Implementation Steps
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.