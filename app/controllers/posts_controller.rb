class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
  end

  def new
  end
  
end