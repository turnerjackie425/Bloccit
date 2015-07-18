class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :summary
  end
end
