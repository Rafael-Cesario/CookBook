class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists, id: :uuid do |t|
      t.uuid :user_id
      t.string :title, null: false

      t.timestamps
    end

    add_index :lists, :user_id
  end
end
