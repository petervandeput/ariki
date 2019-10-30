class SitemapsController < ApplicationController
  layout :false
  before_action :init_sitemap
  def index
    #TODO create a public collection of the pages/posts you want to render in your sitemap and update the views/sitemap/index.xml.builder to parse it
    #@posts =Post.where('draft = ? AND publish_date <= ?  ', false, Time.current)
  end

  def init_sitemap
    headers['Content-Type'] = 'application/xml'
  end
end