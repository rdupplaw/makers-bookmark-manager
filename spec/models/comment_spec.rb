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
end
