class ContactController < ApplicationController
  
  respond_to :json

  def contact
    @contact = Contact.new
  end
  
  def create_contact
    @contact = Contact.new(contact_parmas)
    if @contact.save
      render json: nil, status: 200
      # flash[:notice] = "Thank you... will get back soon"
      # redirect_to root_path
    else
      render :json => {:errors => @contact.errors.messages}, :status => 422
    end
  end

  private
  def contact_parmas
    params.require(:contact).permit(:name, :email, :message)
  end
end