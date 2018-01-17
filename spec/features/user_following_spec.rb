require 'spec_helper'

feature 'User following' do
  scenario "user follows and unfollows someone" do

    alice = Fabricate(:user)
    category = Fabricate(:category)
    video = Fabricate(:video, categories: [category])
    Fabricate(:review, user: alice, video: video)

    sign_in
    click_on_video_on_home_page(video)
    click_link alice.full_name
    click_link "Follow"
    expect(page).to have_content(alice.full_name)

    unfollow(alice)
    expect(page).not_to have_content(alice.full_name)
  end

  def unfollow(user)
    find("a[data-method='delete']").click
  end

  def sign_in

    daniel = Fabricate(:user)
    visit login_path
    fill_in "Email Address", with: daniel.email
    fill_in "Password", with: daniel.password
    click_button "Sign in"

  end
end
