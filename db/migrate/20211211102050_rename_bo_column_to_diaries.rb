class RenameBoColumnToDiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :diaries, :bo, :body
  end
end
