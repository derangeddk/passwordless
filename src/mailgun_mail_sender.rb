require "rest-client"

class MailgunMailSender
  def initialize(api_key, mailer_domain, from)
    @url = "https://api:#{api_key}@api.mailgun.net/v2/#{mailer_domain}/messages"
    @from = from
  end

  def send(to, subject, text)
    response = RestClient.post @url,
      :from => @from,
      :to => to,
      :subject => subject,
      :text => text
  end
end
