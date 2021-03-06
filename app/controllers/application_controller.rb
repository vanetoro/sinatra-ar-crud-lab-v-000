
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
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
      erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end


get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  # binding.pry
  erb :edit
end

  patch '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    redirect "/posts/#{@posts.id}"
end

  delete '/posts/:id/delete' do
    Post.destroy(params[:id])
  end

end
