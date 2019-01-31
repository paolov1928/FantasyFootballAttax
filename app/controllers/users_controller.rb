class UsersController < ApplicationController
  def index
  render json: User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      render json:{error: "not found"}, status:400
    end
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      render json: @user
    else
      render json:{error: "unable to create"}, status:400
    end
  end

  def signin
    @current_user = User.find_by(username: params[:username])
    if @current_user && @current_user.authenticate(params[:password])
      # render json: @current_user
      render json: {token: issue_token({id: @current_user.id})}
    else
      render json:{error: "user/pass error"}, status:400
    end
  end

  def validate
    @current_user = current_user
    if @current_user
      render json: {username: @current_user.username, token: issue_token({id: @current_user.id})}
    else
      render json:{error: "User not found"}, status:400
    end
  end



end

# The below are the console commands

# the below was great to create users
# fetch('http://localhost:3000/users', {
# 	method: 'POST',
# 	headers: {'Content-Type': 'application/json'},
# 	body: JSON.stringify({
# 		username: 'Paolo2',
# 		password: 'password'
#       })
# }
# ).then(resp => resp.json())

# the below was great to locate a user ..
# fetch('http://localhost:3000/signin', {
# 	method: 'POST',
# 	headers: {'Content-Type': 'application/json'},
# 	body: JSON.stringify({
# 		username: 'Paolo',
# 		password: 'password'
#       })
# }
# ).then(resp => resp.json())
