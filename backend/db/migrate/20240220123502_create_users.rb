class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
