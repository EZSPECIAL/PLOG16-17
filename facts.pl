:- dynamic line1/1.
:- dynamic line2/1.
:- dynamic line3/1.
:- dynamic line1c/1.
:- dynamic line2c/1.
:- dynamic line3c/1.

position(x, 0, 0).

position(y, 0, 7).

stage1([['S',' ',' ',' ',' ',' ',' ','c'],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ','N','N',' ',' ',' '],
     [' ',' ',' ','N','N',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     ['C',' ',' ',' ',' ',' ',' ','s']]).

stage2([['S','156','237','137','346','167','134','c'],
     ['457','246','128','245','456','178','458','258'],
     ['135','138','278','678','168','136','347','267'],
     ['468','234','345','N','N','146','157','236'],
     ['467','124','578','N','N','368','247','367'],
     ['158','357','147','568','148','125','358','178'],
     ['478','145','256','235','348','127','123','356'],
     ['C','248','268','126','567','257','238','s']]).

test([['123','124'],['125','123']]).


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
	
buildCell('S', Player, ['S', ' ', ' ', '|', ' ', Var, ' ', '|', ' ', ' ', ' ', '|']) :-
	(Player = 0, Var = ' ', !; Var = Player).
	
buildCell('s', Player, [' ', ' ', ' ', '|', ' ', Var, ' ', '|', ' ', ' ', 's', '|']) :-
	(Player = 0, Var = ' ', !; Var = Player).
	
buildCell('C', Player, [' ', ' ', ' ', '|', ' ', Var, ' ', '|', 'C', ' ', ' ', '|']) :-
	(Player = 0, Var = ' ', !; Var = Player).

buildCell('c', Player, [' ', ' ', 'c', '|', ' ', Var, ' ', '|', ' ', ' ', ' ', '|']) :-
	(Player = 0, Var = ' ', !; Var = Player).
	
buildCell('N', Player, [' ', ' ', ' ', '|', ' ', ' ', ' ', '|', ' ', ' ', ' ', '|']).

buildCell(' ', Player, [' ', ' ', ' ', '|', ' ', ' ', ' ', '|', ' ', ' ', ' ', '|']).

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
        write(--------------------------------).

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