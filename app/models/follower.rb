class Follower
    attr_accessor :motto, :subscriber
    attr_reader :name, :age
    include PremiumFollower

    @@all = []

    def initialize(name, age, motto = "Yolo", subscriber = nil)
        @name = name
        @age = age
        @motto = motto
        @subscriber = subscriber
        @@all << self
    end

    def self.all
        @@all
    end

    def my_blood_oaths
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def cults
        my_blood_oaths.map(&:cult)
    end

    def join_cult(cult, date)
        cult.recruit_follower(self, date)
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end

    def my_cults_slogans
        cults.map(&:slogan)
    end


    def self.most_active
        self.all.sort_by {|follower| follower.cults.count}
    end

    def self.top_ten
        activity_array[0]
    end

    def self.create_top_ten_list(unordered_array)
        top_list = activity_array.map.with_index do |follower, index|
            "#{index+1}. #{follower.name} - #{follower.cults.count}"
        end
    top_list[0..9]
    end

    private

    def self.activity_array
        (self.all.sort_by {|follower| follower.cults.count}).reverse
    end
end