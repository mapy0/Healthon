class AddIsValidToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :is_valid, :boolean, default: true, null: false
  end
end
