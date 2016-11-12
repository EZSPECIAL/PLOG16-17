/*

   Predicates for choices that have a lot of outcomes

*/

%Builds 3x3 cells linearly, based on the values stored in the board, also adds vertical padding
%Also receives Player in case there's one to display on that cell
%1 is up, then clockwise 2 up to 8, 123 would be up, up-right, right

buildCell('123', Player, [' ', '|', '/', '|', ' ', Var, '-', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('124', Player, [' ', '|', '/', '|', ' ', Var, ' ', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('125', Player, [' ', '|', '/', '|', ' ', Var, ' ', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('126', Player, [' ', '|', '/', '|', ' ', Var, ' ', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('127', Player, [' ', '|', '/', '|', '-', Var, ' ', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).

buildCell('128', Player, ['\\', '|', '/', '|', ' ', Var, ' ', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('134', Player, [' ', '|', ' ', '|', ' ', Var, '-', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('135', Player, [' ', '|', ' ', '|', ' ', Var, '-', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).

buildCell('136', Player, [' ', '|', ' ', '|', ' ', Var, '-', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).

buildCell('137', Player, [' ', '|', ' ', '|', '-', Var, '-', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('138', Player, ['\\', '|', ' ', '|', ' ', Var, '-', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('145', Player, [' ', '|', ' ', '|', ' ', Var, ' ', '|', ' ', '|', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('146', Player, [' ', '|', ' ', '|', ' ', Var, ' ', '|', '/', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('147', Player, [' ', '|', ' ', '|', '-', Var, ' ', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('148', Player, ['\\', '|', ' ', '|', ' ', Var, ' ', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('156', Player, [' ', '|', ' ', '|', ' ', Var, ' ', '|', '/', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('157', Player, [' ', '|', ' ', '|', '-', Var, ' ', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('158', Player, ['\\', '|', ' ', '|', ' ', Var, ' ', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('167', Player, [' ', '|', ' ', '|', '-', Var, ' ', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('168', Player, ['\\', '|', ' ', '|', ' ', Var, ' ', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('178', Player, ['\\', '|', ' ', '|', '-', Var, ' ', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('234', Player, [' ', ' ', '/', '|', ' ', Var, '-', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('235', Player, [' ', ' ', '/', '|', ' ', Var, '-', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('236', Player, [' ', ' ', '/', '|', ' ', Var, '-', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('237', Player, [' ', ' ', '/', '|', '-', Var, '-', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('238', Player, ['\\', ' ', '/', '|', ' ', Var, '-', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('245', Player, [' ', ' ', '/', '|', ' ', Var, ' ', '|', ' ', '|', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).

buildCell('246', Player, [' ', ' ', '/', '|', ' ', Var, ' ', '|', '/', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('247', Player, [' ', ' ', '/', '|', '-', Var, ' ', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('248', Player, ['\\', ' ', '/', '|', ' ', Var, ' ', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('256', Player, [' ', ' ', '/', '|', ' ', Var, ' ', '|', '/', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('257', Player, [' ', ' ', '/', '|', '-', Var, ' ', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('258', Player, ['\\', ' ', '/', '|', ' ', Var, ' ', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('267', Player, [' ', ' ', '/', '|', '-', Var, ' ', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('268', Player, ['\\', ' ', '/', '|', ' ', Var, ' ', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('278', Player, ['\\', ' ', '/', '|', '-', Var, ' ', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('345', Player, [' ', ' ', ' ', '|', ' ', Var, '-', '|', ' ', '|', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('346', Player, [' ', ' ', ' ', '|', ' ', Var, '-', '|', '/', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('347', Player, [' ', ' ', ' ', '|', '-', Var, '-', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('348', Player, ['\\', ' ', ' ', '|', ' ', Var, '-', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('356', Player, [' ', ' ', ' ', '|', ' ', Var, '-', '|', '/', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('357', Player, [' ', ' ', ' ', '|', '-', Var, '-', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).

buildCell('358', Player, ['\\', ' ', ' ', '|', ' ', Var, '-', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('367', Player, [' ', ' ', ' ', '|', '-', Var, '-', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('368', Player, ['\\', ' ', ' ', '|', ' ', Var, '-', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('378', Player, ['\\', ' ', ' ', '|', '-', Var, '-', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('456', Player, [' ', ' ', ' ', '|', ' ', Var, ' ', '|', '/', '|', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('457', Player, [' ', ' ', ' ', '|', '-', Var, ' ', '|', ' ', '|', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('458', Player, ['\\', ' ', ' ', '|', ' ', Var, ' ', '|', ' ', '|', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('467', Player, [' ', ' ', ' ', '|', '-', Var, ' ', '|', '/', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('468', Player, ['\\', ' ', ' ', '|', ' ', Var, ' ', '|', '/', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('478', Player, ['\\', ' ', ' ', '|', '-', Var, ' ', '|', ' ', ' ', '\\', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('567', Player, [' ', ' ', ' ', '|', '-', Var, ' ', '|', '/', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('568', Player, ['\\', ' ', ' ', '|', ' ', Var, ' ', '|', '/', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('578', Player, ['\\', ' ', ' ', '|', '-', Var, ' ', '|', ' ', '|', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
buildCell('678', Player, ['\\', ' ', ' ', '|', '-', Var, ' ', '|', '/', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
%S is Player 1's start tile, on the upper right

buildCell('S', Player, [' ', ' ', 'S', '|', ' ', Var, ' ', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
%s is Player 1's goal tile, on the lower left

buildCell('s', Player, [' ', ' ', ' ', '|', ' ', Var, ' ', '|', 's', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
%C is Player 2's start tile, on the upper left

buildCell('C', Player, ['C', ' ', ' ', '|', ' ', Var, ' ', '|', ' ', ' ', ' ', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).

%c is Player 2's goal tile, on the lower right

buildCell('c', Player, [' ', ' ', ' ', '|', ' ', Var, ' ', '|', ' ', ' ', 'c', '|']) :-
        (Player = 0, Var = ' ', !; Var = Player).
        
%N is a neutral zone, no player can move to it

buildCell('N', _, ['x', 'x', 'x', '|', 'x', 'x', 'x', '|', 'x', 'x', 'x', '|']).

%Blank cell for stage 1 of the game, constructing the board

buildCell(' ', _, [' ', ' ', ' ', '|', ' ', ' ', ' ', '|', ' ', ' ', ' ', '|']).

%Based on the cell value under a player, moveAvail creates a list
%with the possible coords of movement, to be later checked if valid

moveAvail('123', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y - 1,
        X3 is X + 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).
        
moveAvail('124', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y - 1,
        X3 is X + 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('125', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y - 1,
        X3 is X,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('126', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y - 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('127', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y - 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('128', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y - 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('134', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X + 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('135', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('136', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('137', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('138', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('145', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('146', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('147', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('148', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('156', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('156', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('157', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).
 
moveAvail('158', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('167', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('168', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('178', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y - 1,
        X2 is X - 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('234', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X + 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('235', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('236', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('237', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('238', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('245', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('246', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('247', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('248', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('256', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('257', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('258', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('267', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('268', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('278', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y - 1,
        X2 is X - 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('345', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('346', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('347', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('348', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X + 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('356', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('357', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('358', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('367', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('368', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('378', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y,
        X2 is X - 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('456', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y + 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y + 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('457', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y + 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('458', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y + 1,
        X2 is X,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('467', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y + 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('468', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y + 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('478', X, Y, Movelist) :-
        X1 is X + 1,
        Y1 is Y + 1,
        X2 is X - 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('567', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y + 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('568', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y + 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('578', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y + 1,
        X2 is X - 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

moveAvail('678', X, Y, Movelist) :-
        X1 is X - 1,
        Y1 is Y + 1,
        X2 is X - 1,
        Y2 is Y,
        X3 is X - 1,
        Y3 is Y - 1,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).

%At the start of the game, player 2's location is 'C', this gives player 1
%the correct movement options without having to handle the 1st move
%differently

moveAvail('C', X, Y, Movelist) :-
        X1 is X,
        Y1 is Y + 1,
        X2 is X - 1,
        Y2 is Y + 1,
        X3 is X - 1,
        Y3 is Y,
        append([], [X1, Y1], Res1),
        append([], [X2, Y2], Res2),
        append([], [X3, Y3], Res3),
        append([Res1], [Res2], Res4),
        append(Res4, [Res3], Movelist).