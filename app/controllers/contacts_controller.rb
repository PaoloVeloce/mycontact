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

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:success] = "Successfully updated contact!"
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:success] = "Successfully deleted contact"
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :company, :email, :contactphone, :workphone, :address, :telegram, :whatsapp, :viber, :history)
  end
end
