def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

# now you can do this in your specs:
#   before do
#     set_current_user
#   end


# def current_user
#   User.find(session[:user_id])
# end

# now use current_user instead of 'john' in test suite


def click_on_video_on_home_page(video)
  find("a[href='/videos/#{video.id}']").click
end

def sign_out
  visit sign_out_path
end
