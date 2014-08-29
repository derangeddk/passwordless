Then /^an email is sent to (.*) with an authentication code (.*)$/ do |email, auth_code_name|
  identity = identity_from_email email
  @auth_codes[auth_code_name] = auth_code = last_auth_code_for identity
  expect(@email_store.sent_to email).to contain_email_with(auth_code)
end
