class User < ActiveRecord::Base
  include Tokenable

  has_secure_password validations: false
  validates_presence_of :email, :full_name, :password
  validates_uniqueness_of :email
  has_many :reviews, -> { order("created_at DESC") }
  has_many :queue_items, -> { order(:position) }

  # without foreign_key... below would look for **user_id** = this user's id
  has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :leading_relationships, class_name: "Relationship", foreign_key: :leader_id

  # before_create :generate_token

  def normalize_queue_item_positions
    queue_items.each_with_index do |queue_item, index|
      queue_item.update_attributes(position: index+1)
    end
  end

  def queued_video?(video)
    queue_items.map(&:video).include?(video)
  end

  def can_follow?(another_user)
    # !(@user == current_user || current_user.follows?(@user))
    !(self.follows?(another_user) || self == another_user)
  end

  def follow(another_user)
    following_relationships.create(leader: another_user) if can_follow?(another_user)
  end


  def follows?(another_user)
    following_relationships.map(&:leader).include?(another_user)
  end
  #
  # def generate_token
  #   self.token = SecureRandom.urlsafe_base64
  # end
end
