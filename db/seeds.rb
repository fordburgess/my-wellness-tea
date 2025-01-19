puts "Deleting Users"
User.delete_all

puts "Deleting Products"
Product.delete_all
Tea.delete_all

puts "Creating Users"
User.create(email: "fburg6824@gmail.com", password: 'password123', admin: true);
User.create(email: "fordburgess1@gmail.com", password: 'password123', admin: false);

puts "Creating Products"
Tea.create(
  title: "Douce Nuit",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Bien-être",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "Jolie Gambettes",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Bien-être chez la femme",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "Allaitement",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Bien-être chez la femme",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "Coup-de-froid",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Hiver",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "Après Repas",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Bien-être digestif",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "D-Tox",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Bien-être digestif",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "Stress Digestif",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Bien-être digestif",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "Peau d'Orange",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Bien-être chez la femme",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "Future Maman",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Bien-être chez la femme",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

Tea.create(
  title: "Parratoux",
  price: 14.90,
  stock: true,
  tea_detail_attributes: {
    category: "Hiver",
    infusion_time: 8,
    infusion_temperature: 95,
    dosage: 30,
    time_of_day: "Day Or Night"
  }
);

puts "Finished Seeding"
