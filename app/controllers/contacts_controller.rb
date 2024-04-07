class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_email(@contact).deliver_later # Send email asynchronously
      redirect_to new_contact_path, notice: "Message sent successfully 🚀"
    else
      flash.now[:alert] = "Failed to send message. Please try again."
      render :new
    end
  rescue StandardError => e
    # Handle any exceptions that occur during email sending
    Rails.logger.error "Error sending email: #{e.message}"
    flash.now[:alert] = "An error occurred while sending the message. Please try again later."
    render :new
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
