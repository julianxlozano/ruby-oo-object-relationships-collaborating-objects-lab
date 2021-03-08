require 'pry'
class Song
    @@all=[]
    attr_accessor :name, :artist 

    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
       # binding.pry 
        song_title= filename.split(" - ")[1]
        new_instance = Song.new(song_title)
        artistname_from_file= filename.split(" - ")[0]
        if Artist.all.detect{|artist| artist.name == artistname_from_file}
        new_instance.artist = Artist.all.detect{|artist| artist.name == artistname_from_file}
        else 
        new_instance.artist = Artist.new(artistname_from_file)
        end
        new_instance
    end

    def artist_name=(name)
      #  binding.pry
       if Artist.all.detect{|artist| artist.name == name}
       self.artist = Artist.all.detect{|artist| artist.name == name}
    else
      self.artist = Artist.new(name)
        
      end

    end
end