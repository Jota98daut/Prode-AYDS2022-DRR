require 'sinatra/base'

class App < Sinatra::Application
    def initialize(app = null)
        super()
    end

    get '/' do
        'Welcome'
    end
end