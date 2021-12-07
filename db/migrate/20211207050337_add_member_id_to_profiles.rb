class AddMemberIdToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :member_id, :integer
  end
end
