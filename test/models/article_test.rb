require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  @article.picture.attach(io: File.open('/path/to/file'), filename: 'file.jpg')

end
