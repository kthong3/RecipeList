class CreatePinnedRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :pinned_recipes do |t|
      t.references :user
      t.references :recipe

      t.timestamps
    end
  end
end
