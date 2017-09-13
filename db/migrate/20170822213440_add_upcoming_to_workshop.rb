class AddUpcomingToWorkshop < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :upcoming, :boolean
  end
end
