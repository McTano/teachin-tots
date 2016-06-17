class Concept < ActiveRecord::Base

  validates_presence_of :word, :image

end