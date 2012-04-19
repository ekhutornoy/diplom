class CompanyUsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = current_company.users.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_company.users.find params[:id]
  end

  def update
    @user = current_company.users.find params[:id]
    @user.update_attributes! params[:user]
    redirect_to company_users_path
  end

  def create
    @user = current_company.users.new params[:user]
    @user.save!
    redirect_to company_users_path
  end
end
