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
    unless player.save
      flash[:warning] = error_message(params)
      redirect '/signup'
    end
    player.create_scores
    session[:user_id] = player.id
    redirect '/' # O será mejor redirigir al login??
  end

  def get_logout
    session[:user_id] = nil
    redirect '/login'
  end

  def get_login
    erb :'users/login'
  end

  def post_login
    user = User.find_by username: params[:username]

    redirect '/login' unless auth_user(user, params[:password])

    session[:user_id] = user.id
    redirect '/'
  end

  def auth_user(user, password)
    unless user # if there is an user with that username
      flash[:warning] = "user doesn't exist"
      return false
    end

    unless user.authenticate password  # and the password is correct
      flash[:warning] = 'incorrect password'
      return false
    end
    true
  end

  def error_message(params)
    username = params[:username]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    if (username == '') || (password == '')
      'username and password must be provided'
    elsif User.find_by(username: username)
      'username already exists'
    elsif password != password_confirmation
      "passwords don't match"
    end
  end
end
