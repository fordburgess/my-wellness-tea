puts "Deleting Users"
User.delete_all

puts "Deleting Products"
Product.all.each do |product|
  product.plants.delete_all
end
Product.delete_all
Tea.delete_all

puts "Deleting Plants"
Plant.delete_all

puts "Creating Users"
User.create(email: "fburg6824@gmail.com", password: 'password123', admin: true);
User.create(email: "fordburgess1@gmail.com", password: 'password123', admin: false);

puts "Creating Teas"
douce_nuit = Tea.create(
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

jolie_gambettes = Tea.create(
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

allaitement = Tea.create(
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

coup_de_froid = Tea.create(
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

apres_repas = Tea.create(
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

d_tox = Tea.create(
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

stress_digestif = Tea.create(
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

peau_dorange = Tea.create(
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

future_maman = Tea.create(
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

parratoux = Tea.create(
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

# puts "Creating Plants"
# melisse = Plant.create(
#   name: "Mélisse",
#   latin_name: "Melissa officinalis",
#   traditional_qualities: "Les feuilles de la mélisse ont des effets tranquillisants (apaisants) et relaxants.",
#   description: "La mélisse est une plante herbacée vivace originaire de l’Est de la Méditerranée. Elle peut atteindre jusqu’à 80 cm et dégage une odeur citronnée surtout lorsque l’on gratte ses feuilles. L’usage de la mélisse est fréquent dans les préparations en infusions. La plante a en effet des vertus tranquillisantes (apaisantes) et relaxantes.",
#   part_used: "Feuilles"
# )
#
# hibiscus = Plant.create(
#   name: "Hibiscus",
#   latin_name: "Hibiscus fragilis",
#   traditional_qualities: "En infusion les fleurs de l’hibiscus sont réputées pour leurs vertus antiseptiques urinaires et diurétiques. Elles apaisent des douleurs menstruelles et préparent à l’accouchement car elles ont un effet relaxant pour les muscles utérins. De plus elles aident à lutter contre l’hypertension.",
#   description: "L’hibiscus est une plante très prisée aussi bien pour l’aspect ornemental que pour celui de ses vertus thérapeutiques. Il s’agit d’arbustes pouvant atteindre 6 mètres de haut. Ses feuilles sont alternes ovales ou lancéolées et elles ont le bord ondulé. Les fleurs sont d’une taille moyenne à grandes pouvant atteindre 7 cm de diamètres. Elles sont isolées ou groupées en inflorescences.",
#   part_used: "Fleurs"
# )
#
# douce_nuit.plants << melisse
# future_maman.plants << hibiscus

puts "Finished Seeding"
