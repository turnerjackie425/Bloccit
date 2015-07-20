class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :summary, :posts
    add_index :summary, :posts
  end
end
