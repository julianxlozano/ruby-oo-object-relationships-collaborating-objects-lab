require 'pry'

class Artist
    @@all=[]
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self 
    end

    def songs
        Song.all.select{|song|song.artist == self}
    end

    def self.find_or_create_by_name(name)
       # binding.pry 
        if self.all.detect{|song| song.name == name } 
            self.all.detect{|song| song.name == name }
        else
        artist = Artist.new(name)
        end 
    end

    def print_songs
        Song.all.select do |song|
           if song.artist == self
            puts song.name 
           end 
        end
    end


end