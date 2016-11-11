/*

   Board manipulation predicates

*/

%Change one element of the board
%Recursively handles each row of the board

boardSetElement([First|Tail], YCount, X, Y, Element, Board, OutBoard) :-
        %If YCount isn't Y then boardSetElementLine is called with counter = 8,
        %this tells it that the element to change isn't on that row
        (YCount == Y -> boardSetElementLine(First, 0, X, Y, Element, [], OutLine);
         boardSetElementLine(First, 8, X, Y, Element, [], OutLine)),
        append(Board, [OutLine], NewBoard), %Create list of lists that represents the board
        NewYCount is YCount + 1,
        boardSetElement(Tail, NewYCount, X, Y, Element, NewBoard, OutBoard).

%Called at the end of boardSetElement, outputs OutBoard

boardSetElement([], _, _, _, _, Board, OutBoard) :-
        append([], Board, OutBoard).

%Change one element of the board
%Recursively handles each element of a row

boardSetElementLine([First|Tail], XCount, X, Y, Element, Line, OutLine) :-
        %If XCount is X then we append the new Element discarding the old element
        (XCount == X -> append(Line, Element, NewLine); append(Line, [First], NewLine)),
        NewXCount is XCount + 1,
        boardSetElementLine(Tail, NewXCount, X, Y, Element, NewLine, OutLine).

%Called at the end of boardSetElementLine, outputs OutLine

boardSetElementLine([], _, _, _, _, Line, OutLine) :-
        append([], Line, OutLine).