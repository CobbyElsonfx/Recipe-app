class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]

  def show
    @user = User.find(params[:id])
  end
end
