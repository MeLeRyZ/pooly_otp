defmodule Pooly.Supervisor do
    # the main, top-level SV
    use Supervisor

    def start_link(pool_config) do
        Supervisor.start_link(__MODULE__, pool_config)
    end

    def init(pool_config) do
        children = [ worker( Pooly.Server, [self, pool_config])]

        opts = [strategy: :one_for_all]

        supervise(children, opts) # consists Pooly.Server
    end
    # Pooly.Server.start_link takes 1. pid of this SV; 2. pool_config

end
