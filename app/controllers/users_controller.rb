class UsersController < ApplicationController
  attr_accessor :mapper

  def index
    @users = mapper.all
  end

  def show
    unless @user = mapper.find(params[:id])
      head :not_found
    end
  end

  def mapper
    @mapper ||= UserMapper.new
  end
end
