% Define cities and distances
distance(city1, city2, 10).
distance(city1, city3, 15).
distance(city1, city4, 20).
distance(city2, city3, 35).
distance(city2, city4, 25).
distance(city3, city4, 30).

% Generate all permutations of a list
perm([], []).
perm(List, [H|Perm]) :-
    select(H, List, Rest),
    perm(Rest, Perm).

% Calculate the total distance of a route
total_distance([_], 0).
total_distance([City1, City2|Rest], TotalDistance) :-
    distance(City1, City2, Dist),
    total_distance([City2|Rest], RemainingDist),
    TotalDistance is Dist + RemainingDist.

% Find the shortest route using a generative model
traveling_salesman(ShortestRoute, ShortestDistance) :-
    findall(Route, (perm([city1, city2, city3, city4], Route), Route = [city1|_]), Routes),
    findall(Distance, (member(Route, Routes), total_distance(Route, Distance)), Distances),
    min_list(Distances, ShortestDistance),
    member(ShortestRoute, Routes),
    total_distance(ShortestRoute, ShortestDistance).
