class CreateHighInterest < ActiveRecord::Migration
  def change
    create_table :high_interests do |t|
      t.integer :user_id, null: false
      t.integer :account_id # nullable because may be associated later
      t.integer :rate_points
      
      t.timestamps null: false
    end
  end
end
