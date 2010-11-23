class IdentitiesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @identities = Identity.all
  end

  def show
    @identity = Identity.find(params[:id])
  end

  def new
    @identity = Identity.new
  end

  def create
    @identity = Identity.create(params[:identity])
    if @identity.errors.blank?
       current_user.identities << @identity
       redirect_to edit_identities_path, :notice => "Identity successfully created"
    else
      render :new
    end
  end

  def edit
    @identities = current_user.identities
  end

  def update
  end

end
