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