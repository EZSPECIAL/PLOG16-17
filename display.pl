:- dynamic line1/1.  %partial 1st line of a row
:- dynamic line2/1.  %partial 2nd line of a row
:- dynamic line3/1.  %partial 3rd line of a row
:- dynamic line1c/1. %complete 1st line of a row
:- dynamic line2c/1. %complete 2nd line of a row
:- dynamic line3c/1. %complete 3rd line of a row

%Recursively handles each row of the board
%Calls buildRow which recursively handles each cell of the row passed to it
%Handles lineXc which is used for printing the board in printRow

viewBoard([First|Tail]) :-
    assert(line1c([])),
    assert(line2c([])),
    assert(line3c([])),
    buildRow(First),
    printRow,
    retractall(line1c(_)),
    retractall(line2c(_)),
    retractall(line3c(_)),
    viewBoard(Tail).

%Retract temporary lineX from database

viewBoard([]) :-
    retractall(line1(_)),
    retractall(line2(_)),
    retractall(line3(_)).

%Recursively handles each cell of a row from the board
%Calls buildCell to build a list with the 3x3 representation of a cell
%Calls combineCells which divides the 3x3 representation into 3 lines, obtained from appending the results from buildCell recursively

buildRow([First|Tail]) :-
        buildCell(First, 0, CellOut),
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
    buildRow(Tail).

buildRow([]).

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

combineCells([], Counter, CurrLine, Line1, Line2, Line3) :-
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

buildCell('N', Player, [' ', ' ', ' ', '|', ' ', ' ', ' ', '|', ' ', ' ', ' ', '|']).

%Blank cell for stage 1 of the game, constructing the board

buildCell(' ', Player, [' ', ' ', ' ', '|', ' ', ' ', ' ', '|', ' ', ' ', ' ', '|']).