   module LobbyHelper

    def get_lobby
        @tournaments = Tournament.all
        erb :'users/lobby'
    end

    def get_admin
        erb :'users/admin'
    end

end