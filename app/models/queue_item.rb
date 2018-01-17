class QueueItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  validates_numericality_of :position, {only_integer: true}


  # KEEP AS INSTRUCTION: delegate :category, to: :video
  # above line would make below method unnecessary
  # def category
  #   video.category
  # end

  delegate :title, to: :video, prefix: :video
  # above makes below unnecessary
  # def video_title
  #   video.title
  # end

  def rating
    review.rating if review
  end

  def rating=(new_rating) # creating a 'virtual attribute' for active record model. in fact, rating is not part of the queue_item model, but we can pretend it is

    # update_column instead of update_attributes so we can skip validations on the model (which require a rating)
    if review
      review.update_column(:rating, new_rating)
    else
      review = Review.new(user: user, video: video, rating: new_rating)
      review.save(validate: false) # because we don't have content
    end
  end

  def category_name
    # if we delegated to :category, below could just be category.name
    video.categories.first.name
  end

  def category
    video.categories.first
  end

  private

  def review # uses memoization
    @review ||= Review.where(user_id: user.id, video_id: video.id).first
  end

end
