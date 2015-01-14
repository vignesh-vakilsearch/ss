class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user.present?
      @contacts = current_user.contacts
    else
      redirect_to '/users/sign_in'
    end
    #respond_with(@contacts)
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new # creates an object for contact table.. new says that it will be new record
    respond_with(@contact)
  end

  def edit
  end

  def create # this will be call to create new record
    # the data wich was submited can be accessed here in the following maner
    params[:contact][:city]
    params[:contact][:address]
    params[:contact][:user_id]
    @contact = Contact.new(contact_params)
    # by calling it here were are appling filters and white listing the data
    # there is something called as "build" this will help you to create recordes in the users name
    #this can be used in the folowing way

    current_user.build_contact(contact_params)
    # what this will do is create the contact record and automaticly create an association with the current user


    @contact.save
    respond_with(@contact)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params # this is the data which has to be saved.. its kind of white listing /// the data that can be saved into the table
      params.require(:contact).permit(:address, :city, :user_id)# the .require command filters the data the only alows
      # and .permit says that only the following fileds or variables can be save
    end
end


# this you could have done earlier