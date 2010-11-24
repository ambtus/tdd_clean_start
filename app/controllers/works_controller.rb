class WorksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
    @work.chapters.build
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

  def edit
    @identities = current_user.identities
    @works = current_user.works
    if @works.blank?
      redirect_to new_works_path, :notice => "You have no works" and return
    end
  end

  def update
    work = Work.find(params[:id])
    work.identity_id = params[:work][:identity_id]
    flash[:notice] = work.save ? "#{work.title} updated" : "Something went wrong"
    redirect_to edit_works_path
  end

end
