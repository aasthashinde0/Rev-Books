class RemoveUserIdFromReviews < ActiveRecord::Migration[7.2]
  def change
    remove_column :reviews, :user_id, :integer
  end
end
