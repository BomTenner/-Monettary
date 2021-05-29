class ContactsController < ApplicationController

  def index
    all_contacts = Contact.all
    @contact = Contact.new
    @contacts = all_contacts.select{ |contact| contact.user_1 == current_user}
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_1 = current_user
    if @contact.save
      redirect_to contacts_path
    else
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :address_sequence)
  end
end
