class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.references :link, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
