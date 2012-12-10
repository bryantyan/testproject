;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erlang-skel-generic-server
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setf
 erlang-skel-generic-server
 '((erlang-skel-include erlang-skel-large-header)
   "-behaviour(gen_server)." n n
   "-include_lib(\"logging.hrl\")." n
   "-include_lib(\"eunit.hrl\")." n n
   "%% API" n
   "-export([start_link/0])." n n
    
   "%% gen_server callbacks" n
   "-export([init/1, handle_call/3, handle_cast/2, "
   "handle_info/2," n>
   "terminate/2, code_change/3])." n n

   "-record(state, {conf})." n
   "-record(conf, {})." n
   "-define(SERVER, ?MODULE)." n n
    
   (erlang-skel-double-separator 2)
   "%% API" n
   (erlang-skel-double-separator 2)
   (erlang-skel-separator 2)
   "%% @spec start_link() -> {ok,Pid} | ignore | {error,Error}" n
   "%% @doc Starts the server" n
   "%% @end" n

   (erlang-skel-separator 2) 
   "start_link() ->" n>
   "gen_server:start_link({local, ?SERVER}, ?MODULE, [], [])." n
   n
   (erlang-skel-double-separator 2)
   "%% gen_server callbacks" n
   (erlang-skel-double-separator 2)
   n
   (erlang-skel-separator 2)
   "%% @private" n
   "%% @spec init(Args) -> {ok, State} |" n
   "%%                     {ok, State, Timeout} |" n
   "%%                     ignore               |" n
   "%%                     {stop, Reason}" n
   "%% @doc Initialises the server's state" n
   "%% @end" n

   (erlang-skel-separator 2)
   "init([]) ->" n>
   "{ok, #state{}}." n
   n
   (erlang-skel-separator 2)
   "%% @private" n
   "%% @spec " n
   "%% handle_call(Request, From, State) -> {reply, Reply, State} |" n
   "%%                                      {reply, Reply, State, Timeout} |" n
   "%%                                      {noreply, State} |" n
   "%%                                      {noreply, State, Timeout} |" n
   "%%                                      {stop, Reason, Reply, State} |" n 
   "%%                                      {stop, Reason, State}" n       
   "%% @doc Call message handler callbacks" n
   "%% @end" n

   (erlang-skel-separator 2)
   "handle_call(Call, _From, State) ->" n>
   "?WARN(\"Unexpected call ~p.\", [Call])," n>
   "{noreply, State}." n
   n
   (erlang-skel-separator 2)
   "%% @private" n
   "%% @spec " n
   "%% handle_cast(Msg, State) -> {noreply, State} |" n
   "%%                            {noreply, State, Timeout} |" n
   "%%                            {stop, Reason, State}" n
   "%% @doc Cast message handler callbacks" n
   "%% @end" n

   (erlang-skel-separator 2)
   "handle_cast(Msg, State) ->" n>
   "?WARN(\"Unexpected cast ~p\", [Msg])," n>
   "{noreply, State}." n
   n
   (erlang-skel-separator 2)
   "%% @private" n
   "%% @spec " n
   "%% handle_info(Info, State) -> {noreply, State} |" n
   "%%                             {noreply, State, Timeout} |" n
   "%%                             {stop, Reason, State}" n
   "%% @doc Non gen-server message handler callbacks" n
   "%% @end" n

   (erlang-skel-separator 2)
   "handle_info(Info, State) ->" n>
   "?WARN(\"Unexpected info ~p\", [Info])," n>
   "{noreply, State}." n
   n
   (erlang-skel-separator 2)
   "%% @private" n
   "%% @spec terminate(Reason, State) -> void()" n
   "%% @doc This function is called by a gen_server when it is about to"n
   "%% terminate. It should be the opposite of Module:init/1 and do any necessary"n
   "%% cleaning up. When it returns, the gen_server terminates with Reason." n
   "%% The return value is ignored." n 
   "%% @end" n
    
   (erlang-skel-separator 2)
   "terminate(_Reason, _State) ->" n>
   "ok." n
   n
   (erlang-skel-separator 2)
   "%% @private" n
   "%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}" n
   "%% @doc Convert process state when code is changed" n
   "%% @end" n

   (erlang-skel-separator 2)
   "code_change(_OldVsn, State, _Extra) ->" n>
   "{ok, State}." n
   n
   (erlang-skel-separator 2)
   "%%% Internal functions" n
   (erlang-skel-separator 2)
   ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erlang-skel-function-edoc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar erlang-skel-function-edoc
  '("%% @spec () -> " n
    "%% @doc " n
    "%% @end" n
    ))

(add-to-list 
 'erlang-skel
 '("Function edoc preamble" "function-edoc"
   erlang-skel-function-edoc)
 t)
