class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :cook_time
      t.string :instructions

      t.timestamps
    end
  end
end
