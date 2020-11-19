# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://cowgo.herokuapp.com"

SitemapGenerator::Sitemap.create do
  add '/home/index'
  add '/users/sign_in'
  add '/users/sign_up'
  add '/users/edit'
  add '/users/password/new'
  add '/users/password/edit'
  add '/users/:id/jobs'
  add '/users/profile/:id'
  add '/users/profile/:id/edit'
  add '/users/profile/:id/create_address'
  add '/jobs/:id'
  add '/jobs/:id/edit'
  add '/jobs/new'

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
end
