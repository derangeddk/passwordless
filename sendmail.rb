require_relative "src/mailgun_mail_sender.rb"

mailer = MailgunMailSender.new "key-3ax6xnjp29jd6fds4gc373sgvjxteol0", "samples.mailgun.org", "test <test@deranged.dk>"
mailer.send "niels.abildgaard@gmail.com", "test", "test email"
