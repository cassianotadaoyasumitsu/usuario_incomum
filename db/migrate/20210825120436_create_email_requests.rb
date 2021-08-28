class CreateEmailRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :email_requests do |t|
      t.text :email
      t.text :content

      t.timestamps
    end
  end
end
