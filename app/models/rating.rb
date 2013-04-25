class Rating < ActiveRecord::Base
  attr_accessible :rating, :hotspot_id, :member_id
  belongs_to :member
  belongs_to :hotspot

  validates_presence_of :rating
  
end
