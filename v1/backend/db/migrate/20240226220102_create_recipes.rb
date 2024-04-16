class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes, id: :uuid do |t|
      t.string :title, null: false
      t.text :ingredients, null: false
      t.text :instructions, null: false
      t.string :cooking_time, null: false
      t.timestamps
    end

    add_reference(:recipes, :list, type: :uuid, null: false)
  end
end
