class ChaptersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @work = Work.find(params[:work_id])
    @chapter = @work.chapters.build
  end
end
