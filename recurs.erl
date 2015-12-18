-module(recurs).
-compile(export_all).

fac(0) ->
    1;
fac(N) when N > 0 ->
    N * fac(N - 1).

len([]) ->
    0;
len([_|R]) ->
    1 + len(R).

tail_fac(N) ->
    tail_fac(N, 1).

tail_fac(0, Acc) ->
    Acc;
tail_fac(N, Acc) when N > 0 ->
    tail_fac(N - 1, N * Acc).

tail_len(L) ->
    tail_len(L, 0).

tail_len([], Acc) ->
    Acc;
tail_len([_|T], Acc) ->
    tail_len(T, Acc + 1).

duplicate(0,_) ->
    [];
duplicate(N,Term) when N > 0 ->
    [Term|duplicate(N-1,Term)].


tail_duplicate(N, Term) ->
    tail_duplicate(N, Term , []).

tail_duplicate(0, _, List) ->
    List;
tail_duplicate(N, Term, List) when N > 0 ->
    tail_duplicate(N-1, Term, [Term|List]).


reverse([]) ->
    [];
reverse([H|T]) ->
    reverse(T) ++ [H].


tail_reverse(L) ->
    tail_reverse(L, []).

tail_reverse([], Acc) ->
    Acc;
tail_reverse([H|T], Acc) ->
    tail_reverse(T, [H|Acc]).


tail_nth_element(N, L) ->
    tail_nth_element(N, L, 1).

tail_nth_element(N, L, C) when N == C ->
    hd(L);
tail_nth_element(N, L, C) ->
    tail_nth_element(N, tl(L), C + 1).


sublist(_,0) ->
    [];
sublist([],_) ->
    [];
sublist([H|T], N) when N > 0 ->
    [H|sublist(T, N - 1)].


tail_sublist(L, N) ->
    reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, SubList) ->
    SubList;
tail_sublist([], _, SubList) ->
    SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
    tail_sublist(T, N - 1, [H|SubList]).


zip([], []) ->
    [];
zip([X|Xs], [Y|Ys]) ->
    [{X,Y}|zip(Xs,Ys)].


lenient_zip([], _) ->
    [];
lenient_zip(_, []) ->
    [];
lenient_zip([X|Xs], [Y|Ys]) ->
    [{X,Y}|lenient_zip(Xs, Ys)].


tail_zip(Xs, Ys) ->
    lists:reverse(tail_zip(Xs, Ys, [])).

tail_zip([], _, Res) ->
    Res;
tail_zip(_,[], Res) ->
    Res;
tail_zip([X|Xs], [Y|Ys], Res) ->
    tail_zip(Xs, Ys, [{X,Y}|Res]).


quicksort([]) ->
    [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot, Rest, [], []),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_, [], Smaller, Larger) ->
    {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot ->
	    partition(Pivot, T, [H|Smaller], Larger);
       H > Pivot ->
	    partition(Pivot, T, Smaller, [H|Larger])
    end.

lc_quicksort([]) ->
    [];
lc_quicksort([Pivot|Rest]) ->
    lc_quicksort([Smaller || Smaller <- Rest,
			     Smaller =< Pivot])
	++ [Pivot] ++
	lc_quicksort([Larger || Larger <- Rest,
				Larger > Pivot]).

tail_fib(N) ->
    tail_fib(N, 1).

tail_fib(N, Acc) when N == 0 ->
    Acc;
tail_fib(N, Acc) ->
    tail_fib(N - 1, Acc * N).
