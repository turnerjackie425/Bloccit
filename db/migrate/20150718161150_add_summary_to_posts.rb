class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :summary, :posts, :string
  end
end
