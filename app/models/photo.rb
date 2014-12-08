require 'carrierwave/orm/activerecord'
require_relative '../uploaders/image_uploader'

class Photo < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :album
  mount_uploader :imagefile, ImageUploader
end
