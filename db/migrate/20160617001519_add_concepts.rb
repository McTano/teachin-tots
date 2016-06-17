class AddConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :word, null: false
      t.string :image, null: false
      t.timestamps null: false
    end
  end
end
