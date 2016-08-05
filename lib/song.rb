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
    new_instance = self.new
    self.all << new_instance
    new_instance
  end

  def self.new_by_name(song_name)
    new_instance = self.create
    new_instance.name = song_name
    new_instance
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by! do |song_instance|
      song_instance.name
    end
  end

  def self.new_from_filename(filename)
    name_without_mp3 = filename.gsub(".mp3","")
    song_name = name_without_mp3.split(" - ")[1]
    artist_name = name_without_mp3.split(" - ")[0]
    new_instance = self.create
    new_instance.artist_name = artist_name
    new_instance.name = song_name
    new_instance
  end

  def self.create_from_filename(filename)
    name_without_mp3 = filename.gsub(".mp3","")
    song_name = name_without_mp3.split(" - ")[1]
    artist_name = name_without_mp3.split(" - ")[0]
    new_instance = self.create
    new_instance.artist_name = artist_name
    new_instance.name = song_name
    new_instance
  end

  def self.destroy_all
    @@all.clear
  end

end
