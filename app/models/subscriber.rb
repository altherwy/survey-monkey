class Subscriber < ApplicationRecord
	belongs_to :department
	has_and_belongs_to_many :workshops
	attr_accessor :work_id
end
