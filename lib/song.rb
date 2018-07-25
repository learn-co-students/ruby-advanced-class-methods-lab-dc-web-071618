require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    @@all[-1]
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    found = []
    @@all.map do |x|
      if x.name == name
        found << x
      end
    end
    found[0]
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|one_song| one_song.name.split("")[0]}
  end

  def self.new_from_filename(file_name)
    song = Song.new
    song.artist_name = file_name.split(" - ")[0]
    song.name = file_name.split(" - ")[1].chomp('.mp3')
    song
  end

  def self.create_from_filename(file_name)
      song = Song.new
      song.artist_name = file_name.split(" - ")[0]
      song.name = file_name.split(" - ")[1].chomp('.mp3')
      @@all << song
      song
  end

  def self.destroy_all
    @@all = []
  end
end
