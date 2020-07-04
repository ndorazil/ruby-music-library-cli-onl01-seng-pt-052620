require "spec_helper"
describe "Associations — Song and Artist:" do
  let(:song) { Song.create("In the Aeroplane Over the Sea") }
  let(:artist) { Artist.new("Neutral Milk Hotel") }
  context "Artist" do
    describe "#songs" do
      it "returns the artist's 'songs' collection (artist has many songs)" do
        expect(artist.songs).to eq([])
        song.instance_variable_set(:@artist, artist)
        expect(artist.songs).to include(song)
      end
    end
  end
  context "Song" do
    describe "#initialize" do
      it "can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property (song belongs to artist)" do
        song_with_artist = Song.new("Two-Headed Boy", artist)
        expect(song_with_artist.instance_variable_defined?(:@artist)).to be(true)
        expect(song_with_artist.instance_variable_get(:@artist)).to be(artist)
      end
    end
    describe "#artist" do
      it "returns the artist of the song (song belongs to artist)" do
        song.instance_variable_set(:@artist, artist)
        expect(song.artist).to be(artist)
      end
    end
    describe "#artist=" do
      it "assigns an artist to the song (song belongs to artist)" do
        song.artist = artist
        assigned_artist = song.instance_variable_get(:@artist)
        expect(assigned_artist).to be(artist)
      end
    end
  end
  context "Artist" do
    describe "#add_song" do
      it "assigns the current artist to the song's 'artist' property (song belongs to artist)" do
        artist.add_song(song)
        expect(song.artist).to be(artist)
      end
      it "does not assign the artist if the song already has an artist" do
        song.instance_variable_set(:@artist, artist)
        expect(song).to_not receive(:artist=)
        artist.add_song(song)
      end
      it "adds the song to the current artist's 'songs' collection" do
        artist.add_song(song)
        expect(artist.songs).to include(song)
      end
      it "does not add the song to the current artist's collection of songs if it already exists therein" do
        2.times { artist.add_song(song) }
        expect(artist.songs).to include(song)
        expect(artist.songs.size).to be(1)
      end
    end
  end
end