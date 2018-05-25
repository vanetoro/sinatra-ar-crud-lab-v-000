
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
    # binding.pry
    @post  = Post.create(params)
    @post.save
    # binding.pry
    @posts = Post.all

    redirect '/posts'
  end

  get '/posts' do
    binding.pry
    erb :posts
  end
end
