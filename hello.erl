-module(hello).
-export([start/0]).

start() ->
  X = 'hello',
  Y = 'world',
  io:format("~s,~s!\n", [X, Y]).
