class User < ApplicationRecord
	has_secure_password
	has_many :comments
	before_create { generate_token(:auth_token)}
	validates :name, :email, presence: true
	validates :name, :email, uniqueness: { case_sensitive: false }
	def generate_token(colum)
		begin
			self[colum] = SecureRandom.urlsafe_base64
		end while User.exists?(colum => self[colum])
	end

	def avatar
	  gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
	  "http://gravatar.com/avatar/#{gravatar_id}.png?s=512&d=retro"
	end
end
