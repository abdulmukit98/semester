queens(N, Queens) :-
    numlist(1, N, Columns),     
    permutation(Columns, Queens),  

    % Check if the solution is safe
    safe(Queens).

% Helper predicate to check if the solution is safe
safe([]).
safe([Column|Queens]) :-
    safe(Queens, Column, 1),
    safe(Queens).

safe([], _, _).
safe([OtherColumn|OtherQueens], Column, RowDiff) :-
    Column =\= OtherColumn,
    abs(Column - OtherColumn) =\= RowDiff,
    NewRowDiff is RowDiff + 1,
    safe(OtherQueens, Column, NewRowDiff).



% Example queries:
% To find a solution for the 8-Queens problem, you can use:
% ?- queens(8, Queens).
%
% To find all solutions for the 4-Queens problem, you can use:
% ?- queens(4, Queens).
