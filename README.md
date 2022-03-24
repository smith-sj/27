# Twent-Sevens        

To play, imagine a game of Naughts & Crosses in a 3d space.
The 3d space is represented with 3 game boards, the left most
board (board 1) representing the bottom plane, and the right
most board (board 3) representing the top plane. Board 2
represents the middle plane.
```
board 1    board 2    board 3

| | | |    | | | |    | | | |
| | | |    | | | |    | | | |
| | | |    | | | |    | | | |
```
Combos of 3 can be made between planes or on a single plane; however,
you may only play on board 2 and 3, if the corresponding square
has been filled on the previous board. (Imagine pieces are being 
stacked.)

Unlike Naughts & Crosses, the game does not end when a combo is
made. Instead, the player is awarded points for the combo
and the game continues until every square has been filled or
one of the players forfeits.

Points are awarded as such: 

cross-plane combos  = 2 points
single-plane combos = 3 points

Examples:

3 o's are placed in a flat row; this is called
a "flat" and is awarded 3 points.

```
| | | |     | | | |    | | | |
| | | |     | | | |    | | | |
|o|o|o|     | | | |    | | | | = 3 points

   __ _ _
  /_/_/_/\
 /_/_/_/\/\
/_/_/_/\/\/\
\_\_\_\/\/\/
 \_\_\_\/\/
  \o\o\o\/

```


3 x's are stacked on top of each other; this is called 
a "pillar" and is awarded 2 points.

```
| | | |     | | | |    | | | |
| | | |     | | | |    | | | |
| | |x|     | | |x|    | | |x| = 2 points
   __ _ _
  /_/_/_/\
 /_/_/_/\/\
/_/_/_/\/\/\
\_\_\x\/\/\/
 \_\_\x\/\/
  \_\_\x\/

```

3 x's are stacked from left to right and bottom to top; 
this is called "stairs" and is awarded 2 points. 

```
| | | |     | | | |    | | | |
| | | |     | | | |    | | | |
|x| | |     |o|x| |    |o|o|x| = 2 points             
   __ _ _
  /_/_/_/\
 /_/_/_/\/\
/_/_/_/\/\/\
\x\_\_\/\/\/
 \o\x\_\/\/
  \o\o\x\/

```
3 o's are stacked diagonally from one corner to the opposite
and from bottom to top. This is called "diamond stairs"
and is awarded 2 points.

 ```
|o| | |     |o| | |    |x| | |
| |o| |     | |x| |    | | | |
| | |x|     | | | |    | | | | = 2 points
   __ 
  /x/\ _ _
  \_\/_/_/\
  /_/x/_/\/\
 /_/\_\_\/\/
 \_\/_/x/\/
  \_\_\_\/

```


THIS IS AN ILLEGAL MOVE AS THE CROSSES ON BOARD 2 AND 3 CAN
NOT BE STACKED ON TOP OF EMPTY SQUARES.
```
|x| | |    | |x| |    | | |x|
| | | |    | | | |    | | | |
| | | |    | | | |    | | | |
```

When playing on pen and paper, it's best practice to tally your own score
as you go. 

A good house rule is that if you fail to notice a combo before your next turn, 
then you miss out on the points. Either way, tallying up points at the end of 
the game is an arduous task, and not recommended.

