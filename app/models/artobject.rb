class Artobject
  include Mongoid::Document

  field :title, type: String
  field :description, type: String
  field :images_array, type: Array
  field :museum_object_id, type: String
  field :medium, type: Array
  field :artist, type: String
  field :nationality, type: String


  embedded_in :gallery
end
