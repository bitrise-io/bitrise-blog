Rails.application.routes.draw do

  scope :module => 'buttercms' do
    post '/posts/list' => 'posts#fetch_posts'
    post '/categories/:slug/posts' => 'categories#fetch_posts'
    post '/authors/:slug/posts' => 'authors#fetch_posts'
    get '/categories/:slug' => 'categories#show', :as => :buttercms_category
    get '/author/:slug' => 'authors#show', :as => :buttercms_author

    get '/rss' => 'feeds#rss', :format => 'rss', :as => :buttercms_blog_rss
    get '/atom' => 'feeds#atom', :format => 'atom', :as => :buttercms_blog_atom
    get '/sitemap.xml' => 'feeds#sitemap', :format => 'xml', :as => :buttercms_blog_sitemap

    get '(/page/:page)' => 'posts#index', :defaults => {:page => 1}, :as => :buttercms_blog
    get '/:slug' => 'posts#show', :as => :buttercms_post
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
