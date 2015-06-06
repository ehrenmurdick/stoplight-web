class CcUrlsController < ApplicationController
  attr_accessor :mapper

  def index
    @cc_urls = mapper.all
  end

  def mapper
    @mapper ||= CCUrlMapper.new
  end
end
