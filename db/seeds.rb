# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category1 = Category.create(name: "Chocolates")
category2 = Category.create(name: "Gummies")
category3 = Category.create(name: "Hard Candies")

category1.candies.create(title: "Dark Chocolate", description: "70 percent sweet Belgium Chocolate", price: 2800, image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTOhnzDxvn5o4SFkJ03qV0sqvhTufKvzlQfRxQpqonaHas6XKol5w")
category1.candies.create(title: "Milk Chocolate", description: "Organic whole milk with rich and smooth Belgium Chocolate", price: 3000, image: "http://www.stuffedchocolate.com/Bark_milk.jpg")
category2.candies.create(title: "Gummie Bears", description: "Real fruit flavors including apple, blueberry, cherry, strawberry", price: 1500, image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRNb2qgBu1Uyph0YNlTemLqCjd4uA_r4bNQ_fv0K9hqNk2YwdfE")
category2.candies.create(title: "Sour Gummie straws", description: "Real fruit flavors with a zing", price: 2000, image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRLdyX1tdEbJWbnp9WjQ_cC2Ukfm3JG1l4xyxjyr3ubUm7XY2isKA")
category3.candies.create(title: "Butter mint", description: "Smooth and sweet butter milk cream with organic mint", price: 2400, image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRXuLuF5TXQeRRPuPsxNZFVXyvJ-bxJj-tnoO0LMWnS5bXE30G-Aw")
category3.candies.create(title: "Tropical Fruit Hard Candies", description: "Real fruit juice", price: 1800, image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQABRxbGN2NqEaKvupHVznDBzbM2fQaSl7qsqIUBMUjm_1VCwsD")
