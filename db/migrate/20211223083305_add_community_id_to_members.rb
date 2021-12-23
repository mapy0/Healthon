class AddCommunityIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :community_id, :integer
  end
end
