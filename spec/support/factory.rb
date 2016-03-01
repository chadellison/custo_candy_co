FactoryGirl.define do
  factory :candy do
    title
    description
    price
    category_id nil
    image "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTW92hfHabHilIW2TYuDC1HX4IN1yvxpmOVNnFIbSgizNg_avs3"
  end

  sequence :title, ["A", "C", "B", "D"].cycle do |n|
    "#{n} Title"
  end

  sequence :description do |n|
    "description #{n}"
  end

  sequence :price do |n|
    n
  end

  factory :category do
    name
  end

  sequence :name, ["A", "C", "B", "D"].cycle do |n|
    "#{n} name"
  end
end
