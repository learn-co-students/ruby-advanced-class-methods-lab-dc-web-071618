class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted_song_names = self.sort_all_names

    sorted_song_names.map do |name|
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    filename_data = filename.split(/[-.]/)
    artist_name = filename_data[0].strip
    name = filename_data[1].strip

    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  # Helper Methods
  def self.sort_all_names
    names = self.all.map do |song|
      song.name
    end
    names.sort
  end
end
