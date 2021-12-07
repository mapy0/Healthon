class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
     t.float "height", null: false
     t.date "birth", null: false
     t.integer "age", null: false
     t.integer "sex", default: 0, null: false
     t.timestamps
    end
  end
end
