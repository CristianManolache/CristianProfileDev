class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now # Send the email
      redirect_to new_contact_path, flash: { success: "Message sent! Thank you for reaching out." }
    else
      flash.now[:alert] = "Failed to send message. Please try again."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
