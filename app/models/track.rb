class Track < ApplicationRecord
  
  validates_presence_of :album_id, :title, :ord, :bonus
  
  belongs_to :album
  has_one :band
  
  
end