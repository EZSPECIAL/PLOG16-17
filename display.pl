/*

   Board display predicates

*/

:- dynamic line1/1.  %partial 1st line of a row
:- dynamic line2/1.  %partial 2nd line of a row
:- dynamic line3/1.  %partial 3rd line of a row
:- dynamic line1c/1. %complete 1st line of a row
:- dynamic line2c/1. %complete 2nd line of a row
:- dynamic line3c/1. %complete 3rd line of a row

%Call viewBoard with the current positions of the players

displayBoard(Board) :-
        position1(X1, Y1),
        position2(X2, Y2),
        viewBoard(Board, 0, X1, X2, Y1, Y2), nl.

displayBoard([]).

%Recursively handles each row of the board
%Calls buildRow which recursively handles each cell of the row passed to it
%Handles lineXc which is used for printing the board in printRow

viewBoard([First|Tail], YCount, X1, X2, Y1, Y2) :-
    assert(line1c([])),
    assert(line2c([])),
    assert(line3c([])),
    
    %Conditions to check whether there's a player on the current row
    %8 is out of the board, used so that buildRow can't find a player if we know there's none on that row
    %8 is also used for the X coord of player 1/2 when we know that they aren't on that row
    (YCount == Y1 -> (Y1 == Y2 -> buildRow(First, 0, X1, X2); buildRow(First, 0, X1, 8));
     YCount == Y2 -> (Y1 == Y2 -> buildRow(First, 0, X1, X2); buildRow(First, 0, 8, X2));
     buildRow(First, 8, X1, X2)),
    printRow,
    retractall(line1c(_)),
    retractall(line2c(_)),
    retractall(line3c(_)),
    NewYCount is YCount + 1,
    viewBoard(Tail, NewYCount, X1, X2, Y1, Y2).

%Retract temporary lineX from database

viewBoard([], _, _, _, _, _) :-
        retractall(line1(_)),
        retractall(line2(_)),
        retractall(line3(_)).

%Recursively handles each cell of a row from the board
%Calls buildCell to build a list with the 3x3 representation of a cell
%Calls combineCells which divides the 3x3 representation into 3 lines, obtained from appending the results from buildCell recursively

buildRow([First|Tail], XCount, X1, X2) :-
        (XCount == X1 -> buildCell(First, x, CellOut);
         XCount == X2 -> buildCell(First, y, CellOut);
         buildCell(First, 0, CellOut)),
        combineCells(CellOut, 0, 1, [], [], []),
        
        line1c(Final1),
        line1(Partial1),
        append(Final1, Partial1, NewFinal1), %Append to complete line, the partial line obtained from buildCell and combineCells
        retractall(line1c(_)),
        assert(line1c(NewFinal1)), %Store final 1st line, won't be complete until buildRow goes through the full row
        
        line2c(Final2),
        line2(Partial2),
        append(Final2, Partial2, NewFinal2),
        retractall(line2c(_)),
        assert(line2c(NewFinal2)),
        
        line3c(Final3),
        line3(Partial3),
        append(Final3, Partial3, NewFinal3),
        retractall(line3c(_)),
        assert(line3c(NewFinal3)),
        NewXCount is XCount + 1,
        buildRow(Tail, NewXCount, X1, X2).

buildRow([], _, _, _).

%Recursively handles a 3x3 cell, splits it into 3 lines
%Counter stores current element up to a 4 (full line) and then resets to 1
%CurrLine stores current line up to 3

combineCells([First|Tail], Counter, CurrLine, Line1, Line2, Line3) :-
        (Counter == 3 -> NewCurrLine is CurrLine+1; NewCurrLine is CurrLine), %Increments CurrLine if counter is 3, this means a line is going to end
        (Counter == 4 -> NewCounter is 1; NewCounter is Counter+1), %Increments counter up to 4 at which it resets back to 1
        (CurrLine == 1 -> append(Line1, [First], NewLine1), combineCells(Tail, NewCounter, NewCurrLine, NewLine1, Line2, Line3); %if line1 append current element and then recurse
        CurrLine == 2 -> append(Line2, [First], NewLine2), combineCells(Tail, NewCounter, NewCurrLine, Line1, NewLine2, Line3); %else if line2 append current element and then recurse
        CurrLine == 3 -> append(Line3, [First], NewLine3), combineCells(Tail, NewCounter, NewCurrLine, Line1, Line2, NewLine3); %else if line3 append current element and then recurse
        combineCells(Tail, NewCounter, NewCurrLine, Line1, Line2, Line3)). %else don't append anything, called when the initial list has been consumed

%Reaching the end of the list asserts each individual line for printing

combineCells([], _, _, Line1, Line2, Line3) :-
        retractall(line1(_)),
        assert(line1(Line1)),

        retractall(line2(_)),
        assert(line2(Line2)),

        retractall(line3(_)),
        assert(line3(Line3)).

%Prints a row by invididually printing each line by calling printLine
%Called by viewBoard at the end of each row, built by buildRow

printRow :-
        line1c(Line1), %Consult the complete 1st line built in buildRow
        line2c(Line2), %Consult the complete 2nd line built in buildRow
        line3c(Line3), %Consult the complete 3rd line built in buildRow
        printLine(Line1),
        nl,
        printLine(Line2),
        nl,
        printLine(Line3),
        nl,
        write(--------------------------------), %Horizontal padding
        nl.

%Prints a complete line from a board row, called by printRow

printLine([First|Tail]) :-
        write(First),
        printLine(Tail).

printLine([]).

%Prints list of available blocks to choose from

printAvail([First|Tail], Counter) :-
        (Counter == 10 -> nl, NewCounter is 1; NewCounter is Counter+1),
        write('\''),
        write(First),
        write('\' '),
        printAvail(Tail, NewCounter).

printAvail([], _) :-
        nl.