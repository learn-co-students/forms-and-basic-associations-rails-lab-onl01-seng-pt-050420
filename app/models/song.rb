class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def genre=(id)
    self.genre_id = id.to_i
  end

  def note_contents
    self.notes.collect(&:content)
  end

  def note_contents=(note_contents)
    note_contents.each do |content|
      unless content.empty?
        self.notes << Note.create(content: content)
        self.save
      end
    end
  end
end
