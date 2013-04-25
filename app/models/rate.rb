class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "Member"
  belongs_to :rateable, :polymorphic => true
  validates_numericality_of :stars, :minimum => 1, :maximum => 5
  
  attr_accessible :rate, :dimension
end
