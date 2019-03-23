class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def photo_path
  #   :path => %Q(:rails_root/public/uploads/:class/:attachment/:id/:style/album_cover.:extension),:url => %Q(/uploads/:class/:attachment/:id/:style/album_cover.:extension),:default_url => %Q(/uploads/:class/:attachment/:style/photo_album_thumb.jpg)
  # end
end
