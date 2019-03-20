class CreateRingsReviews < ActiveRecord::Migration
  def change
    create_table :ringsreviews do |t|
      t.string :location
      t.date :date
      t.string :review
      t.integer :user_id
    end
  end
end
