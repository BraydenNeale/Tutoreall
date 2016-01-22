class SitemapsController < ApplicationController
  def show
    redirect_to 'https://s3.amazonaws.com/tutorial-academy/sitemaps/sitemap.xml.gz'
  end
end