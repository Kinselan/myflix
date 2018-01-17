class AddDefaultImagesToVideos < ActiveRecord::Migration
  def change
    change_column_default(
      :videos,
      :large_cover_url,
      'http://via.placeholder.com/166x236'
    )
  end
end
