class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :location
      t.string :date
      t.string :review
      t.integer :user_id
    end
  end
end
