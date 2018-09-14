class Album < ApplicationRecord
  
  validates_presence_of :band_id, :title, :year, :studio
  
  belongs_to :band
  has_many :tracks, dependent: :destroy

    
  
end 