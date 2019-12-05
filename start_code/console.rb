require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

require('pry')

Casting.delete_all()
Star.delete_all()
Movie.delete_all()


movie1 = Movie.new({ 'title' => 'Superman', 'genre' => 'action'} )
movie1.save()
movie2 = Movie.new({ 'title' => 'Batman', 'genre' => 'action'} )
movie2.save()
movie3 = Movie.new({ 'title' => 'Joker', 'genre' => 'thriller'} )
movie3.save()

star1 = Star.new({ 'first_name' => 'Christopher', 'last_name' => 'Reeve'} )
star1.save()
star2 = Star.new({ 'first_name' => 'Christian', 'last_name' => 'Bale'} )
star2.save()
star3 = Star.new({ 'first_name' => 'Joaquin', 'last_name' => 'Pheonix'} )
star3.save()

casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 200 })
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => 300 })
casting2.save()
casting3 = Casting.new({ 'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => 400 })
casting3.save()




binding.pry
nil
