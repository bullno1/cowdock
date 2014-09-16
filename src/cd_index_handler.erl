-module(cd_index_handler).
-behaviour(cowboy_http_handler).
-export([init/3, handle/2, terminate/3]).

init(_, Req, _) -> {ok, Req, []}.

terminate(_, _, _) -> ok.

handle(Req, State) ->
	{ok, Req2} = cowboy_req:reply(200, [{"Content-Type", "text/plain"}], "Hello world", Req),
	{ok, Req2, State}.
