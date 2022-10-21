class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        actors_arr = []
        self.auditions.each do |audition|
            actors_arr << audition.actor
        end
        actors_arr
    end

    def locations
        location_arr = []
        self.auditions.each do |audition|
            location_arr << audition.location
        end
        location_arr
    end

    def lead
        if self.auditions.where(hired: true).first == nil
            "no actor has been hired for this role"
        else
            self.auditions.where(hired: true).first
        end
    end

    def understudy
        if self.auditions.where(hired: true).second == nil
            "no actor has been hired for understudy for this role"
        else
            self.auditions.where(hired: true).second
        end
    end
end