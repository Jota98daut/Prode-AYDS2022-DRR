# frozen_string_literal: true

module SessionHelper
  def redirect_to_home
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      if @current_user.type == 'Admin'
        redirect '/admin'
      else
        redirect '/lobby'
      end
    else
      redirect '/login'
    end
  end

  def get_signup
    erb :'users/signup'
  end

  def post_signup
    player = Player.new(params)
    if player.save
      Tournament.all.each do |tournament|
        Score.create(player: player, points: 0, tournament: tournament)
      end
      session[:user_id] = player.id
      redirect '/' # O será mejor redirigir al login??
    else
      flash[:warning] = error_message(params[:username], params[:password], params[:password_confirmation])

      redirect '/signup'
    end
  end

  def get_logout
    session[:user_id] = nil
    redirect '/login'
  end

  def get_login
    erb :'users/login'
  end

  def post_login
    user = User.find_by username: params['username']
    if user     # if there is an user with that username
      user = user.authenticate params['password']
      if user   # and the password is correct
        session[:user_id] = user.id
        redirect '/'
      else
        flash[:warning] = 'incorrect password'
        redirect '/login'
      end
    else
      flash[:warning] = "user doesn't exist"
      redirect 'login'
    end
  end

  def error_message(username, password, password_confirmation):
    if username == ''
      return 'username must be provided'
    elsif User.find_by(username: username)
      return 'username already exists'
    elsif password == ''
      return 'password must be provided'
    elsif password_confirmation == ''
      return = 'password confirmation must be provided'
    elsif password != password_confirmation
      return "passwords don't match"
    end
end
