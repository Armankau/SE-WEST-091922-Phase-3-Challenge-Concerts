class Venue < ActiveRecord::Base
    has_many :concerts
    has_many :bands, through: :concerts

    def concert_on(date)
       self.concerts.where(date: date).first 
    end

    def most_frequent_band
        self.bands.joins(:concerts).group(:band_id).order("COUNT(concerts.id) DESC").limit(1)
    end
end