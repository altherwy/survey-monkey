class CreateJoinTableWorkshopPresenter < ActiveRecord::Migration[5.1]
  def change
    create_join_table :workshops, :presenters do |t|
      # t.index [:workshop_id, :presenter_id]
      # t.index [:presenter_id, :workshop_id]
    end
  end
end
