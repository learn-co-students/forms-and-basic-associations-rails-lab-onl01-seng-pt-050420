class Song < ActiveRecord::Base
  # add associations here
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

  def note_content=(note_content)
      note_content.each do |n|
        if !n.nil?
          note = Note.new(content: n)
          self.notes << note
        end
      end
  end
end
