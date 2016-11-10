:- [display].
:- use_module(library(lists)).

:- dynamic stage1/1.
:- dynamic found/1.

%Stage 1 of the game, always starts like this

stage1([['C',' ',' ',' ',' ',' ',' ','S'],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ','N','N',' ',' ',' '],
     [' ',' ',' ','N','N',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     ['s',' ',' ',' ',' ',' ',' ','c']]).

%Stage 2 example, useful for testing

stage2([['C','156','237','137','346','167','134','S'],
     ['457','246','128','245','456','178','458','258'],
     ['135','138','278','678','168','136','347','267'],
     ['468','234','345','N','N','146','157','236'],
     ['467','124','578','N','N','368','247','367'],
     ['158','357','147','568','148','125','358','178'],
     ['478','145','256','235','348','127','123','356'],
     ['s','248','268','126','567','257','238','c']]).

%Available pieces to use during Stage 1 of the game

availPieces(['123', '124', '125', '126', '127', '128', '134', '135', '136',
             '137', '138', '145', '146', '147', '148', '156', '157', '158',
             '167', '168', '178', '234', '235', '236', '237', '238', '245',
             '246', '247', '248', '256', '257', '258', '267', '268', '278',
             '345', '346', '347', '348', '356', '357', '358', '367', '368',
             '378', '456', '457', '458', '467', '468', '478', '567', '568',
             '578', '678']).

position(x, 0, 0).
position(y, 0, 7).

playGame :-
        instructions,
        stage1(Board),
        availPieces(Avail),
        stage1(Board, Avail, FinalBoard).

%Prints program usage instructions, no game rules

instructions :-
        write('Instructions on how to use the program, not how to play the game!\n'),
        write('On Stage 1 players are asked what block they want to use and\n'),
        write('where to place it. Blocks are encoded with 3 digits indicating\n'),
        write('what directional arrows they contain.\n'),
        write('\'123\' would be up, upper right and right arrows, 1 is up then\n'),
        write('it increments clockwise up to 8. Blocks chosen must be enclosed\n'),
        write('in single quotes like so \'block\'.\n').

%Stage 1 of the game, building the board

stage1(Board, Avail, FinalBoard) :-
        length(Avail, N),             %Check if no more blocks available
        (N \= 0 -> viewBoard(Board),
        stage1P1ChoiceValidation(Avail, Move),
        delete(Avail, Move, NewAvail),
        stage1P1PlaceValidation(X, Y),
        stage1(Board, NewAvail, NewFinalBoard); true).
        
stage1(_, [], _).

%Repeats until user inputs a valid block

stage1P1ChoiceValidation(Avail, Move) :-
        (stage1P1Choice(Avail, Move) -> true; stage1P1ChoiceValidation(Avail, Move)).

%Asks user for input on the block to place, verifies if it's available

stage1P1Choice(Avail, Move) :-
        write('Player 1 choose an arrow block to place:\n\n'),
        printAvail(Avail, 0),
        read(Move),
        (memberchk(Move, Avail) -> true; write('Invalid piece, choose again\n'), fail).

%Repeats until user inputs a valid Column and Row (X, Y)

stage1P1PlaceValidation(X, Y) :-
        (stage1P1Place(X, Y) -> true; stage1P1PlaceValidation(X, Y)).

%Asks user for Column and Row (X, Y) to place block, verifies if it's unoccupied

stage1P1Place(X, Y) :-
        stage1(Board),
        write('Where to? (0,0) is on the upper left corner\n'),
        write('Column:\n'),
        read(X),
        write('Row:\n'),
        read(Y),
        (X < 8 -> true; write('Column out of board, 0 to 7\n'), fail),
        (X >= 0 -> true; write('Column out of board, 0 to 7\n'), fail),
        (Y < 8 -> true; write('Row out of board, 0 to 7\n'), fail),
        (Y >= 0 -> true; write('Row out of board, 0 to 7\n'), fail),
        checkEmpty(Board, 0, X, Y, 0),
        found(Found),
        (Found == 1 -> true; write('Can\'t place there, not empty\n'), fail).

%Verifies if Column X Row Y is free to place a block

checkEmpty([First|Tail], YCount, X, Y, Found) :-
        (YCount \= Y -> NewYCount is YCount + 1, NewFound is Found; nth0(X, First, ' ') -> NewFound is 1, NewYCount is YCount+1; Found == 1 -> NewFound is 1, NewYCount is YCount + 1; NewFound is 0, NewYCount is YCount + 1),
        checkEmpty(Tail, NewYCount, X, Y, NewFound).

checkEmpty([], _, _, _, Found) :-
        retractall(found(_)),
        (Found == 1 -> assert(found(1)); assert(found(0))).