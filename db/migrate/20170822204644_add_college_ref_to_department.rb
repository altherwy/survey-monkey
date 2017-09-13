class AddCollegeRefToDepartment < ActiveRecord::Migration[5.1]
  def change
      add_reference :departments, :college, index: true, foreign_key: true
  end
end
