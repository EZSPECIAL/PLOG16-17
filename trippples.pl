/*

   Main file for the boardgame Trippples, contains game loop and game logic

*/

:- [decision].                  %Import long decision predicates
:- [display].                   %Import board display predicates
:- [board].                     %Import board manipulation predicates
:- [cpu].                       %CPU player predicates
:- use_module(library(lists)).  %Use SICSTUS list operation predicates

%Player positions

:- dynamic position1/2.
:- dynamic position2/2.

%Stage 1 of the game, always starts like this

stage1([['C',' ',' ',' ',' ',' ',' ','S'],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ','N','N',' ',' ',' '],
     [' ',' ',' ','N','N',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     [' ',' ',' ',' ',' ',' ',' ',' '],
     ['s',' ',' ',' ',' ',' ',' ','c']]).

%Stage 2 board used for playGameS2, is winnable

stage2b([['C','156','237','137','346','167','134','S'],
     ['457','246','128','245','456','146','458','258'],
     ['135','138','278','678','168','136','347','267'],
     ['468','234','345','N','N','178','157','236'],
     ['467','124','578','N','N','567','247','367'],
     ['158','357','147','568','148','125','358','178'],
     ['123','145','256','235','348','127','356','478'],
     ['s','248','268','126','368','257','238','c']]).

%Available pieces to use during Stage 1 of the game

availPieces(['123', '124', '125', '126', '127', '128', '134', '135', '136',
             '137', '138', '145', '146', '147', '148', '156', '157', '158',
             '167', '168', '178', '234', '235', '236', '237', '238', '245',
             '246', '247', '248', '256', '257', '258', '267', '268', '278',
             '345', '346', '347', '348', '356', '357', '358', '367', '368',
             '378', '456', '457', '458', '467', '468', '478', '567', '568',
             '578', '678']).

%Play full game, Stage 1 has no CPU

playGame(Player1, Player2, Difficulty1, Difficulty2) :-
        retractall(position1(_, _)),
        retractall(position2(_, _)),
        assert(position1(7, 0)),
        assert(position2(0, 0)),
        instructions,
        stage1(Board),
        availPieces(Avail),
        stage1(Board, Avail, S1Board),
        
        (Player1 == 1 ->
         (Player2 == 1 -> stage2Loop(S1Board, 0); stage2LoopPvCPU(S1Board, Difficulty2, 0));
         stage2LoopCPUvCPU(S1Board, Difficulty1, Difficulty2, 0)),
        
        displayBoard(S1Board).

%Play only the 2nd stage of the game Player against Player

playGameS2 :-
        retractall(position1(_, _)),
        retractall(position2(_, _)),
        assert(position1(7, 0)),
        assert(position2(0, 0)),
        stage2b(S1Board),
        stage2Loop(S1Board, 0),
        displayBoard(S1Board).

%Play only the 2nd stage of the game against the CPU

playGameS2PvCPU(Difficulty) :-
        retractall(position1(_, _)),
        retractall(position2(_, _)),
        assert(position1(7, 0)),
        assert(position2(0, 0)),
        stage2b(S1Board),
        stage2LoopPvCPU(S1Board, Difficulty, 0),
        displayBoard(S1Board).

%Watch the CPU play the 2nd stage against each other

playGameS2CPUvCPU(Difficulty1, Difficulty2) :-
        retractall(position1(_, _)),
        retractall(position2(_, _)),
        assert(position1(7, 0)),
        assert(position2(0, 0)),
        stage2b(S1Board),
        stage2LoopCPUvCPU(S1Board, Difficulty1, Difficulty2, 0),
        displayBoard(S1Board).

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

%Game loop for the 2nd Stage of the game

stage2Loop(Board, State) :-
        (State == 0 -> stage2(Board, Win),
        (Win == 1 -> NewState is 1;
         Win == 2 -> NewState is 2;
         Win == 3 -> NewState is 3;
         NewState is 0),
        stage2Loop(Board, NewState);
         State == 1 -> write('Player 1 has reached the goal\n');
         State == 2 -> write('Player 2 has reached the goal\n');
         State == 3 -> write('No moves available for both players, game is a draw\n')).

%Game logic for the 2nd Stage of the game

stage2(Board, Win) :-
        
        %Available moves for Player 1
        
        stage2ComputeMoves(Board, 1, Movelist1),
        length(Movelist1, N1), %0 = no moves available
        
        %Player 1's move
        
        (N1 > 0 -> displayBoard(Board),
        stage2MoveValidation(Movelist1, 1, X1, Y1),
        retractall(position1(_, _)),
        assert(position1(X1, Y1)); write('No valid moves for Player 1, skipping turn\n')),

        %Check if Player 1 won
        
        checkWin(Board, 1, Win1),

        %Available moves for Player 2
        
        (Win1 \= 1 -> stage2ComputeMoves(Board, 2, Movelist2), length(Movelist2, N2),
                      
        %Player 2's move
                      
        (N2 > 0 -> displayBoard(Board),
        stage2MoveValidation(Movelist2, 2, X2, Y2),
        retractall(position2(_, _)),
        assert(position2(X2, Y2)); write('No valid moves for Player 2, skipping turn\n')); true),
        
        %Check if Player 2 won only if Player 1 hasn't
        
        (Win1 \= 1 -> checkWin(Board, 2, Win2); true),
        
        %Check if game's a draw
        
        checkDraw(N1, N2, Draw),
        
        %Win is used in stage2Loop to decide if the game has ended
        
        (Draw == 1 -> Win is 3;
         Win1 == 1 -> Win is 1;
         Win2 == 1 -> Win is 2;
         Win is 0).

%Computes moves available for Player

stage2ComputeMoves(Board, Player, Movelist) :-
        position1(X1, Y1),
        position2(X2, Y2),
        (Player == 1 -> fetchBlockLine(Board, 0, X2, Y2, Block); fetchBlockLine(Board, 0, X1, Y1, Block)),
        
        %moveAvail converts list values (e.g. '123') to a list of movement coords
        
        (Player == 1 -> moveAvail(Block, X1, Y1, MovelistT); moveAvail(Block, X2, Y2, MovelistT)),
        
        %Check if movement coords are not outside the board, to a starting cell or to a neutral cell
        
        checkBounds(Board, MovelistT, Player, [], NewMovelistT),
        
        %Check if remaining movement coords are to another player's position
        
        (Player == 1 -> checkPlayer(NewMovelistT, X2, Y2, [], Movelist); checkPlayer(NewMovelistT, X1, Y1, [], Movelist)).

%Game's a draw when both players have 0 moves available

checkDraw(N1, N2, Result) :-
        (N1 > 0 -> Result is 0;
         N2 > 0 -> Result is 0;
         Result is 1).
        
%Game is won when Player 1 reaches the 's' cell or Player 2 reaches the 'c' cell

checkWin(Board, Player, WinT) :-
        (Player == 1 -> position1(X, Y);
         position2(X, Y)),
        (Player == 1 -> checkElement(Board, 0, X, Y, 's', Found);
         Player == 2 -> checkElement(Board, 0, X, Y, 'c', Found)),
        (Found == 1 -> WinT is 1; WinT is 0).

%Creates a list with available values of movement ('123', '234', etc)

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

%Verifies if computed moves are inbounds, checks for out of board, neutral cells and starting cells

checkBounds(Board, [First|Tail], Player, Movelist, OutMove) :-
        [X|TempY] = First,
        [Y|_] = TempY,
        checkElement(Board, 0, X, Y, 'N', FoundN), %Check if neutral block
        checkElement(Board, 0, X, Y, 'C', FoundC), %Check if Player 2's starting cell
        checkElement(Board, 0, X, Y, 'S', FoundS), %Check if Player 1's starting cell
        
        (Player == 1 -> checkElement(Board, 0, X, Y, 'c', Foundc);
         checkElement(Board, 0, X, Y, 's', Founds)),
        
        %Check if -1 or 8 is a part of the movement coords
        
        (memberchk(8, First) -> append([], Movelist, NewMovelist);
         memberchk(-1, First) -> append([], Movelist, NewMovelist);
         
         FoundN == 1 -> append([], Movelist, NewMovelist);
         FoundS == 1 -> append([], Movelist, NewMovelist);
         FoundC == 1 -> append([], Movelist, NewMovelist);
         Foundc == 1 -> append([], Movelist, NewMovelist);
         Founds == 1 -> append([], Movelist, NewMovelist);
         
         %Only append the movement coords if they were inbounds
         
         append(Movelist, [First], NewMovelist)),
        checkBounds(Board, Tail, Player, NewMovelist, OutMove).

checkBounds(_, [], _, Movelist, OutMove) :-
        append([], Movelist, OutMove).

%Checks if Element is at X, Y position on the board

checkElement([First|Tail], YCount, X, Y, Element, Found) :-
        (YCount \= Y -> true; nth0(X, First, Element) -> Found is 1; true),
        NewYCount is YCount + 1,
        checkElement(Tail, NewYCount, X, Y, Element, Found).

checkElement([], _, _, _, _, Found) :-
        (Found == 1 -> true; Found is 0).

%Check if other player is at MX, MY
%PX, PY is the position of the opponent

checkPlayer([First|Tail], PX, PY, Movelist, OutMove) :-
        [MX|TempY] = First,
        [MY|_] = TempY,
        (MX == PX -> (MY == PY -> append([], Movelist, NewMovelist);
                      append(Movelist, [First], NewMovelist));
         append(Movelist, [First], NewMovelist)),
        checkPlayer(Tail, PX, PY, NewMovelist, OutMove).

checkPlayer([], _, _, Movelist, OutMove) :-
        append([], Movelist, OutMove).

%Repeats until user inputs a valid movement

stage2MoveValidation(Movelist, Player, X, Y) :-
        (stage2Move(Movelist, Player, X, Y) -> true; stage2MoveValidation(Movelist, Player, X, Y)).

%Requests user to input movement coords from the available movements, computed earlier

stage2Move(Movelist, Player, X, Y) :-
        (Player == 1 -> write('Player 1\'s move (x). Where to? (0,0) is on the upper left corner\n');
         write('Player 2\'s move (y). Where to? (0,0) is on the upper left corner\n')),
        write('Possible moves: '),
        printLine(Movelist), nl,
        write('Column:\n'),
        read(X),
        write('Row:\n'),
        read(Y),
        stage2CheckMove(Movelist, X, Y, Found),
        
        %If movement provided by user isn't on the movement list backtrack to stage2MoveValidation
        %which calls stage2Move again
        
        (Found == 1 -> true; write('Not a valid move\n'), fail).

%Checks if user input movement is actually on the movement list        

stage2CheckMove([First|Tail], X, Y, Found) :-
        [MX|TempY] = First,
        [MY|_] = TempY,
        (MX == X -> (MY == Y -> Found is 1;
                     true);
         true),
        stage2CheckMove(Tail, X, Y, Found).

stage2CheckMove([], _, _, Found) :-
        (Found == 1 -> true; Found is 0).

%Game loop for the 2nd Stage of the game Player vs CPU

stage2LoopPvCPU(Board, Difficulty, State) :-
        (State == 0 -> stage2PvCPU(Board, Difficulty, Win),
        (Win == 1 -> NewState is 1;
         Win == 2 -> NewState is 2;
         Win == 3 -> NewState is 3;
         NewState is 0),
        stage2LoopPvCPU(Board, Difficulty, NewState);
         State == 1 -> write('Player 1 has reached the goal\n');
         State == 2 -> write('Player 2 has reached the goal\n');
         State == 3 -> write('No moves available for both players, game is a draw\n')).

%Game logic for the 2nd Stage of the game Player vs CPU

stage2PvCPU(Board, Difficulty, Win) :-
        
        %Available moves for Player 1
        
        stage2ComputeMoves(Board, 1, Movelist1),
        length(Movelist1, N1), %0 = no moves available
        
        %Player 1's move
        
        (N1 > 0 -> displayBoard(Board),
        stage2MoveValidation(Movelist1, 1, X1, Y1),
        retractall(position1(_, _)),
        assert(position1(X1, Y1)); write('No valid moves for Player 1, skipping turn\n')),

        %Check if Player 1 won
        
        checkWin(Board, 1, Win1),

        %Available moves for Player 2
        
        (Win1 \= 1 -> stage2ComputeMoves(Board, 2, Movelist2), length(Movelist2, N2),
                      
        %Player 2's move
                      
        (N2 > 0 -> displayBoard(Board),
                   
        stage2CheckMove(Movelist1, 7, 7, Found),
                   
        %Plays 1st move available if Difficulty != 2 or AI didn't decide on any move
        
        (Found == 0 -> stage2CPUAI(Movelist2, 2, Difficulty, X2, Y2, Decided, _),
           (Decided \== 1 -> [First|_] = Movelist2, [X2|TempY] = First, [Y2|_] = TempY; true);
         X2 is 7, Y2 is 7),
        
        retractall(position2(_, _)),
        assert(position2(X2, Y2)); write('No valid moves for Player 2, skipping turn\n')); true),
        
        %Check if Player 2 won only if Player 1 hasn't
        
        (Win1 \= 1 -> checkWin(Board, 2, Win2); true),
        
        %Check if game's a draw
        
        checkDraw(N1, N2, Draw),
        
        %Win is used in stage2Loop to decide if the game has ended
        
        (Draw == 1 -> Win is 3;
         Win1 == 1 -> Win is 1;
         Win2 == 1 -> Win is 2;
         Win is 0).

%Game loop for the 2nd Stage of the game CPU vs CPU

stage2LoopCPUvCPU(Board, Difficulty1, Difficulty2, State) :-
        (State == 0 -> stage2CPUvCPU(Board, Difficulty1, Difficulty2, Win),
        (Win == 1 -> NewState is 1;
         Win == 2 -> NewState is 2;
         Win == 3 -> NewState is 3;
         NewState is 0),
        stage2LoopCPUvCPU(Board, Difficulty1, Difficulty2, NewState);
         State == 1 -> write('Player 1 has reached the goal\n');
         State == 2 -> write('Player 2 has reached the goal\n');
         State == 3 -> write('No moves available for both players, game is a draw\n')).

%Game logic for the 2nd Stage of the game CPU vs CPU

stage2CPUvCPU(Board, Difficulty1, Difficulty2, Win) :-
        
        %Available moves for Player 1
        
        stage2ComputeMoves(Board, 1, Movelist1),
        length(Movelist1, N1), %0 = no moves available
        
        %Player 1's move
        
        (N1 > 0 -> displayBoard(Board), %write('Input to continue\n'), read(_),
                   
        stage2CheckMove(Movelist1, 0, 7, Found1),
                   
        %Plays 1st move available if Difficulty != 2 or AI didn't decide on any move
        
        (Found1 == 0 -> stage2CPUAI(Movelist1, 1, Difficulty1, X1, Y1, Decided1, _),
           (Decided1 \== 1 -> [First1|_] = Movelist1, [X1|TempY1] = First1, [Y1|_] = TempY1; true);
         X1 is 0, Y1 is 7),
       
        retractall(position1(_, _)),
        assert(position1(X1, Y1)); write('No valid moves for Player 1, skipping turn\n')),

        %Check if Player 1 won
        
        checkWin(Board, 1, Win1),

        %Available moves for Player 2
        
        (Win1 \= 1 -> stage2ComputeMoves(Board, 2, Movelist2), length(Movelist2, N2),
                      
        %Player 2's move
                      
        (N2 > 0 -> displayBoard(Board), %write('Input to continue\n'), read(_),
        
        stage2CheckMove(Movelist2, 7, 7, Found2),
                   
        %Plays 1st move available if Difficulty != 2 or AI didn't decide on any move
        
        (Found2 == 0 -> stage2CPUAI(Movelist2, 2, Difficulty2, X2, Y2, Decided2, _),
           (Decided2 \== 1 -> [First2|_] = Movelist2, [X2|TempY2] = First2, [Y2|_] = TempY2; true);
         X1 is 7, Y1 is 7),
        
        retractall(position2(_, _)),
        assert(position2(X2, Y2)); write('No valid moves for Player 2, skipping turn\n')); true),
        
        %Check if Player 2 won only if Player 1 hasn't
        
        (Win1 \= 1 -> checkWin(Board, 2, Win2); true),
        
        %Check if game's a draw
        
        checkDraw(N1, N2, Draw),
        
        %Win is used in stage2Loop to decide if the game has ended
        
        (Draw == 1 -> Win is 3;
         Win1 == 1 -> Win is 1;
         Win2 == 1 -> Win is 2;
         Win is 0).