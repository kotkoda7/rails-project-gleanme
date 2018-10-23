# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#roxie = User.create(id: 1, username: "Roxie", password: "abcd")
#eo = User.create(id: 2, username: "Leo", password: "efgh")

#seattle = Location.create(id: 1, user_id: 2, loc_type: "public", lat: 47.6062, lng: -100.3321, address: "Seattle, WA")
#portland = Location.create(id: 2, user_id: 1, loc_type: "private", lat: 45.5122, lng: -122.6587, address: "Portland, WA")

at = Edible.create(id: 1, name: "Apple Tree")
bb = Edible.create(id: 2, name: "Blueberry Bush")

pr = Location.create(loc_type: "Private")
pu = Location.create(loc_type: "Public")


#fruit = Category.create(id: 1, name: "Fresh Fruit")
#veggie = Category.create(id: 2, name: "Fresh Vegetables")
#pre = Category.create(id: 3, name: "Pre-Cooked")
#pack = Category.create(id: 4, name: "Packaged")
#water = Category.create(id: 5, name: "Water")
#meat = Category.create(id: 6, name: "Meat")
#mashroom = Category.create(id: 7, name: "Mashroom")

