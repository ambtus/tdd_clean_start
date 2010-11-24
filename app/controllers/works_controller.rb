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
       flash[:notice] = "Work successfully created"
       redirect_to (@work.chaptered? ? new_work_chapter_path(@work) : edit_works_path)
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
    work.update_attributes(params[:work])
    flash[:notice] = work.save ? "#{work.title} updated" : "Something went wrong"
    redirect_to (work.complete? ? edit_works_path : new_work_chapter_path(work))
  end

end
