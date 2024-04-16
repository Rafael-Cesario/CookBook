module HeaderHelper
  def authorization_header(user_data)
    params = { authentication: { email: user_data[:email], password: user_data[:password] }}
    post "/api/authentication", params: params
    { "Authorization" => "Bearer #{json["token"]}" }
  end
end
