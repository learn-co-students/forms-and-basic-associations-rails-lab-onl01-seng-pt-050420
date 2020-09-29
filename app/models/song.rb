class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist=(name)
    self.artist_id = Artist.find_or_create_by(name: name).id
  end

  def artist_name=(name)
    self.artist_id = Artist.find_or_create_by(name: name).id
  end

  def artist_name
    self.artist.name
  end

  def song_notes=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end
end
