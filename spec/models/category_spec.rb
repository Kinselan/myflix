require 'spec_helper'


describe Category do

  it { should have_many(:videos)}
  it { should validate_presence_of(:name) }


  describe "#recent_videos" do
    it "returns the videos in the reverse chronical order by created_a" do
      comedies = Category.create(name: "comedy")

      futurama = Video.create(title: "Futurama", description: "space travel!", created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "crazy kids")

      futurama.categories << comedies
      south_park.categories << comedies

      expect(comedies.recent_videos).to eq([south_park, futurama])

    end
    it "returns al the videos if there are less than 6 videos" do
      comedies = Category.create(name: "comedy")

      futurama = Video.create(title: "Futurama", description: "space travel!", created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "crazy kids")

      futurama.categories << comedies
      south_park.categories << comedies

      expect(comedies.recent_videos.count).to eq(2)
    end
    it "returns only 6 videos if there are more than 6 videos" do
      comedies = Category.create(name: "comedy")

      7.times { Video.create(title: "foo", description: "crazy") }
      Video.all.each do |video|
        video.categories << comedies
      end
      # binding.pry

      expect(comedies.recent_videos.count).to eq(6)

    end
    it "returns the most recent 6 videos" do
      comedies = Category.create(name: "comedy")

      7.times { Video.create(title: "foo", description: "crazy") }
      Video.all.each do |video|
        video.categories << comedies
      end
      tonights_show = Video.create(title: "Tonight's show", description: "Talk about Trump", created_at: 1.day.ago)
      tonights_show.categories << comedies
      # binding.pry

      expect(comedies.recent_videos).not_to include(tonights_show)
    end
    it "returns an empty array if the category does not have any videos" do
      comedies = Category.create(name: "comedies")
      expect(comedies.recent_videos).to eq([])
    end
  end
  #
  #
  # it "saves itself" do
  #   category = Category.new(name: 'comedy')
  #   category.save
  #   expect(Category.first).to eq(category)
  # end
  #
  # it "can have many videos" do
  #   horror = Category.create(name: 'horror')
  #
  #   scary1 = Video.create(title: 'Z A Scary Movie', description: 'keep your eyes open')
  #   scary2 = Video.create(title: 'A Very Scary Movie', description: 'keep your eyes shut!')
  #
  #   scary1.categories << horror
  #   scary2.categories << horror
  #
  #   # expect(Category.first.videos.size).to eq(2)
  #
  #   expect(horror.videos).to eq ([scary2, scary1])
  #
  # end


end
