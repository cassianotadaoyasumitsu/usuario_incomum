class RemoveUserFromShares < ActiveRecord::Migration[6.0]
  def change
    remove_reference :shares, :user, null: false, foreign_key: true
  end
end
