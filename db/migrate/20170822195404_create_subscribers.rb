class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :title
      t.string :name
      t.string :position
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
