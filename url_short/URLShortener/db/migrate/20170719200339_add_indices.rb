class AddIndices < ActiveRecord::Migration
  def change
    add_index :visits, [:user_id, :url_id]
  end
end
