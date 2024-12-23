puts "Deleting Users"
User.delete_all

puts "Deleting Products"
Product.delete_all

puts "Creating Users"
User.create(email: "fburg6824@gmail.com", password: 'password123', admin: true)

puts "Creating Products"
Tea.create(title: "Douce Nuit", price: 14.90, stock: true, type: "Tea")

puts "Finished Seeding"
