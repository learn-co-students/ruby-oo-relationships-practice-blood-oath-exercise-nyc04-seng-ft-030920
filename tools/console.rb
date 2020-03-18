require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

f1 = Follower.new("Timmy", 19, "Live free or die hard.", "$$$")
f2 = Follower.new("Jane", 22, "I'm here for the free booze.")
f3 = Follower.new("Caleb", 25, "Rock'n'roll!", "$$$")
f4 = Follower.new("Rita", 31, "Live. Love. Laugh.")
f5 = Follower.new("Raquel", 18, "Where am I?")

c1 = Cult.new("HaleyBop", "Arizona", 1972, "Follow the tail.", "$$$")
c2 = Cult.new("Zodiac", "California", 1972, "What's your sign?")
c3 = Cult.new("Charlie's Angels", "California", 1969, "Helter Skelter.")
c4 = Cult.new("Velvet Underground", "New York", 1982, "We're waiting for our man.")
c5 = Cult.new("Tropical Punch", "Atlanta", 1993, "Drink the KoolAid.")
c6 = Cult.new("Crossfit", "Utah", 2005, "Uncle Rabdo made me do it.")

b1 = BloodOath.new("2018-06-10", f1, c1)
b2 = BloodOath.new("2017-09-30", f1, c3)
b3 = BloodOath.new("2016-09-30", f2, c5)
b4 = BloodOath.new("2014-05-15", f3, c1)
b5 = BloodOath.new("2015-06-15", f3, c2)
b6 = BloodOath.new("2015-06-15", f3, c3)
b7 = BloodOath.new("2015-08-15", f3, c5)
b8 = BloodOath.new("2019-04-07", f4, c1)
b9 = BloodOath.new("2016-08-20", f4, c5)
b10 = BloodOath.new("2020-02-29", f5, c4)

# 33.5 to finish initial section

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
