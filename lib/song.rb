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
  song = self.new
  song.save
  song
end

def self.new_by_name(string)
  song = self.new
  song.name = string
  song
end

def self.create_by_name(string)
  song = self.new  
  song.name = string
  song.save
  song
end

def self.find_by_name(string)
  @@all.find do |song|
    string == song.name
  end
end

def self.find_or_create_by_name(string)
  self.find_by_name(string) || self.create_by_name(string)
end

def self.alphabetical
  self.all.sort_by { |s| s.name}
end

 def self.new_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end

def self.destroy_all
  @@all = []
end
end
