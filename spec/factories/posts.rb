FactoryGirl.define do
  factory :post do
    name "MyString"
	content "MyString is a lovely string. It has more than 100 characters which means that it is valid and can be sent through my keyword extractor."
	# keywords ["first word"]
  end

end
