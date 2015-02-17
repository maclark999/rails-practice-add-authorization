class ClubsController < ApplicationController

  before_action :authenticate

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
    @student = current_student.clubs

    unless @student.include? @club
      render 'public/403.html'

    end
  end

end
