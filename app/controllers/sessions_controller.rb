# frozen_string_literal: true

# controller for session
class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[new create]

  def new; end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination.\n"
      @title = flash.now[:error]
      render 'new'
    else
      sign_in user
      redirect_to posts_path
    end
  end

  def destroy
    sign_out
    redirect_to signin_url
  end
end
