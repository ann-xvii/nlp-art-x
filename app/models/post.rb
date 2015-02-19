class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :content, type: String
  field :keywords, type: Array
  field :favorite_collections, type: Object, default: {key: "", value: []}
  
  belongs_to :user
  has_many :galleries

  validates :name, presence: true, length: {minimum: 2}
  validates :content, presence: true, length: {minimum: 100}

  
  # self.information.link_art_title = nil
  # self.information.link_art_medium = nil
  # self.information.link_art_label = nil
  # self.information.link_art_artist = nil
  

  def date_published
      created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end


  # def skyttle_sentiment_analysis
  #   # base_uri = "http://api.skyttle.com/v0.1/"
  #   base_uri = "https://sentinelprojects-skyttle20.p.mashape.com/"
  #   # base_uri = "https://sentinelprojects-skyttle20.p.mashape.com/"
  #   values   = "{\"text\": \"We have visited this restaurant a few times in the past, and the meals have been ok, but this time we were deeply disappointed.\", \"lang\": \"en\", \"keywords\": 1, \"sentiment\": 1, \"annotate\": 1}"
  #   headers  = {"content_type" => "application/json; charset=UTF-8", "X-Mashape-Authorization" => "ENV['MASHAPE_KEY']"}
  #   response = RestClient.post base_uri, values, headers
  #   puts response
  # end

  # extract keywords, sentiment and polarity from post content

  def self.sentiment_analysis(content)
    response = Unirest.post "https://sentinelprojects-skyttle20.p.mashape.com/",
      headers:{
        "X-Mashape-Key" => ENV['MASHAPE_KEY'],
        "Content-Type" => "application/x-www-form-urlencoded",
        "Accept" => "application/json"
      },
      parameters:{
        "annotate" => 0,
        "keywords" => 1,
        "lang" => "en",
        "sentiment" => 0,
        "text" => content
      }
     
      post_words = response.body

      post_words["docs"][0]["terms"]
       # post_words["docs"][0]["terms"][1]["term"]
      word_array = post_words["docs"][0]["terms"]
      extracted_keywords = []

      for i in 0...word_array.length
        extracted_keywords << word_array[i]["term"]
      # initialize container array for keywords
      end
      # # push keywords into extracted keywords array
      # word_array.each do |word|
      #   # extracted_keywords = 1
      #   word.term
      # #      # extracted_keywords.push(word["term"]) 
      # #      # # self.keywords.push(word["term"])
      # #      # logger.debug extracted_keywords
      # #      # binding.pry
      # #      puts word["term"]
      # end

      # # set post.keywords equal to the extracted keywords array, so that keywords are more easily available in view
      # self.keywords = extracted_keywords

      # return extracted_keywords

      # split keyword phrases into individual words
      split_extracted_keywords = []
      extracted_keywords.each do |keyword|
        x = keyword.split(" ")
        x.each do |new_word|
          split_extracted_keywords << new_word
        end
      end

      return split_extracted_keywords
  end


  # select an index between 0 and length of keyword array
  def select_random_index
    keyword_length = self.keywords.length
    art_index = rand(0...keywords.length)
    # # use index to select a search term
    search_term = self.keywords[art_index].downcase
    # search_term
    # return search_term
  end


  def escaped_search_term
    CGI::escape(self.select_random_index)
  end


  def brooklyn_gallery_request
    brooklyn_key = ENV['BROOKLYN_KEY']

    # IF KEYWORD ARRAY LENGTH IS LESS THAN 1, CHOOSE A RANDOM TOPIC
    # if (self.keywords.length < 1)
    #   return cooper_hewitt_random_artwork_generator
    # end

    # format search term for use in building URI
    escaped_search_term = self.escaped_search_term
    # escaped_search_term = CGI::escape(self.select_random_index)
    # escaped_search_term = "rome"
    response = HTTParty.get("http://www.brooklynmuseum.org/opencollection/api/?method=collection.search&version=1&api_key=#{brooklyn_key}&keyword=#{escaped_search_term}&format=json&include_html_style_block=true")
    # binding.pry

    response_json = JSON.parse(response.body)
    #HANDLE CASE OF 0 RESULTS

    # if response resultset is nil, run function again
    # or random video
    # if response_json["resultset"].nil? 
    #   return cooper_hewitt_random_artwork_generator
    # end

    # EXTRACT ARTWORK URI AND PUSH TO CONTAINER ARRAY
    container_of_art = []
    array_of_artwork = response_json["response"]["resultset"]["items"].each do |x|
      container_of_art << x["images"]["0"]["uri"]
    end

    # response_json["response"]["resultset"]["items"][0]["images"]["0"]["uri"]
    
    # link_to_art = response_json["response"]["resultset"]["items"][0]["uri"]
    # self.favorite_collections["link_art_title"] = response_json["response"]["resultset"]["items"][0]["title"]
    # self.link_art_medium = response_json["response"]["resultset"]["uri"][0]["medium"]
    # self.link_art_label = response_json["response"]["resultset"]["uri"][0]["label"]
    # self.link_art_artist = response_json["response"]["resultset"]["uri"][0]["artists"][0]["name"]
    # WHAT DATA DO I WANT?
    # ARTIST
    # NATIONALITY
    # MEDIUM
    # COLLECITIONS
    # MUSEUM
    # CAPTION
    # DESCRIPTION
    # OTHER VIEWS OF IMAGE
    # LINK TO PRINT PURCHASE
    # ACCESSION NUMBER

    # check for artwork array or container array to handle NIL

    # if array_of_artwork.length < 1 || container_of_art.length < 1
    #    # call random video generator
    #    cooper_hewitt_random_artwork_generator
      
    # else
    #   # otherwise return container of art (array)
    #   container_of_art
    # end
    container_of_art


  end

  def brooklyn_art_selector
    brooklyn_key = ENV['BROOKLYN_KEY']
  end


  def cooper_hewitt_random_artwork_generator
    cooperhewitt_key = ENV["API_TOKEN"]
    # response = HTTParty.get("https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getRandom&access_token=#{cooperhewitt_key}&has_image=1")
    response = HTTParty.get("https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.videos.getRandom&access_token=#{cooperhewitt_key}")
    # video_url = response.video.formats.mp4["720"]
    video_url = response["video"]["formats"]["mp4"]["720"]
    return video_url
  end


  # def return_type_check

  # end


  def rijksmuseum_request
    rijksmuseum_key = ENV['RIJKSMUSEUM_KEY']
    escaped_search_term = self.escaped_search_term
    response = HTTParty.get("https://www.rijksmuseum.nl/api/en/collection?key=#{rijksmuseum_key}&format=json&q=#{escaped_search_term}&imgonly=true")

    response_json = JSON.parse(response.body)

    rijksmuseum_array = response_json["artObjects"]

    

    array_of_container_objects = []

    rijksmuseum_array.each do |item|
      container_array = {
      title: "",
      image: "",
      artist: "",
      id: ""
    }

    if item["longTitle"].nil? || item["webImage"].nil? || item["principalOrFirstMaker"].nil?
      # return cooper_hewitt_random_artwork_generator
      container_array[:title] = "Not found"
      container_array[:image] = "Not found"
      container_array[:artist] = "Not found"
      container_array[:id] = "Not found"
      array_of_container_objects.push(container_array)
      return array_of_container_objects
    end
      container_array[:title] = item["longTitle"]
      container_array[:image] = item["webImage"]["url"]
      container_array[:artist] = item["principalOrFirstMaker"]
      container_array[:id] = item["id"]

      array_of_container_objects.push(container_array)
    end

    # container_array
    array_of_container_objects
  end

end
