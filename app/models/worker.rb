class Worker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  before_save :default_values
  def default_values
    self.earning = 0 unless self.earning
    self.submitted = 0 unless self.submitted
    self.accepted = 0 unless self.accepted
  end
  
end
