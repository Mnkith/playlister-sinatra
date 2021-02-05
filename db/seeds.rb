# Add seed data here. Seed your database with `rake db:seed`

g1 = Genre.create(name: 'g1')
g2 = Genre.create(name: 'g2')
g3 = Genre.create(name: 'g3')
a1 = Artist.create name: 'a1'
Artist.create name: 'a2'
Artist.create name: 'a3'
s1 = Song.create name: 's1'
# s1.artist = a1
s1.genres << g1 << g2 << g3

a1.songs << s1

a1.save

