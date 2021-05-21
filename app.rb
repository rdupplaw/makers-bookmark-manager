# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'
require_relative './database_connection_setup'

# Controller for bookmark manager application
class BookmarkManager < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end

  post '/bookmarks' do
    flash[:error] = 'Error: Invalid URL' unless Bookmark.create(title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params['id'])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb(:'bookmarks/edit')
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params['id'], title: params['title'], url: params['url'])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb(:'comments/new')
  end

  post '/bookmarks/:id/comments' do
    DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES ('#{params[:text]}', #{params[:id]});")
    redirect('/bookmarks')
  end
end
