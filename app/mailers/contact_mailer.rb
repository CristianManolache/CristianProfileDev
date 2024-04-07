class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: 'mlcristian@outlook.com', subject: 'New Contact Message')
  end
end
