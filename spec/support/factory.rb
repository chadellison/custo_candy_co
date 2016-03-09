FactoryGirl.define do
  factory :candy do
    title
    description
    price 10
    status
    category_id 1
    image "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSHDOSNxmatCFt8kQLujghKqW3dlmgvBhMrqBd747RP95UQTuDzRF7838s"
  end

  sequence :title, ["A", "C", "B", "D"].cycle do |n|
    "#{n} Title"
  end

  sequence :description do |n|
    "description #{n}"
  end

  sequence :status do
    "In Stock"
  end

  factory :category do
    name
  end

  sequence :name, ["A", "C", "B", "D"].cycle do |n|
    "#{n} name"
  end
end
