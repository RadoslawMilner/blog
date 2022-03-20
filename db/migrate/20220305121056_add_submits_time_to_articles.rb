class AddSubmitsTimeToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :submits_time, :datetime
  end
end
