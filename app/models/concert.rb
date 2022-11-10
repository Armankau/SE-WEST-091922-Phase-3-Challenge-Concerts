class Concert < ActiveRecord::Base
    belongs_to :band
    belongs_to :venue

    def introduction
        "Hello #{self.venue.city}!!!!! We are #{self.band.name} and we're from #{self.band.hometown}"
        #good
    end

    def hometown_show?
        self.band.hometown == self.venue.city
    end
end