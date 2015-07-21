class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :posts_id, :integer
  end
end
