class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.user_id :user
      t.post_id :post

      t.timestamps null: false
    end
  end
end
