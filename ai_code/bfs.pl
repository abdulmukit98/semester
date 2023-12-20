% Define a graph represented as edges
edge(a, b).
edge(b, c).
edge(c, d).
edge(d, e).
edge(b, f).
edge(f, g).

% Breadth-first search predicate
bfs(Start, Goal) :-
    bfs_helper([Start], Goal, []).

% Helper predicate with a queue to keep track of visited nodes
bfs_helper([], _, _) :-
    write('Goal not reached'), nl.

bfs_helper([Current | Rest], Goal, Visited) :-
    Current == Goal,
    reverse([Current | Visited], Path),
    write('Goal reached: '), write(Path), nl.

bfs_helper([Current | Rest], Goal, Visited) :-
    \+ member(Current, Visited), % Check if Current is not in Visited
    write('Visiting node: '), write(Current), nl,
    asserta(visited(Current)), % Assert that Current has been visited
    findall(NextNode,
            (edge(Current, NextNode), \+ member(NextNode, Visited)),
            NextNodes), % Get the next adjacent nodes

    append(Rest, NextNodes, UpdatedQueue),
    bfs_helper(UpdatedQueue, Goal, [Current | Visited]).
% Example usage:
% To find a path from 'a' to 'g', use bfs(a, g).
