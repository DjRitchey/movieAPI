class CreateCovers < ActiveRecord::Migration[5.1]
  def change
    create_table :covers do |t|
      t.integer :movie_id

      t.timestamps
    end
  end
end
