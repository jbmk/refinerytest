class Fieldtrip < ActiveRecord::Base

  acts_as_indexed :fields => [:Name, :Description]

  validates :Name, :presence => true, :uniqueness => true
  
  belongs_to :Photo, :class_name => 'Image'
end
