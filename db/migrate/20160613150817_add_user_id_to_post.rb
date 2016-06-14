class AddUserIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer, after: :group_id
  end
end
