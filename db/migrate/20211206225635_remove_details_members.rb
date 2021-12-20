class RemoveDetailsMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :aim_w, :float
    remove_column :members, :aim_bf, :float
    remove_column :members, :aim_mus, :float
    remove_column :members, :aim_sm, :float
    remove_column :members, :height, :float
    remove_column :members, :birth, :date
    remove_column :members, :age, :integer
    remove_column :members, :sex, :integer
    remove_column :members, :self_introduction, :string
    remove_column :members, :image_id, :string
  end
end
