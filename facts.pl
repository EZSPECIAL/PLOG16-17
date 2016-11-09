:- dynamic line1/1.
:- dynamic line2/1.
:- dynamic line3/1.
:- dynamic line1c/1.
:- dynamic line2c/1.
:- dynamic line3c/1.

position(x, 0, 0).

position(y, 0, 7).

init([['S',' ',' ',' ',' ',' ',' ','c'],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ','N','N',' ',' ',' '],
     [' ',' ',' ','N','N',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     ['C',' ',' ',' ',' ',' ',' ','s']]).

intermediate([['S','156','237','137','346','167','134','c'],
     ['457','246','128','245','456','178','458','258'],
     ['135','138','278','678','168','136','347','267'],
     ['468','234','345','N','N','146','157','236'],
     ['467','124','578','N','N','368','247','367'],
     ['158','357','147','568','148','125','358','178'],
     ['478','145','256','235','348','127','123','356'],
     ['C','248','268','126','567','257','238','s']]).

test([['123','124'],['125','123']]).

final([['S','156','237','137','346','167','134','c'],
     ['457','246','128','245','456',['178','Y'],'458','258'],
     ['135','138','278','678','168','136','347','267'],
     ['468','234','345','N','N','146','157','236'],
     ['467','124','578','N','N','368','247','367'],
     ['158','357','147','568','148','125','358','178'],
     ['478','145','256','235','348','127','123','356'],
     ['C','248','268','126','567','257','238',['s','X']]]).

buildCell('123', Player, [' ', '|', '/', '|', ' ', Var, '-', '|', ' ', ' ', ' ', '|']) :-
	(Player = 0, Var = ' ', !; Var = Player).
	
buildCell('124', Player, [' ', '|', '/', '|', ' ', Var, ' ', '|', ' ', ' ', '\\', '|']) :-
	(Player = 0, Var = ' ', !; Var = Player).
	
buildCell('125', Player, [' ', '|', '/', '|', ' ', Var, ' ', '|', ' ', '|', ' ', '|']) :-
	(Player = 0, Var = ' ', !; Var = Player).

playGame(Board) :-
        viewBoard(Board).
      
viewBoard([]) :-
    retractall(line1(_)),
    retractall(line2(_)),
    retractall(line3(_)).

viewBoard([First|Tail]) :-
    assert(line1c([])),
    assert(line2c([])),
    assert(line3c([])),
    printList(First),
    printTest,
    retractall(line1c(_)),
    retractall(line2c(_)),
    retractall(line3c(_)),
    viewBoard(Tail).

printTest :-
        line1c(Line1),
        line2c(Line2),
        line3c(Line3),
        printLine(Line1),
        nl,
        printLine(Line2),
        nl,
        printLine(Line3),
        nl,
        printDotted.

printDotted :-
        write(------------------------).

printLine([]).

printLine([First|Tail]) :-
        write(First),
        printLine(Tail).

printList([]) :-
    nl.

printList([First|Tail]) :-
	buildCell(First, 0, CellOut),
	printCell(CellOut, 0, 1, [], [], []),
        
        line1c(Final1),
        line1(Partial1),
        append(Final1, Partial1, NewFinal1),
        retractall(line1c(_)),
        assert(line1c(NewFinal1)),
        
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
    printList(Tail).

printCell([First|Tail], Counter, CurrLine, Line1, Line2, Line3) :-
    (Counter == 3 -> NewCurrLine is CurrLine+1; NewCurrLine is CurrLine),
    (Counter == 4 -> NewCounter is 1; NewCounter is Counter+1),
    (CurrLine == 1 -> append(Line1, [First], NewLine1), printCell(Tail, NewCounter, NewCurrLine, NewLine1, Line2, Line3);
    CurrLine == 2 -> append(Line2, [First], NewLine2), printCell(Tail, NewCounter, NewCurrLine, Line1, NewLine2, Line3);
    CurrLine == 3 -> append(Line3, [First], NewLine3), printCell(Tail, NewCounter, NewCurrLine, Line1, Line2, NewLine3);
    printCell(Tail, NewCounter, NewCurrLine, Line1, Line2, Line3)).

printCell([], Counter, CurrLine, Line1, Line2, Line3) :-
        retractall(line1(_)),
        assert(line1(Line1)),

        retractall(line2(_)),
        assert(line2(Line2)),

        retractall(line3(_)),
        assert(line3(Line3)).