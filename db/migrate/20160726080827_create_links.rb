class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :user, index: true, foreign_key: true
      t.string :url
      t.text :title
      t.integer :bunrui

      t.timestamps null: false
      t.index [:user_id, :bunrui]
    end
  end
end
