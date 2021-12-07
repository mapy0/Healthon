class AddMemberIdToAims < ActiveRecord::Migration[5.2]
  def change
    add_column :aims, :member_id, :integer
  end
end
