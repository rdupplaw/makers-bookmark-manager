# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns an array of all bookmarks' do
      wipe_table
      add_test_bookmarks
      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end
end
