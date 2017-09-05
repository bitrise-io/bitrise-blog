Rails.application.routes.draw do
  scope :module => 'buttercms' do
    post '/subscribe_user' => 'base#subscribe_user'
    post '/posts/list_by_tag' => 'posts#fetch_posts_by_tag'
    post '/posts/list' => 'posts#fetch_posts'
    get '/posts/search' => 'posts#search_post'
    post '/posts/search' => 'posts#search'
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
