/*

   Main file for the boardgame Trippples, contains game loop and game logic

*/

:- [decision].                  %Import long decision predicates
:- [display].                   %Import board display functions
:- [board].                     %Import board manipulation functions
:- use_module(library(lists)).  %Use SICSTUS list operation predicates

:- dynamic position1/2.
:- dynamic position2/2.
:- dynamic test/1.

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

stage2b([['C','156','237','137','346','167','134','S'],
     ['457','246','128','245','456','178','458','258'],
     ['135','138','278','678','168','136','347','267'],
     ['468','234','345','N','N','146','157','236'],
     ['467','124','578','N','N','368','247','367'],
     ['158','357','147','568','148','125','358','178'],
     ['478','145','256','235','348','127','123','356'],
     ['s','248','268','126','567','257','238','c']]).

%Available pieces to use during Stage 1 of the game

%availPieces(['123', '124', '125', '126', '127', '128', '134', '135', '136',
%             '137', '138', '145', '146', '147', '148', '156', '157', '158',
%             '167', '168', '178', '234', '235', '236', '237', '238', '245',
%             '246', '247', '248', '256', '257', '258', '267', '268', '278',
%             '345', '346', '347', '348', '356', '357', '358', '367', '368',
%             '378', '456', '457', '458', '467', '468', '478', '567', '568',
%             '578', '678']).

availPieces(['123', '124']). %TODO remove temporary

%Player 1 and 2 positions on the board

position1(5, 4).
position2(2, 2).

%Game loop

testout :-
        stage2b(Board),
        stage2(Board).

testout2 :-
        position1(X, Y),
        moveAvail('128', X, Y, Movelist),
        assert(test(Movelist)).

playGame :-
        instructions,
        stage1(Board),
        availPieces(Avail),
        stage1(Board, Avail, FinalBoard),
        displayBoard(FinalBoard).

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
        (N \= 0 -> displayBoard(Board),
                   
        %Player 1 turn
        stage1ChoiceValidation(Avail, Move1, 1),
        delete(Avail, Move1, NewAvail),
        stage1PlaceValidation(Board, X1, Y1),
        boardSetElement(Board, 0, X1, Y1, [Move1], [], NewBoard),
        
        displayBoard(NewBoard),
        
        %Player 2 turn
        stage1ChoiceValidation(NewAvail, Move2, 2),
        delete(NewAvail, Move2, NewerAvail),
        stage1PlaceValidation(NewBoard, X2, Y2),
        boardSetElement(NewBoard, 0, X2, Y2, [Move2], [], NewerBoard),
        stage1(NewerBoard, NewerAvail, FinalBoard); append([], Board, FinalBoard)). %Else reached end of Avail, output FinalBoard

%Repeats until user inputs a valid block

stage1ChoiceValidation(Avail, Move, Player) :-
        (stage1Choice(Avail, Move, Player) -> true; stage1ChoiceValidation(Avail, Move, Player)).

%Asks user for input on the block to place, verifies if it's available

stage1Choice(Avail, Move, Player) :-
        (Player == 1 -> write('Player 1 choose an arrow block to place:\n\n'); write('Player 2 choose an arrow block to place:\n\n')),
        printAvail(Avail, 0),
        read(Move),
        (memberchk(Move, Avail) -> true; write('Invalid piece, choose again\n'), fail).

%Repeats until user inputs a valid Column and Row (X, Y)

stage1PlaceValidation(Board, X, Y) :-
        (stage1Place(Board, X, Y) -> true; stage1PlaceValidation(Board, X, Y)).

%Asks user for Column and Row (X, Y) to place block, verifies if it's unoccupied

stage1Place(Board, X, Y) :-
        write('Where to? (0,0) is on the upper left corner\n'),
        write('Column:\n'),
        read(X),
        write('Row:\n'),
        read(Y),
        (X < 8 -> true; write('Column out of board, 0 to 7\n'), fail),
        (X >= 0 -> true; write('Column out of board, 0 to 7\n'), fail),
        (Y < 8 -> true; write('Row out of board, 0 to 7\n'), fail),
        (Y >= 0 -> true; write('Row out of board, 0 to 7\n'), fail),
        checkEmpty(Board, 0, X, Y, Found),
        (Found == 1 -> true; write('Can\'t place there, not empty\n'), fail).

%Verifies if Column X Row Y is free to place a block

checkEmpty([First|Tail], YCount, X, Y, Found) :-
        (YCount \= Y -> true; nth0(X, First, ' ') -> Found is 1; true),
        NewYCount is YCount + 1,
        checkEmpty(Tail, NewYCount, X, Y, Found).

checkEmpty([], _, _, _, Found) :-
        (Found == 1 -> true; Found is 0).

stage2(Board) :-
        stage2ComputeMoves(Board, 1, Movelist1).
        %stage2ComputeMoves(Board, 2, Movelist2).

stage2ComputeMoves(Board, Player, Movelist) :-
        position1(X1, Y1),
        position2(X2, Y2),
        (Player == 1 -> fetchBlockLine(Board, 0, X2, Y2, Block); fetchBlockLine(Board, 0, X1, Y1, Block)),
        (Player == 1 -> moveAvail(Block, X1, Y1, MovelistT); moveAvail(Block, X2, Y2, MovelistT)),
        checkBounds(Board, MovelistT, [], NewMovelistT),
        assert(test(NewMovelistT)).

fetchBlockLine([First|Tail], YCount, X, Y, OutBlock) :-
        (YCount == Y -> fetchBlock(First, 0, X, OutBlock); true),
        NewYCount is YCount + 1,
        fetchBlockLine(Tail, NewYCount, X, Y, OutBlock).

fetchBlockLine([], _, _, _, _).

fetchBlock([First|Tail], XCount, X, OutBlock) :-
        (XCount == X -> append([], First, OutBlock); true),
        NewXCount is XCount + 1,
        fetchBlock(Tail, NewXCount, X, OutBlock).

fetchBlock([], _, _, _).

%Verifies if computed moves are inbounds, checks for out of board and neutral blocks
%Assumes neutral blocks are always at [[3,3], [3,4], [4,3], [4,4]], not generic

checkBounds(Board, [First|Tail], Movelist, OutMove) :-
        [X|TempY] = First,
        [Y|_] = TempY,
        checkNeutral(Board, 0, X, Y, Found),
        write(Found),
        (memberchk(8, First) -> append([], Movelist, NewMovelist);
         memberchk(-1, First) -> append([], Movelist, NewMovelist);
         Found == 1 -> append([], Movelist, NewMovelist);
         append(Movelist, [First], NewMovelist)),
        checkBounds(Board, Tail, NewMovelist, OutMove).

checkBounds(_, [], Movelist, OutMove) :-
        append([], Movelist, OutMove).

checkNeutral([First|Tail], YCount, X, Y, Found) :-
        write(X),
        write(Y),
        (YCount \= Y -> true; nth0(X, First, 'N') -> Found is 1; true),
        NewYCount is YCount + 1,
        checkNeutral(Tail, NewYCount, X, Y, Found).

checkNeutral([], _, _, _, Found) :-
        (Found == 1 -> true; Found is 0).