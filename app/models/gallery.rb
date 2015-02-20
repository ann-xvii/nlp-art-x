class Gallery
  include Mongoid::Document
  include Mongoid::Timestamps

  # before_save :perform_gallery_search

  
  field :keyword_search_term, type: String
  
  field :gallery_array, type: Array
  

  
  belongs_to :post
  # embeds_many :artobjects
  # accepts_nested_attributes_for :artobject



  def perform_gallery_search



  	rijksmuseum_key = ENV['RIJKSMUSEUM_KEY']
    escaped_search_term = self.escaped_search_term
    response = HTTParty.get("https://www.rijksmuseum.nl/api/en/collection?key=#{rijksmuseum_key}&format=json&q=#{escaped_search_term}&imgonly=true")
    response_json = JSON.parse(response.body)
    rijksmuseum_response_count = response_json["count"]
    rijksmuseum_array = response_json["artObjects"]

    array_of_container_objects = []

    # rijksmuseum_array.each do |item|
    #   container_array = {
    #   title: "",
    #   image: "",
    #   artist: "",
    #   id: ""
    # }

    # if item["longTitle"].nil? || item["webImage"].nil? || item["principalOrFirstMaker"].nil?
    #   # return cooper_hewitt_random_artwork_generator
    #   container_array[:title] = "Not found"
    #   container_array[:image] = "Not found"
    #   container_array[:artist] = "Not found"
    #   container_array[:id] = "Not found"
    #   array_of_container_objects.push(container_array)
    #   return array_of_container_objects
    # end
    #   container_array[:title] = item["longTitle"]
    #   container_array[:image] = item["webImage"]["url"]
    #   container_array[:artist] = item["principalOrFirstMaker"]
    #   container_array[:id] = item["id"]

    #   array_of_container_objects.push(container_array)
    # end

    # container_array
    array_of_container_objects
  end

  end




# When you view a post, there is an associated search_term which has

def like_gallery
	# grab gallery object

	# if current user id is not gallery id 
	# then diff function


	# block user from liking own gallery

	# if current_user then
	Gallery.new(keyword_search: thespecificpost.title)

	thespecificpost.rijksmuseum_request.each do |newart|
		artobject = ArtObject.new
		artobject.title = newart.title
		artobject.image = newart.image
		artobject.artist = newart.artist
		artobject.id = newart.id
		artobject.save!
	end

	# else redirect_to signup_path
	# flash[:notice] = "You must be signed in to do that! Why don't you create an account?"
end