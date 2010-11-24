class ChaptersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @work = Work.find(params[:work_id])
    @work.chapters.build
  end

  def show
    @work = Work.find(params[:work_id])
    @number = params[:id].to_i - 1
  end
end
