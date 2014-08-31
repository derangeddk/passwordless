When /^an identity, (.*), begins creation with the email (.*)$/ do |id_name, email|
  identity_service.create_identity id_name, email
end
