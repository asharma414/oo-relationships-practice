class Listing

    attr_reader :name, :city
    attr_accessor :trip_count
    @@all = []
    @@most_popular = {:listing => 0}

    def initialize(name, city)
        @name = name
        @city = city
        @trip_count = 0
        @@all << self
    end

    def self.most_popular
        @@top_listing
    end

    def self.most_popular=(listing)
        @@most_popular = listing
    end

    def self.all
        @@all
    end

    def self.find_all_by_city(city)
        self.all.select {|listing| listing.city == city}
    end

    def new_trip(guest)
        Trip.new(guest, self)
    end

    def trips
        Trip.all.select {|trip| trip.listing == self}
    end

    def guests
        self.trips.map {|trip| trip.guest}
    end

    def self.most_popular
        @@most_popular
    end

end