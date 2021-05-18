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
    erb(:bookmarks)
  end
end
