class RepositoriesController < ApplicationController
  
  def index
    resp=Faraday.get()
  end
  
  
end
