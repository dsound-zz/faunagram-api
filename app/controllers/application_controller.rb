class ApplicationController < ActionController::API

  

  ####### Auth pipeline #########

  def encode_token(user_id)
    JWT.encode({user_id: user_id}, Rails.application.credentials.jwt)
  end

  def token
    request.headers["Authorization"]
  end

  def decode_token
    begin
      JWT.decode(token, Rails.application.credentials.jwt[0]["user_id"])
    rescue
      nil
    end
  end

  def curr_user
    User.find_by(id: decode_token)
     
  end

end
