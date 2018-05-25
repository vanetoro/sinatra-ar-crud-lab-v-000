
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/create' do
    @post  = Post.create(params)
    @post.save


    redirect '/posts'
  end

  get '/posts' do
      @posts = Post.all
    erb :posts
  end
end
