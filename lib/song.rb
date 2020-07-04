class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        @artist = artist
        @genre = genre
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
        song = Song.new(name)
        song.save
        song
    end

    def self.find_by_name(name)
        Song.all.find do |song|
            song.name == name
        end
    end

    def self.find_or_create_by_name(name)
        if Song.find_by_name(name) == nil 
            Song.create(name)
        else
            Song.find_by_name(name)
        end
    end
end