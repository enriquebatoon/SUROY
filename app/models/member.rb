class Member < ActiveRecord::Base
	attr_accessible :username, :firstname, :lastname, :email, :dob, :user_type, :password_hash, :password_salt, :password, :password_confirmation, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at

	attr_accessor :password
	before_save :encrypt_password

	has_many :companies, :dependent => :destroy, :uniq => true
	has_many :remarks, :dependent => :destroy, :uniq => true
	ajaxful_rater
	has_attached_file :photo, :styles => {:small => "50x50>", :normal => "200x200>"}

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :username
	validates_uniqueness_of :email, :username
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
	def self.authenticate(username, password)
		member = find_by_username(username)
		if member && member.password_hash == BCrypt::Engine.hash_secret(password, member.password_salt)
			member
		else
			nil
		end
	end
end
