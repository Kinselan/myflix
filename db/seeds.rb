# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


daniel = User.create(full_name: 'Daniel Nalesnik', email: 'daniel.nalesnik@gmail.com', password: 'algonquin')
tania = User.create(full_name: 'Tania Cheung', email: 'tc@missrunner.com', password: 'daniel')


horror = Category.create(name: "horror")
comedy = Category.create(name: "comedy")
drama = Category.create(name: "drama")
history = Category.create(name: "history")
anime = Category.create(name: "anime")
adult = Category.create(name: "adult")
kids = Category.create(name: "kids")


spiderman = Video.create(title: "Spiderman", description: "He's here to help you weave your way out of trouble.", categories: [horror, kids])
Video.create(title: "Superman", description: "Basically God, you better be super sure he's on your side!", categories: [horror])
Video.create(title: "Fantastic 5", description: "Beats the Fantastic 4, most times out of ten.", categories: [horror])
Video.create(title: "Upside Down World", description: "She didn't fall from heaven; she cralwed up from hell.", categories: [horror])
Video.create(title: "Not another teen movie", description: "He's here to help you weave your way out of trouble.", categories: [horror])
Video.create(title: "Another adult movie", description: "Basically God, you better be super sure he's on your side!", categories: [horror])
Video.create(title: "Up!", description: "Beats the Fantastic 4, most times out of ten.", categories: [horror])
Video.create(title: "Perfect Man", description: "She didn't fall from heaven; she cralwed up from hell.", categories: [horror, kids])
Video.create(title: "Perfect Woman", description: "He's here to help you weave your way out of trouble.", categories: [horror])
Video.create(title: "The best way to live", description: "Basically God, you better be super sure he's on your side!", categories: [horror])
Video.create(title: "Titanic", description: "Beats the Fantastic 4, most times out of ten.", categories: [comedy])
Video.create(title: "No Way Jose", description: "She didn't fall from heaven; she cralwed up from hell.", categories: [history])
Video.create(title: "Tissues", description: "He's here to help you weave your way out of trouble.", categories: [anime])
Video.create(title: "Gulp", description: "Basically God, you better be super sure he's on your side!", categories: [adult, kids])
Video.create(title: "Unbelievable", description: "Beats the Fantastic 4, most times out of ten.", categories: [comedy])
Video.create(title: "Believe It", description: "She didn't fall from heaven; she cralwed up from hell.", categories: [history])
Video.create(title: "Man-spider", description: "He's here to help you weave your way out of trouble.", categories: [history])
Video.create(title: "Gorgeous", description: "Basically God, you better be super sure he's on your side!", categories: [anime, kids])
Video.create(title: "Fantastic 456", description: "Beats the Fantastic 4, most times out of ten.", categories: [anime])
Video.create(title: "Not again!", description: "She didn't fall from heaven; she cralwed up from hell.", categories: [anime])

Review.create(user: daniel, video: spiderman, rating: 5, content: "Great movie!")
Review.create(user: tania, video: spiderman, rating: 2, content: "Not so good la..")
