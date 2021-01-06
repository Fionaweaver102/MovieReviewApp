class Reviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :movie_title 
      t.string :review_description
      t.string :image
      t.string :date_published 
      t.integer :user_id
    end 
  end
end
