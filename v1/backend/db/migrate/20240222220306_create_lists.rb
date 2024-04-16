class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists, id: :uuid do |t|
      t.string :title, null: false
      t.timestamps
    end

    add_reference(:lists, :user, type: :uuid, null: false)
  end
end
