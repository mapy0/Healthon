class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    
  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :rec_images, :record_id, true
  end

  def down
    change_column_null :rec_images, :record_id, false
  end
    
    
    
  end
end
