# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Medicine.destroy_all

Medicine.create name: "Paracetamol", iupac: "N-(4-hydroxyphenyl)ethanamide", molar_mass: 151.163, uses:"Fever, Pain", image: "/assets/panadol.png"
Medicine.create name: "Salbutamol", iupac: "(RS)-4-[2-(tert-Butylamino)-1-hydroxyethyl]-2-(hydroxymethyl)phenol", molar_mass: 239.311, uses: "Bronchospasm", image: "/assets/ventolin.jpeg"
Medicine.create name: "Codeine", iupac: "(5α,6α)-7,8-didehydro-4,5-epoxy-3-methoxy-17-methylmorphinan-6-ol", molar_mass: 299.364, uses:"Fever, Pain", image: "/assets/codral.png"
Medicine.create name: "Ibuprofen", iupac: "(RS)-2-(4-(2-Methylpropyl)phenyl)propanoic acid", molar_mass: 206.29, uses:"Fever, Pain", image: "/assets/nurofen.jpeg"
