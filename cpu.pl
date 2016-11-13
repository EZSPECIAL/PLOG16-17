/*

   Game AI

*/

%Recursively checks each available move coords to see if that's the one
%the AI wants to choose

stage2CPUAI([First|Tail], Player, Difficulty, X, Y, Decided, Once) :-
        [MX|TempY] = First,
        [MY|_] = TempY,
        (Decided \== 1 -> stage2CPUmove(MX, MY, Player, Difficulty, Decided); true),
        
        %If decided unify X and Y, only runs Once
        
        (Once \== 1 ->
         (Decided == 1 -> X is MX, Y is MY, Once is 1; true); true),
        
        stage2CPUAI(Tail, Player, Difficulty, X, Y, Decided, Once).
        
stage2CPUAI([], _, _, _, _, _, _).
        
%AI, from the movement coords given tries to decide if it's a good choice
%Both players prioritize going towards their own goal
%Unfortunately, that makes them get stuck in loops a lot

stage2CPUmove(MX, MY, Player, Difficulty, Decided) :-
        (Player == 1 -> position1(X, Y); position2(X, Y)),
        DX is MX - X,
        DY is MY - Y,
        
        %If difficulty isn't level 2 then the AI isn't turned on
        
        (Difficulty == 2 ->
     
        (Decided \== 1 ->
        (Player == 1 ->
         (DX == -1 ->
          (DY == 1 -> Decided is 1; Decided is 1); true),
         (DY == 1 ->
          (DX == -1 -> Decided is 1; Decided is 1); true); true); true),

        (Decided \== 1 ->
        (Player == 2 ->
         (DX == 1 ->
          (DY == 1 -> Decided is 1; Decided is 1); true),
         (DY == 1 ->
          (DX == 1 -> Decided is 1; Decided is 1); true); true); true); true).