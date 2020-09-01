class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if !self.artist.nil? 
      self.artist.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if !self.genre.nil?
      self.genre
    end
  end

  def notes=(notes)
    self.notes = Notes.find_or_create_by(content: notes)
  end
end
