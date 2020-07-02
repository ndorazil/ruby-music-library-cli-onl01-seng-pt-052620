class Artist
    attr_accessor :name, :artist, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self

        @songs = []
    end

    def save
        @@all << self
    end

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

    def add_song(song)
        Song.all.select {|song| song.artist == self}
    end
end