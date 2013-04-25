class Company < ActiveRecord::Base
  attr_accessible :name, :description, :address, :approved, :member_id
  belongs_to :member
  has_many :hotspots, :dependent => :destroy, :uniq => true

  validates_presence_of :name, :description, :address
  

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
