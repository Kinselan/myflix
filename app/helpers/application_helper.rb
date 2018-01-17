module ApplicationHelper
  def options_for_video_reviews(selected=nil) # =nil means it is optional and defaults to nil
    # binding.pry
# options_for_select([5,4,3,2,1].map {|number| [pluralize(number, "Star")]}, selected)
    options_for_select((1..5).map {|num| [pluralize(num, "Star"), num]}, selected)
  end
end
