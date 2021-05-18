# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/bookmark'

# Controller for bookmark manager application
class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect('/bookmarks')
  end
end
