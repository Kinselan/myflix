require 'spec_helper'

describe Video do
  # Do not need to test this, because you don't own the rails code
  # it "saves itself" do
  #   video = Video.new(title:'The Big Short', description: 'You better believe it will not be long enough!')
  #   video.save
  #   expect(Video.first).to eq(video)
  # end

  it { should have_many(:categories)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  it { should have_many(:reviews).order("created_at DESC")}

  describe "search_by_title" do
    it "returns an empty array if there is no match" do
      futurama = Video.create(title: "Futurama", description: "Space travel")
      back_to_future = Video.create(title: "Back to the Future", description: "Time Travel!")
      expect(Video.search_by_title("hello")).to eq([])
    end
    it "returns an array of one video for an exact match" do
      futurama = Video.create(title: "Futurama", description: "Space travel")
      back_to_future = Video.create(title: "Back to the Future", description: "Time Travel!")
      expect(Video.search_by_title("Futurama")).to eq([futurama])
    end
    it "returns an array of one video for a partial match" do
      futurama = Video.create(title: "Futurama", description: "Space travel")
      back_to_future = Video.create(title: "Back to the Future", description: "Time Travel!")
      expect(Video.search_by_title("urama")).to eq([futurama])
    end
    it "returns an array of all matches ordered by created_at" do
      futurama = Video.create(title: "Futurama", description: "Space travel", created_at: 1.day.ago)
      back_to_future = Video.create(title: "Back to the Future", description: "Time Travel!")
      expect(Video.search_by_title("Futur")).to eq([back_to_future, futurama])
    end

    it "returns an empty array for a search with an empty string" do
      futurama = Video.create(title: "Futurama", description: "Space travel", created_at: 1.day.ago)
      back_to_future = Video.create(title: "Back to the Future", description: "Time Travel!")
      expect(Video.search_by_title("")).to eq([])
    end
  end





  # shoulda matchers (above) simplify the logic and we dont' need anything below:


  # it "belongs to category" do
  #   dramas = Category.create(name: 'dramas')
  #   monk = Video.create(title: 'monk', description: 'a great video')
  #   monk.categories << dramas
  #
  #   expect(monk.categories).to include(dramas)
  # end
#
#   it "does not save a video without a title" do
#     video = Video.create(description: 'a great video!')
#     expect(Video.count).to eq(0)
#   end
#
#   it "does not save a video without a description" do
#     video = Video.create(title: 'superman')
#     expect(Video.count).to eq(0)
#   end
# end

end
# add tests for 'title' and 'description' are required
