class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @stocks = @user.stocks
  end

  def search
    if params[:user].present?
      @users = User.search(params[:user])
      @users = current_user.except_current_user(@users)
      if @users
        respond_to do |format|
          format.js { render partial: 'users/search_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "We couldn't find a user with that information"
          format.js { render partial: 'users/search_result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "please enter a user to search"
        format.js { render partial: 'users/search_result' }
      end
    end
  end
end
