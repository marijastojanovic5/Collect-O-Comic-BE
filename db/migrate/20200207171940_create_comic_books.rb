class CreateComicBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :comic_books do |t|
      t.string :image
      t.string :name
      t.string :description
      t.integer :count_of_episodes
      t.integer :rating

      t.timestamps
    end
  end
end
