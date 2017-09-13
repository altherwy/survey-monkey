class CreateWorkshops < ActiveRecord::Migration[5.1]
  def change
    create_table :workshops do |t|
      t.string :title
      t.date :date
      t.string :goals
      t.string :skills

      t.timestamps
    end
  end
end
