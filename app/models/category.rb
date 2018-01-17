class Category < ActiveRecord::Base

  has_many :video_categories
  has_many :videos, -> { order("created_at DESC") }, :through => :video_categories

  validates_presence_of :name

  def recent_videos # return latest 6 videos, ordered by most recent first
    videos.first(6)
  end


end
