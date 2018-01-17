class AddOtherImagesDefaultsToVideos < ActiveRecord::Migration
  def change
    change_column_default(
      :videos,
      :small_cover_url,
      'http://via.placeholder.com/166x236'
    )
  end
end
