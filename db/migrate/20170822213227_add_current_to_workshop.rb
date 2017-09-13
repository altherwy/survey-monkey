class AddCurrentToWorkshop < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :current, :boolean
  end
end
