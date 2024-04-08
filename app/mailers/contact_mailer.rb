class ContactMailer < ApplicationMailer
  default to: "mlcristian@outlook.com",
          from: "contact@mlcristian.com"

  def contact_email(contact)
    @contact = contact
    mail(
      "reply-to": @contact.email,
      subject: "New Contact Message from mlcristian.com",
      body: "Name: #{@contact.name}\n\nMessage: #{@contact.message}"
    )
  end
end
