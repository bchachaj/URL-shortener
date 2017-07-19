class AddTimeToVisit < ActiveRecord::Migration
  def change_table
    add_column(:visits, :created_at, :datetime)
  end
end
