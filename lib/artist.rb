class Artist
    attr_accessor :name, :artist

    
    def initialize(name)
        @name = name
        @@all << self
    end
    
    
    @@all = []
    
    def self.all
        @@all
    end
    
    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist
    end
    
    def save
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end
    
    def add_song(song)
        song.artist = self if song.artist == nil
    end

    def genres
        songs.collect {|song| song.genre }.uniq
    end
end