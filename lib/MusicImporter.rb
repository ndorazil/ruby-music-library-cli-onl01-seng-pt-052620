class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.children("#{path}")
    end

    def import
        files.each do |file|
            Song.new
        end
    end
end