class WorksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def edit
    @works = current_user.works
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create(params[:work])
    if @work.errors.blank?
       current_user.works << @work
       redirect_to edit_works_path, :notice => "Work successfully created"
    else
      render :new
    end
  end

end
