-module(inc_server).
-export([start/0]).

loop() ->
  receive
    {From, {inc, Counter}} ->
      N = Counter + 1,
      io:format("~p increment ~p\n", [From, N]),
      From ! {self(), N},
      loop();
    {From, {dec, Counter}} ->
      N = Counter - 1,
      io:format("decrement ~p\n", [N]),
      From ! {self(), N},
      loop();
    {From, Other} ->
      io:format("error\n"),
      From ! {self(), Other},
      loop()
  end.

start() ->
  spawn(fun loop/0).
