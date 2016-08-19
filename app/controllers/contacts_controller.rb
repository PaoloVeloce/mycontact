class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Succesfully created new contact"
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :company, :email, :contactphone, :workphone, :address, :telegram, :whatsapp, :viber, :history)
  end
end
