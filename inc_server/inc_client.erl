-module(inc_client).
-export([rpc/2]).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.
