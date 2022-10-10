# frozen_string_literal: true

module TeamHelper
  def get_teams
    @teams = Team.all
    erb :'teams/index'
  end

  def get_teams_new
    @countries = Country.all
    erb :'teams/new'
  end

  def post_teams
    team = Team.new
    team.name = params[:name]
    team.country = Country.find_by(name: params[:country])
    team.save

    redirect '/teams'
  end

  def delete_team
    Team.find_by(id: params[:id]).destroy

    redirect '/teams'
  end

  def get_team
    @countries = Country.all
    @team = Team.find_by(id: params[:id])
    erb :'teams/edit'
  end

  def patch_team
    team = Team.find_by(id: params[:id])
    team.name = params[:name]
    team.country = Country.find_by(name: params[:country])
    team.save

    redirect '/teams'
  end
end
