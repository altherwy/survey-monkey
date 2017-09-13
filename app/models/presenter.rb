class Presenter < ApplicationRecord
	has_and_belongs_to_many :workshops
    validates_presence_of :name, :position
end
