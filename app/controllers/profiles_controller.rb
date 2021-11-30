class ProfileController < ApplicationController
  def index
    if params[:query].present?
    sql_query = "email ILIKE :query OR first_name ILIKE :query OR last_name ILIKE :query"
    @profiles = User.where(sql_query, query: "%#{params[:query]}%")
  else
    @profiles = User.all
    end
  end

   def show
    @profile = User.find(params[:id])
  end

  def new
    @profile = current_user
  end
end
