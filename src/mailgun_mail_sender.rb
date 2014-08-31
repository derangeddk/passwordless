require "rest-client"

class MailgunMailSender
  def initialize(api_key, mailer_domain, from)
    @url = "https://api:#{api_key}@api.mailgun.net/v2/#{mailer_domain}/messages"
    @from = from
  end

  def send(to, subject, text)
    begin
      RestClient.post @url,
        :from => @from,
        :to => to,
        :subject => subject,
        :text => text
      true
    rescue
      false
    end
  end
end
