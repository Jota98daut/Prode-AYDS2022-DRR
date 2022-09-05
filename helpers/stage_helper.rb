module StageHelper
    def get_stages_new 
        @tournament = Tournament.find_by(id: params[:tournament_id])
        erb :'stages/new'
    end

    def post_stages 
        Stage.create(params)
        redirect '/tournaments/' + params[:tournament_id]
    end

    def get_stage 
        @stage = Stage.find_by(id: params[:id])
        erb :'stages/edit'
    end

    def delete_stage 
        stage = Stage.find_by(id: params[:id])
        tournament = stage.tournament
        stage.destroy
        redirect "/tournaments/#{stage.tournament_id}"
    end

    def patch_stage 
        stage = Stage.find_by(id: params[:id])

        if params[:penalties] == "Yes"
            stage.update(name: params[:name], penalties: true)
        else
            stage.update(name: params[:name], penalties: false)
        end

        redirect "/tournaments/#{stage.tournament_id}"
    end
end