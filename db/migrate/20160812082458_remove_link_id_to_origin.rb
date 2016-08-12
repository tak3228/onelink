class RemoveLinkIdToOrigin < ActiveRecord::Migration
  def change
    remove_column :origins, :link_id, :string
  end
end
