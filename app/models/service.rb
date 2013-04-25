class Service < ActiveRecord::Base
  attr_accessible :name, :rate, :photo
  belongs_to :hotspot
  has_attached_file :photo, :styles => { :small => "150x150>", :large => "400x400>" }
  validates_presence_of :name, :rate
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
