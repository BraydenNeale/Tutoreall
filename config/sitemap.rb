# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.tutorial.academy/"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add '/home'
  add '/about'
  add '/terms_of_use'
  add '/privacy_policy'

  add tutors_path

  Tutor.find_each do |tutor|
    add tutor_path(tutor), lastmod: tutor.updated_at
  end

  Lesson.find_each do |lesson|
    add lesson_path(lesson), lastmod: lesson.updated_at
  end
end

SitemapGenerator::Sitemap.ping_search_engines