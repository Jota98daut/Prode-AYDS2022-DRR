module SportHelper

    def get_sports
        @sports = Sport.all
        erb :'sports/index'
    end

    def patch_sports
        Sport.find_by(id: params[:id]).update(name: params[:new_name])
        redirect '/sports'
    end

    def post_sports
        Sport.create( name: params[:name] )
        redirect '/sports'
    end

    def delete_sports
        Sport.find_by(id: params[:id]).destroy
        redirect '/sports'
    end

end