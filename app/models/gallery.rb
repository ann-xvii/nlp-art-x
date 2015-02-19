class Gallery
  include Mongoid::Document
  include Mongoid::Timestamps


  field :title, type: String
  field :keyword_search, type: String
  field :museum, type: String
  field :given_name, type: String
  

  
  belongs_to :post
  embeds_many :artobjects
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