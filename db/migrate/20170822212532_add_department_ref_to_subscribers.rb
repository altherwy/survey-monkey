class AddDepartmentRefToSubscribers < ActiveRecord::Migration[5.1]
  def change
            add_reference :subscribers, :department, index: true, foreign_key: true
  end
end
