class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :string
    add_column :users, :kind, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :prefecture, :string
    add_column :users, :nihongo, :string
    add_column :users, :note, :text
    add_column :users, :work, :boolean
    add_column :users, :extra, :string
  end
end
