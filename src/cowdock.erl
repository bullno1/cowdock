-module(cowdock).
-behaviour(application).
-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
	Routes = [{"/", cd_index_handler, []}],
	Dispatch = cowboy_router:compile([{'_', Routes}]),
	cowboy:start_http(cowdock_http, 100, [{port, 8080}], [{env, [{dispatch, Dispatch}]}]),
	cowdock_sup:start_link().

stop(_State) ->
	ok.
