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

category1.candies.create(title: "Dark Chocolate", description: "70 percent sweet Belgium Chocolate", price: 2800)
category1.candies.create(title: "Milk Chocolate", description: "Organic whole milk with rich and smooth Belgium Chocolate", price: 3000)
category2.candies.create(title: "Gummie Bears", description: "Real fruit flavors including apple, blueberry, cherry, strawberry", price: 1500)
category2.candies.create(title: "Sour Gummie straws", description: "Real fruit flavors with a zing", price: 2000)
category3.candies.create(title: "Butter Peppermint", description: "Smooth and sweet butter milk cream with organic peppermint", price: 2400)
category3.candies.create(title: "Tropical Fruit Hard Candies", description: "Real fruit juice", price: 1800)
