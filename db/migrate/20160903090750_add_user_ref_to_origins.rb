class AddUserRefToOrigins < ActiveRecord::Migration
  def change
    add_reference :origins, :user, index: true, foreign_key: true
  end
end
