-module(cd_access_log).
-behaviour(cowboy_middleware).
-export([execute/2]).

execute(Req, Env) ->
	{Path, Req2} = cowboy_req:path(Req),
	{Method, Req3} = cowboy_req:method(Req2),
	{Peer, Req4} = cowboy_req:peer(Req3),
	{ProxyInfo, Req5} =
		case cowboy_req:parse_header(<<"x-forwarded-for">>, Req4) of
			{ok, ForwardedFor, ReqX} -> {ForwardedFor, ReqX};
			{undefined, _, ReqX} -> {none, ReqX}
		end,
	Report = [
		{method, Method},
		{path, Path},
		{from, Peer},
		{proxy_info, ProxyInfo}
	],
	error_logger:info_report(Report),
	{ok, Req5, Env}.
