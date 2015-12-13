-module(what_the_if).
-export([heh_fine/0, oh_god/1, help_me/1, greater_than/1, equal_to/1]).

heh_fine() ->
    if 1 =:= 1 ->
            works
    end,
    if 1 =:= 2; 1 =:= 1 ->
            works
    end,
    if 1 =:= 2, 1 =:= 1 ->
            fails
    end.

oh_god(N) ->
    if N =:= 2 ->
            might_succeed;
       true -> always_does
    end.

%% TODO: Make this as a patern match in function head
help_me(Animal) ->
    Talk = if Animal == cat ->
                   "meow";
              Animal == beef ->
                   "mooo";
              Animal == dog ->
                   "bark";
              Animal == tree ->
                   "bark";
              true ->
                   "fgdadfgna"
           end,
    {Animal, "says " ++ Talk ++ "!"}.

help_me(Animal) when Animal == cat ->
    {Animal, "says me meow!"}.

greater_than(X) ->
    if X > 2 ->
            true;
       X =< 2 ->
            false
    end.

equal_to(X) ->
    if X =:= 2 ->
            true;
       X =< 2; X > 2 ->
            false
    end.
