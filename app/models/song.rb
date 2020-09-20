class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

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

  def note_content=(content)
    content.each do |c|
      if !c.nil?
        note = Note.new(content: c)
        self.notes << note
      end
    end
  end
end