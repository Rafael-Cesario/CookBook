class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes, id: :uuid do |t|
      t.uuid :list_id
      t.string :title, null: false
      t.text :ingredients, null: false
      t.text :instructions, null: false
      t.string :cooking_time, null: false

      t.timestamps
    end

    add_index :recipes, :list_id
  end
end
