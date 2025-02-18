class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp=Faraday.post(" https://github.com/login/oauth/access_token") do |req|
      req.params["client_id"]= ENV['CLIENT_ID']
      req.params['client_secret'] = ENV['CLIENT_SECRET']
      req.params['code']=params[:code]
     req.params['redirect_uri'] = "http://localhost:3000/auth"
  end
  
  body= JSON.prase(resp.body)
  session[:token] = body["access_token"]
  redirect_to root_path 
end 
end
