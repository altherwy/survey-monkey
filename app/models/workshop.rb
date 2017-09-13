class Workshop < ApplicationRecord
	has_and_belongs_to_many :subscribers
	has_and_belongs_to_many :presenters
    validates_presence_of :title, :goals, :skills
    accepts_nested_attributes_for :presenters
end
