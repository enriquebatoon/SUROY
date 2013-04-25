class Hotspot < ActiveRecord::Base
  attr_accessible :name, :description, :location, :photo
  belongs_to :company
  has_many :services, :dependent => :destroy, :uniq => true
  has_many :remarks, :dependent => :destroy, :uniq => true
  ajaxful_rateable :stars => 5, :allow_update => true
  has_attached_file :photo, :styles => { :small => "150x150>", :large => "400x400>" }
  validates_presence_of :name, :description, :location
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 20.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end