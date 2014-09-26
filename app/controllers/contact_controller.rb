class ContactController < ApplicationController
  
  respond_to :json

  def contact
    @contact = Contact.new
  end
  
  def create_contact
    @contact = Contact.new(contact_parmas)
    if @contact.save
      flash[:notice] = "Thank you... will get back as soon as I can"
      redirect_to root_path
    else
      flash[:alert] = "failed"
      render "contact"
    end
  end

  
  private
  def contact_parmas
    params.require(:contact).permit(:name, :email, :message)
  end
end