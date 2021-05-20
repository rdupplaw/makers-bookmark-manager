# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/bookmark'

# Controller for bookmark manager application
class BookmarkManager < Sinatra::Base
  enable :method_override

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
    Bookmark.create(title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params['id'])
    redirect('/bookmarks')
  end
end
