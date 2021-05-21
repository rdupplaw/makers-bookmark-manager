require 'comment'

describe Comment do
  describe '::create' do
    it 'adds a comment' do
      bookmark = Bookmark.create(title: 'test bookmark', url: 'https://test.com')
      comment = Comment.create(text: 'test comment', bookmark_id: bookmark.id)

      persisted_data = DatabaseConnection.query('SELECT * FROM comments WHERE bookmark_id=1')

      expect(comment).to be_a(Comment)
      expect(comment.id).to eq(persisted_data[0]['id'])
      expect(comment.text).to eq('test comment')
      expect(comment.bookmark_id).to eq(bookmark.id)
    end
  end

  describe '::where' do
    it 'returns all comments with a given bookmark id' do
      bookmark = Bookmark.create(title: 'test bookmark', url: 'https://test.com')
      comment = Comment.create(text: 'first test comment', bookmark_id: bookmark.id)
      comment = Comment.create(text: 'second test comment', bookmark_id: bookmark.id)
      comment = Comment.create(text: 'third test comment', bookmark_id: bookmark.id)

      result = Comment.where(bookmark_id: bookmark.id)
      persisted_data = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id=#{bookmark.id};")

      expect(result.length).to eq(3)
      expect(result.first).to be_a(Comment)
      expect(result.first.id).to eq(persisted_data.first['id'])
      expect(result.first.text).to eq('first test comment')
      expect(result.first.bookmark_id).to eq(bookmark.id)
    end
  end
end
