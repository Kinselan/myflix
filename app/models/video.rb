class Video < ActiveRecord::Base
  has_many :video_categories
  has_many :categories, through: :video_categories
  has_many :reviews, -> { order("created_at DESC") }


  

  validates_presence_of :title, :description

  def average_rating
    3.5 # todo implement this bitch
  end

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
    # % before and after make anything before/after search term match
  end


end
