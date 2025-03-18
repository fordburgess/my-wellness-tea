User.delete_all

puts "Creating Users"
User.create(email: "fordburgess1@gmail.com", password: 'password123', admin: true);

User.create(email: "deantresadern@gmail.com", password: 'password123', admin: true);

puts "Finished Seeding"
