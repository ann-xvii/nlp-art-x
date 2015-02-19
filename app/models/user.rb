class User
  include Mongoid::Document
  include ActiveModel::SecurePassword


  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :admin, type: Boolean, default: false
  field :favorite_collections, type: Object, default: {key: "", value: []}

  attr_reader :password

  # validation of password
  has_secure_password

  # set up relationships
  has_many :posts, dependent: :destroy
  has_many :galleries, dependent: :destroy


  # validate email presence, format and length
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: {case_sensitive: false}, length: {maximum: 255}
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, on: :create
  # Checks name's presence, length: 50
  validates :name, presence: true, length: {maximum: 50}
  

  def password=(unencrypted_password)
  	unless unencrypted_password.empty?
  		# store unencrypted password temporarily
  		@password = unencrypted_password
  		self.password_digest = BCrypt::Password.create(unencrypted_password)
  	end
  end


  def authenticate(unencrypted_password)
  	if BCrypt::Password.new(self.password_digest)
  		return self
  	else
  		return false
  	end
  end

 private

 # downcase email, for use prior to save
 def downcase_email
 	self.email = email.downcase
 end

end
