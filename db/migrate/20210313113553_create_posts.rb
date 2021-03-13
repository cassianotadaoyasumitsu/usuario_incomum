class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :phone
      t.string :title
      t.string :service
      t.string :company
      t.string :contact
      t.string :salary
      t.string :turn
      t.string :prefecture
      t.string :address
      t.text :description
      t.string :value
      t.text :note

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
