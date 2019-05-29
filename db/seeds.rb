
Poet.destroy_all
Poem.destroy_all
User.destroy_all
Favorite.destroy_all



poet1 = Poet.create(name: "Edgar Allen Poe", birthdate: "1/19/1809", nationality: "American" )
poet2 = Poet.create(name: "Robert Frost", birthdate: "03/26/1874", nationality: "American")
poet3 = Poet.create(name: "Rumi", birthdate: "09/30/1207", nationality: "Persian")
poet4 = Poet.create(name: "Nayyirah Waheed", birthdate: "30", nationality: "Egyptian")
poet5 = Poet.create(name:"Laden Osman", birthdate:"19", nationality:"Somali")
poet6 = Poet.create(name:"Khalil Gilbran", birthdate:"53", nationality:"American")

poem1 = Poem.create(poet_id: poet1.id, title: "The Raven", genre:"dark", content:"blah" )
poem2 = Poem.create(poet_id: poet2.id, title:"The Road not taken", genre: "nature", content: "blahblah")
poem3 = Poem.create(poet_id: poet3.id, title:"Sufi", genre:"mysticisim", content: "blahblahblah")
poem4 = Poem.create(poet_id: poet4.id, title: "Nature", genre: "things", content: "safegh")
poem5 = Poem.create(poet_id: poet5.id, title:"Things", genre: "reason", content: "asfgeeg") 


user1 = User.create(name:"S", email: "gsffad", password: "sassf")
user2 = User.create(name:"M", email: "ssgs", password:"sdasf")
user3 = User.create(name:"B", email:"sfasf", password:"sdaf")
user4 = User.create(name:"G", email: "swreg", password:"sfaffe")
user5 = User.create(name:"L", email: "eggs", password:"sfeeff")
user6 = User.create(name:"Q", email: "wfsaa", password: "wgdd")



favorite1 = Favorite.create(user_id: user1.id, poem_id: poem1.id)
favorite2 = Favorite.create(user_id: user2.id, poem_id: poem2.id)
favorite3 = Favorite.create(user_id: user3.id, poem_id: poem3.id)
favorite4 = Favorite.create(user_id: user4.id, poem_id: poem4.id)
favorite5 = Favorite.create(user_id: user5.id, poem_id: poem5.id)
favorite6 = Favorite.create(user_id: user6.id, poem_id: poem5.id)





# binding.pry
# puts 'hi'
