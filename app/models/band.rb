class Band < ActiveRecord::Base
    has_many :concerts
    has_many :venues, through: :concerts

    def play_in_the_venue(venue, date)
        self.create(date: date, venue: venue)
        # #good
        # Band.create(date: date, venue: venue, concert: self)
    end

    def all_introduction
        self.map {|band| band.introduction}
    end

    def self.most_performances
        self.joins(:concerts).group(:band_id).order("COUNT(concerts.id) DESC").limit(1)
        # Band.joins(:concerts).group(:band_id).order("COUNT(concerts.id) DESC").limit(1)
        #good
    end
end
