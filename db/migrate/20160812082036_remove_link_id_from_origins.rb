class RemoveLinkIdFromOrigins < ActiveRecord::Migration
  def change
    remove_column :origins, :Link_id, :integer
  end
end
