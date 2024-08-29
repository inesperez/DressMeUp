require 'open-uri'
require 'faker'

Garment.destroy_all
User.destroy_all

IMAGES = [
  # tops
  "https://static.zara.net/assets/public/c5ad/e9e3/3b8f4b648c02/9b3e82c05a75/02142153441-e1/02142153441-e1.jpg?ts=1724325334014&w=750",
  "https://static.zara.net/assets/public/28a1/2541/4c384e229a35/56f69a7ff2f7/01131807644-e1/01131807644-e1.jpg?ts=1722936482233&w=396",
  "https://static.zara.net/assets/public/5103/ff5c/e94d4ec89c39/5019cc8038ed/04437230800-e1/04437230800-e1.jpg?ts=1723124994327&w=396",
  "https://static.zara.net/assets/public/4fef/17c4/3f24488ab471/285278f64714/02893104802-e1/02893104802-e1.jpg?ts=1722871726632&w=396",
  "https://static.zara.net/assets/public/21b6/a1c2/5ff045f994a6/494eb4f51db7/02142115806-e1/02142115806-e1.jpg?ts=1723453415392&w=396",
  "https://static.zara.net/assets/public/e651/83a9/85c94204b75a/dc4c5596c146/05536113620-e1/05536113620-e1.jpg?ts=1720004227302&w=396",
  "https://static.zara.net/assets/public/b45f/bd0f/33e54c1d82f7/4eac485d4ce5/08417800621-e1/08417800621-e1.jpg?ts=1723650458872&w=396",
  "https://static.zara.net/assets/public/81c5/8e3a/f3e143749223/57a4b125f060/02893104300-e1/02893104300-e1.jpg?ts=1722871396195&w=396",
  "https://static.zara.net/assets/public/218a/8206/096d4e6d88fc/096497dbb495/02893104400-e1/02893104400-e1.jpg?ts=1722871387524&w=396",
  "https://static.zara.net/assets/public/dd6f/1e3e/c5014b27b697/3f89d9ddd3ae/02142112600-e1/02142112600-e1.jpg?ts=1723644496360&w=396",
  # bottoms
  "https://static.zara.net/assets/public/73b3/a947/09a449feb515/4cbaa69f6ad9/08417801712-e1/08417801712-e1.jpg?ts=1723650452774&w=750",
  "https://static.zara.net/assets/public/2d38/8003/934c4d7e8cb9/a411e2c1ad8c/01889159427-e1/01889159427-e1.jpg?ts=1723651182038&w=396",
  "https://static.zara.net/assets/public/fcb4/2c17/ed3540fa8ea7/462f31c9da30/08944336611-e1/08944336611-e1.jpg?ts=1723805674849&w=396",
  "https://static.zara.net/assets/public/7f47/c252/abcc491ca1bb/cb1cfd8277fa/09929224800-e1/09929224800-e1.jpg?ts=1723020791628&w=396",
  "https://static.zara.net/assets/public/ccae/d934/f767462cb900/7a3d38a22bc1/02157232632-015-a1/02157232632-015-a1.jpg?ts=1720801468574&w=750",
  "https://static.zara.net/assets/public/5885/f99e/6d094c1e8385/ddc723e808c1/02142134681-e1/02142134681-e1.jpg?ts=1724315557111&w=750"
]

ines = User.create!(
  email: "ines@ines.com",
  password: "123456"
)

10.times do
  image = URI.open(IMAGES.sample)
  garment = Garment.new(
    ai_description: Faker::Marketing.buzzwords,
    user: ines
  )
  garment.photo.attach(io: image, filename: "image.png", content_type: "image/png")
  garment.save
end
