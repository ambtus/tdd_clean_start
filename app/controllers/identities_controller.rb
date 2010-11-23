class IdentitiesController < ApplicationController
  before_filter :authenticate_person!, :except => [:index, :show]

  def index
    @identities = Identity.all
  end

  def show
    if params[:person_id]
      @person = Person.find(params[:person_id])
      if @person
        if @person == current_person
          @identities = @person.identities
          render :show_mine
        elsif current_person
          redirect_to person_identities_path(current_person), :alert => "Sorry, you can only manage your own identities"
        else
          redirect_to new_person_session_path, :notice => "Please log in to manage your identities"
        end
      end
    else
      @identity = Identity.find(params[:id])
    end
  end

  def new
    @person = Person.find(params[:person_id])
    if @person
      if @person == current_person
        @identity = Identity.new
      elsif current_person
        redirect_to person_identities_path(current_person), :alert => "Sorry, you can only manage your own identities"
      end
    else
     redirect_to root_path, :notice => "You can only add an identity to a person"
    end
  end

  def create
    @person = Person.find(params[:person_id])
    if @person
      if @person == current_person
        @identity = Identity.create(params[:identity])
        if @identity.errors.blank?
          @person.identities << @identity
          redirect_to person_identities_path(@person), :notice => "Identity successfully created"
        else
          render :new
        end
      elsif current_person
        redirect_to person_identities_path(current_person), :alert => "Sorry, you can only manage your own identities"
      end
    else
      redirect_to root_path, :notice => "You can only add an identity to a person"
    end
  end

end
