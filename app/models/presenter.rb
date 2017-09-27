class Presenter < ApplicationRecord
	has_and_belongs_to_many :workshops
	attr_accessor :for_edit, :workshop_id    
end
