class Remark < ActiveRecord::Base
  attr_accessible :remark, :hotspot_id
  belongs_to :member
  belongs_to :hotspot

  validates_presence_of :remark
  

  def self.search(search)
    if search
      where('remark LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
