class AddCategoryToConcepts < ActiveRecord::Migration
  def change
    add_column :concepts, :category, :string
  end
end
