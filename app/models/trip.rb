class Trip

    attr_reader :guest, :listing
    @@all = []

    def initialize(guest, listing)
        @guest, @listing = guest, listing
        guest.trip_count += 1
        listing.trip_count += 1
        if listing.trip_count >= Listing.most_popular.values[0]
            Listing.most_popular = {listing => listing.trip_count}
        end
        @@all << self
    end

    def self.all
        @@all
    end

end
