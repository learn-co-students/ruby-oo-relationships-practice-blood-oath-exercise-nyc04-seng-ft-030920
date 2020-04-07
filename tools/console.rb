require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

jack = Follower.new("Jack", 30, "YOLO")

illuminati = Cult.new("Illuminati", "D.C.", 1923, "All seeing eye", 10)
oath_a = BloodOath.new(12, 03, 1990, illuminati, jack)

freemason = Cult.new("Freemason", "NYC", 1950, "Rocks", 25)
oath_b = BloodOath.new(12, 03, 1990, freemason, jack)
other_cult = Cult.new("Other Cult", "LA", 1999, "Nope.", 40)
oath_a.initiation_date
jack.join_cult(freemason, 11, 22, 1960)
jack.cults
Follower.of_a_certain_age(21)
other_cult.recruit_follower(jack, 03, 02, 2000)
illuminati.cult_population
Cult.find_by_name("Illuminati")
Cult.find_by_location("NYC")
Cult.find_by_founding_year(1950)
illuminati.average_age
illuminati.my_followers_mottos
Cult.least_popular
Cult.most_common_location
jack.my_cults_slogans
Follower.most_active
Follower.top_ten
jack.fellow_cult_members
BloodOath.first_oath

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
