class UsersController < ApplicationController
  attr_accessor :mapper

  def index
    @users = mapper.all
  end

  def mapper
    @mapper ||= UserMapper.new
  end
end
