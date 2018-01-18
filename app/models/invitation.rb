class Invitation < ActiveRecord::Base
  include Tokenable

  belongs_to :inviter, class_name: "User"

  # before_create :generate_token # moved to /lib/tokenable.rb

  validates_presence_of :recipient_name, :recipient_email, :message

  # def generate_token
  #   self.token = SecureRandom.urlsafe_base64
  # end

end
