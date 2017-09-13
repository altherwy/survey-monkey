class CreateJoinTableWorkshopSubscriber < ActiveRecord::Migration[5.1]
  def change
    create_join_table :workshops, :subscribers do |t|
      # t.index [:workshop_id, :subscriber_id]
      # t.index [:subscriber_id, :workshop_id]
    end
  end
end
