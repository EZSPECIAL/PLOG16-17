:- dynamic bline1/1.
:- dynamic bline2/1.
:- dynamic bline3/1.
:- dynamic bline4/1.
:- dynamic bline5/1.
:- dynamic bline6/1.
:- dynamic bline7/1.
:- dynamic bline8/1.
:- dynamic bfinal/1.

boardSetElement([First|Tail], YCount, X, Y, Element, Board, OutBoard) :-
        (YCount == Y -> boardSetElementLine(First, 0, X, Y, Element, [], OutLine);
         boardSetElementLine(First, 8, X, Y, Element, [], OutLine)),
        append(Board, [OutLine], NewBoard),
        NewYCount is YCount + 1,
        boardSetElement(Tail, NewYCount, X, Y, Element, NewBoard, OutBoard).

boardSetElement([], _, _, _, _, Board, OutBoard) :-
        %copy_term(Board, OutBoard).
        append([], Board, OutBoard).

boardSetElementLine([First|Tail], XCount, X, Y, Element, Line, OutLine) :-
        (XCount == X -> append(Line, Element, NewLine); append(Line, [First], NewLine)),
        NewXCount is XCount + 1,
        boardSetElementLine(Tail, NewXCount, X, Y, Element, NewLine, OutLine).

boardSetElementLine([], _, _, _, _, Line, OutLine) :-
        append([], Line, OutLine).