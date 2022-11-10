class Concert < ActiveRecord::Base
    belongs_to :band
    belongs_to :venue

    def introduction
        "Hello #{self.venue.city}!!!!! We are #{self.band.name} and we're from #{self.band.hometown}"
    end

    def hometown_show?
        self.bands.hometown == self.venues.city
    end
end