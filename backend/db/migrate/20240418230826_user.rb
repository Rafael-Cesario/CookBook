class User < ActiveRecord::Migration[7.1]
  rename_column :users, :password, :password_digest
end
