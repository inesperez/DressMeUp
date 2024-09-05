require 'open-uri'
require 'faker'
require 'mini_magick'

Garment.destroy_all
Question.destroy_all
User.destroy_all



ines = User.create!(
  email: "ines@ines.com",
  password: "123456",
  location: "London, UK"
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/c5ad/e9e3/3b8f4b648c02/9b3e82c05a75/02142153441-e1/02142153441-e1.jpg?ts=1724325334014&w=750",
  ai_description: "garment_type: top, garment_description: Light blue, long-sleeved top with a draped, cowl neckline. Made from a soft, likely stretchable fabric, the top has a smooth, slightly shiny texture. The design is stylish and sophisticated, suitable for both casual and semi-formal occasions. Ideal for cooler weather due to its long sleeves and layered front, this top can be paired well with skirts or trousers."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/28a1/2541/4c384e229a35/56f69a7ff2f7/01131807644-e1/01131807644-e1.jpg?ts=1722936482233&w=396",
  ai_description: "garment_type: top, garment_description: Soft pink, sleeveless top featuring a draped cowl neckline. The fabric appears smooth and lightweight, likely a silky or satin material, giving it a luxurious and elegant feel. This top is suitable for warmer weather and ideal for both casual and semi-formal occasions, especially when paired with skirts or tailored trousers. Its design and color make it a versatile piece that can be dressed up or down depending on the occasion."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/5103/ff5c/e94d4ec89c39/5019cc8038ed/04437230800-e1/04437230800-e1.jpg?ts=1723124994327&w=396",
  ai_description: "garment_type: top, garment_description: Black, sleeveless top with a tailored, structured design. The fabric appears to be a smooth, possibly woven material, with a slightly stiff texture that helps maintain the garment's shape. It features a minimalist style with clean lines, making it suitable for formal or professional settings. The top is versatile and can be worn in various weather conditions, though it is ideal for warmer weather. The solid black color adds to its classic and sophisticated appeal."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/4fef/17c4/3f24488ab471/285278f64714/02893104802-e1/02893104802-e1.jpg?ts=1722871726632&w=396",
  ai_description: "garment_type: top, garment_description: Gray, short-sleeved knit top. The fabric appears to be a soft, medium-weight knit, likely made from wool or a wool blend, providing warmth while maintaining breathability. The design is simple and classic, with a crew neckline and a slightly relaxed fit. This top is versatile and suitable for casual or semi-casual occasions, particularly in cooler weather or during transitional seasons like spring or fall. The solid gray color adds to its versatility, allowing it to be paired easily with various bottoms."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/21b6/a1c2/5ff045f994a6/494eb4f51db7/02142115806-e1/02142115806-e1.jpg?ts=1723453415392&w=396",
  ai_description: "garment_type: top, garment_description: Beige, sleeveless tank top. The fabric appears to be lightweight, likely made from a cotton or cotton-blend material, providing a soft and comfortable feel. The design is minimalistic, featuring a scoop neckline and a fitted silhouette. This top is ideal for warm weather and casual occasions, offering a basic but versatile piece that can be layered under other garments or worn on its own. The neutral beige color enhances its versatility, making it easy to pair with a variety of other clothing items."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/b45f/bd0f/33e54c1d82f7/4eac485d4ce5/08417800621-e1/08417800621-e1.jpg?ts=1723650458872&w=396",
  ai_description: "garment_type: top, garment_description: Light pink, long-sleeved sweatshirt. The fabric appears to be soft and cozy, likely made from a cotton or cotton-blend material with a fleece lining. The design features a crew neckline and slightly oversized sleeves with ribbed cuffs and hem, giving it a relaxed and casual look. This sweatshirt is ideal for cooler weather, making it perfect for casual outings or lounging at home. The pastel pink color adds a soft, feminine touch, making it both comfortable and stylish for everyday wear."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/81c5/8e3a/f3e143749223/57a4b125f060/02893104300-e1/02893104300-e1.jpg?ts=1722871396195&w=396",
  ai_description: "garment_type: top, garment_description: Bright yellow, short-sleeved knit top. The fabric appears to be a textured knit, likely made from a cotton or cotton-blend material, offering both comfort and breathability. The design is simple with a crew neckline and ribbed details at the collar, cuffs, and hem. This top is vibrant and cheerful, making it suitable for casual occasions, especially in warmer weather or during the spring and summer seasons. The solid yellow color adds a bold, eye-catching element, making it a standout piece in any wardrobe."
)

Garment.create!(
  user: ines,
  image_url: "https://lp.stories.com/app005prod?set=key[resolve.pixelRatio],value[1]&set=key[resolve.width],value[1500]&set=key[resolve.height],value[10000]&set=key[resolve.imageFit],value[containerwidth]&set=key[resolve.allowImageUpscaling],value[0]&set=key[resolve.format],value[jpeg]&set=key[resolve.quality],value[80]&set=source[/c3/74/c37474687d84cf87dcc7d4d8b45f3cfc90647501.jpg],origin[dam],type[DESCRIPTIVESTILLLIFE],ImageVersion[2]&call=url[file:/product/dynamic.chain]",
  ai_description: "garment_type: top, garment_description: Beige, cropped trench coat. The fabric appears to be a durable, mid-weight cotton or cotton-blend material, typical of trench coats, offering both wind resistance and a structured silhouette. The design features a wide collar, double-breasted button closure, and oversized cuffs with strap detailing. The coat also has a storm flap at the front, adding to its classic trench coat aesthetic. This garment is suitable for cooler weather, making it ideal for transitional seasons like spring and fall. The neutral beige color enhances its versatility, making it easy to pair with various outfits for both casual and semi-formal occasions."
)

Garment.create!(
  user: ines,
  image_url: "https://lp.stories.com/app005prod?set=key[resolve.pixelRatio],value[1]&set=key[resolve.width],value[1500]&set=key[resolve.height],value[10000]&set=key[resolve.imageFit],value[containerwidth]&set=key[resolve.allowImageUpscaling],value[0]&set=key[resolve.format],value[jpeg]&set=key[resolve.quality],value[80]&set=source[/b4/1d/b41d1f10afa36520b04e92d1affeb631365b55c5.jpg],origin[dam],type[DESCRIPTIVESTILLLIFE],ImageVersion[1]&call=url[file:/product/dynamic.chain]",
  ai_description: "garment_type: top, garment_description: Dark green, long-sleeved knit sweater. The fabric appears to be a soft, thick knit, likely made from wool or a wool blend, providing warmth and comfort. The design features a crew neckline with ribbed detailing at the collar, cuffs, and hem, giving it a classic and cozy look. The relaxed fit and solid color make this sweater versatile for casual wear, especially in colder weather. The rich green color adds a touch of elegance, making it suitable for both casual and slightly more dressed-up occasions during the fall and winter seasons."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/73b3/a947/09a449feb515/4cbaa69f6ad9/08417801712-e1/08417801712-e1.jpg?ts=1723650452774&w=750",
  ai_description: "garment_type: bottom, garment_description: Cream-colored, relaxed-fit trousers. The fabric appears to be soft and comfortable, likely made from a blend of cotton or a similar material, providing a smooth and slightly textured feel. The design features an elastic waistband for ease and comfort, with a simple, minimalist style that lacks any visible embellishments or pockets. These trousers are suitable for casual wear and are ideal for lounging or low-key outings. The light color and loose fit make them perfect for warm weather, offering a breezy and comfortable option for everyday wear."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/73b3/a947/09a449feb515/4cbaa69f6ad9/08417801712-e1/08417801712-e1.jpg?ts=1723650452774&w=750",
  ai_description: "garment_type: bottom, garment_description: Cream-colored, relaxed-fit trousers. The fabric appears to be soft and comfortable, likely made from a blend of cotton or a similar material, providing a smooth and slightly textured feel. The design features an elastic waistband for ease and comfort, with a simple, minimalist style that lacks any visible embellishments or pockets. These trousers are suitable for casual wear and are ideal for lounging or low-key outings. The light color and loose fit make them perfect for warm weather, offering a breezy and comfortable option for everyday wear."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/2d38/8003/934c4d7e8cb9/a411e2c1ad8c/01889159427-e1/01889159427-e1.jpg?ts=1723651182038&w=396",
  ai_description: "garment_type: bottom, garment_description: Blue, wide-leg denim trousers. The fabric is classic denim, offering a durable and slightly structured feel, typical of cotton denim material. The design features an elastic waistband with a drawstring for adjustable comfort, along with side pockets for practicality. The wide-leg silhouette gives these trousers a relaxed, casual vibe, making them suitable for everyday wear. The medium blue wash adds versatility, allowing them to be easily paired with various tops. These trousers are ideal for casual occasions and can be worn in mild to warm weather, providing both style and comfort."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/fcb4/2c17/ed3540fa8ea7/462f31c9da30/08944336611-e1/08944336611-e1.jpg?ts=1723805674849&w=396",
  ai_description: "garment_type: bottom, garment_description: Bright magenta, tailored trousers. The fabric appears to be a structured, medium-weight material, likely a blend of polyester, viscose, and elastane, providing a smooth and slightly stretchy feel. The design features a classic tailored fit with a high waist, belt loops, and a concealed front closure for a clean finish. The trousers have front pleats and tapered legs, offering a polished and professional look. The bold magenta color adds a vibrant and modern twist, making these trousers suitable for formal or semi-formal occasions, as well as for making a statement in professional settings. Ideal for year-round wear, depending on how they are styled."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/7f47/c252/abcc491ca1bb/cb1cfd8277fa/09929224800-e1/09929224800-e1.jpg?ts=1723020791628&w=396",
  ai_description: "garment_type: bottom, garment_description: Black, wide-leg tailored trousers. The fabric appears to be a smooth, medium-weight material, likely a blend of polyester, wool, or similar fibers, providing a refined and structured feel. The design features a high waist with belt loops, a concealed front closure, and front pleats that enhance the wide-leg silhouette. These trousers have a sophisticated, flowing look that is both elegant and versatile, making them suitable for formal occasions or professional settings. The classic black color adds to their versatility, allowing them to be easily paired with various tops. Ideal for year-round wear, especially in professional or dressy environments."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/d41f/786e/27414a0ea4e3/170babc9a3cc/05520221443-e1/05520221443-e1.jpg?ts=1720771680404&w=824",
  ai_description: "garment_type: bottom, garment_description: Dark indigo, wide-leg denim trousers. The fabric is traditional denim, offering durability and a slightly structured feel, typical of cotton denim material. Very comfy. The design features an elastic waistband with a drawstring for adjustable comfort, along with front pockets and subtle stitching details. The wide-leg silhouette gives these trousers a relaxed and casual vibe, making them suitable for everyday wear. The deep indigo color adds a classic touch, allowing these trousers to be versatile enough to pair with various tops. These trousers are ideal for casual occasions and can be worn in mild to warm weather, providing both style and comfort."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/1e6b/f544/d5444fddade6/8d3a37fd4d2c/04391892051-e1/04391892051-e1.jpg?ts=1724075841864&w=850",
  ai_description: "garment_type: top,
garment_description: Leopard-print quilted jacket with a beige and dark brown color scheme. The jacket features a V-neckline, long sleeves, and large front pockets. The textile appears to be a soft, padded material, making it suitable for cooler weather. This stylish and bold pattern is ideal for casual occasions, particularly in fall or winter."
)

Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/f05b/95d3/fc1d4f098750/dfe4ccdfd8c0/03920170481-e1/03920170481-e1.jpg?ts=1724325330114&w=850",
  ai_description: "garment_type: bottom,
garment_description: A black plain-knit mini skirt made from a soft, stretchy fabric. This skirt has a sleek, minimalist design without any visible patterns or embellishments. It features a high waist and a fitted silhouette, making it suitable for both casual and semi-formal occasions. Ideal for mild to warm weather, it can be paired with various tops and footwear to create different looks."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/9702/d2d1/0ddc4fd3beb1/4fc1a2ff2191/02731244805-e2/02731244805-e2.jpg?ts=1717662295818&w=850",
  ai_description: "garment_type: bottom,
garment_description: A cream voluminous midi skirt made from a lightweight, flowing fabric. This skirt features a high waist with a gathered design, creating a full, airy silhouette that falls below the knees. The skirt has a soft, elegant look without any patterns, making it versatile for both casual and dressier occasions. Suitable for warm to mild weather, it pairs well with fitted or tucked-in tops to balance its voluminous shape."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/89bb/24f2/3d694a5b9fa7/4b2b3c016b5c/04365290406-e1/04365290406-e1.jpg?ts=1723110820515&w=850",
  ai_description: "garment_type: bottom,
garment_description: A light blue denim mini skirt made from classic, durable denim fabric. This skirt features a fitted, straight silhouette with a high waist, creating a flattering, casual look. It has a slightly faded wash with minimal detailing, including subtle stitching and a raw hemline for a slightly distressed finish. This skirt is ideal for casual, everyday wear and is best suited for warm to mild weather. It pairs well with a variety of tops, from t-shirts to blouses, for versatile styling."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/93c3/5a0d/faa4493b92a5/4d3e1f45b8fa/04391522300-e1/04391522300-e1.jpg?ts=1723116054084&w=850",
  ai_description: "garment_type: bottom
garment_description: A beige midi skirt made from a smooth, structured fabric with a belt included. This skirt features a high waist and a sleek, A-line silhouette that falls just below the knees. It has a classic design with a front button closure and a matching belt that cinches the waist, adding a tailored touch. Suitable for both casual and more formal occasions, this skirt is ideal for mild to warm weather and pairs well with both fitted and loose tops."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/7baa/47a9/16f3493eb1b9/706be0780916/05247731064-e1/05247731064-e1.jpg?ts=1722422748312&w=850",
  ai_description: "garment_type: top,
garment_description: An oversized pinstripe blazer in a light cream color made from a structured, slightly textured fabric. This blazer features a relaxed, oversized fit with wide shoulders and a long, flowing silhouette that extends past the hips. It has classic design elements, including notched lapels, front flap pockets, and a single-breasted closure with buttons. The subtle pinstripe pattern adds a sophisticated touch. Suitable for both casual and business-casual occasions, it is ideal for cool to mild weather and pairs well with various bottoms for a polished look."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/2b98/b0a6/9a2444dba30f/4b15b7dc8a58/07223024427-e1/07223024427-e1.jpg?ts=1724080005107&w=850",
  ai_description: "garment_type: bottom,
garment_description: A pair of light blue mom-fit shorts made from classic denim fabric. These shorts feature a high waist and a relaxed, slightly tapered fit with a cuffed hem. They include traditional details such as front pockets, back pockets, and a button and zipper closure. The design offers a casual, vintage-inspired look with a slightly distressed finish. Suitable for warm weather, these shorts are ideal for everyday wear and pair well with a variety of tops for a laid-back, stylish outfit."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/dfc0/a6c9/8dba4efab534/14adc13e9ee1/08372253743-e1/08372253743-e1.jpg?ts=1724666306731&w=850",
  ai_description: "garment_type: top,
garment_description: A water-repellent quilted jacket in a green color made from a durable, insulated fabric. This jacket features a padded, quilted design that provides warmth and protection against light rain. It has a slightly tailored fit with a high collar, a front zip closure, and elasticized cuffs to keep out the cold. The jacket includes side pockets with zip closures for added convenience. Suitable for cool to mild weather, it is ideal for casual wear and outdoor activities, offering both functionality and style."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/651c/34fc/02d146b19c66/61efb1462894/04764120814-e1/04764120814-e1.jpg?ts=1724942581757&w=850",
  ai_description: "garment_type: top,
garment_description: A satin sleeveless top in a rlight beige color made from a smooth, luxurious fabric. This top features a relaxed, draped fit with a high neckline and no visible closures. The satin material gives it a lustrous finish and a sophisticated appearance. Ideal for dressier occasions, this top is suitable for mild to warm weather and can be styled with various bottoms for a chic, elegant look."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/ac12/eca2/bdd64d98a0f2/4ea18338334b/08000399431-e1/08000399431-e1.jpg?ts=1724416269607&w=850",
  ai_description: "garment_type: bottom,
garment_description: A satin midi skirt in a light blue color made from a smooth, lustrous fabric. This skirt features a high waist and a flowy, A-line silhouette that falls gracefully below the knees. The satin material provides a soft, elegant drape, ideal for adding a touch of sophistication to both casual and formal outfits. Suitable for mild to warm weather, this skirt pairs well with a variety of tops for versatile styling options."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/3276/4801/7753426198da/9aa7ea246d07/02893141802-e1/02893141802-e1.jpg?ts=1724341608191&w=850",
  ai_description: "garment_type: top,
garment_description: A 100% wool knit waistcoat in a classic light grey color. This waistcoat features a sleeveless design with a fitted silhouette and a V-neckline. It has a button-down front with a subtle ribbed texture, providing both warmth and a polished appearance. Ideal for layering in cooler weather, this waistcoat is versatile for smart-casual to formal occasions and can be paired with both shirts and blouses for a refined look."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/1bc8/a74c/9e1c4b0fa039/3759ff7ee11f/00761317306-e1/00761317306-e1.jpg?ts=1724080206011&w=850",
  ai_description: "garment_type: top,
garment_description: A yellow hoodie made from a soft, cotton-blend fabric. This hoodie features a relaxed fit with a drawstring-adjustable hood and a front kangaroo pocket. It has ribbed cuffs and hem for a snug fit and a comfortable, casual look. Ideal for cooler weather, this hoodie is perfect for everyday wear and pairs well with various bottoms for a laid-back, casual outfit."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/f1a4/f3f3/8a7b4223808a/ecc1bfb1e6ff/01026708818-e1/01026708818-e1.jpg?ts=1724756416497&w=850",
  ai_description: "garment_type: top,
garment_description: A black polyamide bodysuit with a square neckline. This bodysuit features a form-fitting design made from a stretchy, smooth fabric that offers a sleek, seamless look. It has a square cut at the neckline and adjustable snap closures at the bottom for convenience. Ideal for layering or wearing on its own, this bodysuit is suitable for both casual and semi-formal occasions, and can be paired with various bottoms for a streamlined, chic outfit."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/3199/b2b0/74c2496ea7ad/a2e8d23504a8/01067620507-e1/01067620507-e1.jpg?ts=1724325347177&w=850",
  ai_description: "garment_type: top,
garment_description: A brown crochet top made from intricately woven, openwork fabric. This top features a loose, relaxed fit with short, slightly puffed sleeves and a scoop neckline. The crochet pattern creates a delicate, textured look, adding a touch of bohemian flair. Ideal for warm weather, this top is perfect for casual outings and can be paired with various bottoms for a breezy, stylish outfit."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/7710/f1a7/22794387827f/6ad6a1e8cf10/03067004800-e1/03067004800-e1.jpg?ts=1722518581533&w=850",
  ai_description: "garment_type: top,
garment_description: A black halter top with a tie detail made from a lightweight, smooth fabric. This top features a halter neck with adjustable ties that fasten behind the neck, creating an open back design. The front has a fitted bodice with a slightly flared hem for a relaxed fit. The minimalist design with the tie detail adds a chic, elegant touch. Ideal for warm weather."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/51f3/66fd/32214490bf05/3c60d48739f0/05427507979-e1/05427507979-e1.jpg?ts=1720090619512&w=850",
  ai_description: "garment_type: bottom,
garment_description: A satin midi skirt in a soft beige color made from a smooth, luxurious fabric. This skirt features a high waist and a flowing A-line silhouette that falls gracefully below the knees. The satin material provides a glossy, elegant finish, making it suitable for both casual and formal occasions. Ideal for mild to warm weather, this skirt pairs well with a variety of tops for a sophisticated, stylish outfit."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/9c15/6d96/519f436cb080/53c9988978e7/04764409753-e1/04764409753-e1.jpg?ts=1716282525167&w=850",
  ai_description: "garment_type: bottom,
garment_description: A long textured skirt in a deep brown color made from a woven, fabric with a subtle texture. This skirt features a high waist and a full, flowing silhouette that extends to the floor. The textured fabric adds visual interest and dimension, while the skirt's length and design make it suitable for both formal and semi-formal occasions. Ideal for mild to cooler weather, this skirt can be paired with various tops for an elegant, sophisticated look."
)
Garment.create!(
  user: ines,
  image_url: "https://static.zara.net/assets/public/29f9/0780/ebde46b8904c/87ea38c621cf/08372129403-e1/08372129403-e1.jpg?ts=1724079961509&w=850",
  ai_description: "garment_type: top,
garment_description: A pale blue 100% linen basic shirt made from a breathable, lightweight fabric. This shirt features a relaxed fit with a classic collar, a button-down front, and long sleeves with buttoned cuffs. The linen material provides a crisp, airy feel, making it suitable for warm weather. The minimalist design ensures versatility, allowing it to be worn casually or dressed up for more formal occasions. Ideal for hot weather, this shirt pairs well with a variety of bottoms for a clean, effortless look."
)

Garment.create!(
  user: ines,
  image_url: 'jeans.jpg',
  ai_description: "garment_type: bottom,
  garment_description: blue denim trousers. very comfy."
)

 Garment.create!(
  user: ines,
  image_url: 'beige_hoodie.jpg',
  ai_description: "garment_type: top,
  garment_description: beige hoodie. Should be matched with denim bottoms and then other bottoms."
)

# IMAGES = [
#   # tops - short
#   "https://static.zara.net/assets/public/c5ad/e9e3/3b8f4b648c02/9b3e82c05a75/02142153441-e1/02142153441-e1.jpg?ts=1724325334014&w=750",
#   "https://static.zara.net/assets/public/28a1/2541/4c384e229a35/56f69a7ff2f7/01131807644-e1/01131807644-e1.jpg?ts=1722936482233&w=396",
#   "https://static.zara.net/assets/public/5103/ff5c/e94d4ec89c39/5019cc8038ed/04437230800-e1/04437230800-e1.jpg?ts=1723124994327&w=396",
#   "https://static.zara.net/assets/public/4fef/17c4/3f24488ab471/285278f64714/02893104802-e1/02893104802-e1.jpg?ts=1722871726632&w=396",
#   "https://static.zara.net/assets/public/21b6/a1c2/5ff045f994a6/494eb4f51db7/02142115806-e1/02142115806-e1.jpg?ts=1723453415392&w=396",

#   # tops - long/warm
#   "https://static.zara.net/assets/public/b45f/bd0f/33e54c1d82f7/4eac485d4ce5/08417800621-e1/08417800621-e1.jpg?ts=1723650458872&w=396",
#   "https://static.zara.net/assets/public/81c5/8e3a/f3e143749223/57a4b125f060/02893104300-e1/02893104300-e1.jpg?ts=1722871396195&w=396",
#   "https://lp.stories.com/app005prod?set=key[resolve.pixelRatio],value[1]&set=key[resolve.width],value[1500]&set=key[resolve.height],value[10000]&set=key[resolve.imageFit],value[containerwidth]&set=key[resolve.allowImageUpscaling],value[0]&set=key[resolve.format],value[jpeg]&set=key[resolve.quality],value[80]&set=source[/c3/74/c37474687d84cf87dcc7d4d8b45f3cfc90647501.jpg],origin[dam],type[DESCRIPTIVESTILLLIFE],ImageVersion[2]&call=url[file:/product/dynamic.chain]",
#   "https://lp.stories.com/app005prod?set=key[resolve.pixelRatio],value[1]&set=key[resolve.width],value[1500]&set=key[resolve.height],value[10000]&set=key[resolve.imageFit],value[containerwidth]&set=key[resolve.allowImageUpscaling],value[0]&set=key[resolve.format],value[jpeg]&set=key[resolve.quality],value[80]&set=source[/b4/1d/b41d1f10afa36520b04e92d1affeb631365b55c5.jpg],origin[dam],type[DESCRIPTIVESTILLLIFE],ImageVersion[1]&call=url[file:/product/dynamic.chain]",

#   # bottoms
#   "https://static.zara.net/assets/public/73b3/a947/09a449feb515/4cbaa69f6ad9/08417801712-e1/08417801712-e1.jpg?ts=1723650452774&w=750",
#   "https://static.zara.net/assets/public/2d38/8003/934c4d7e8cb9/a411e2c1ad8c/01889159427-e1/01889159427-e1.jpg?ts=1723651182038&w=396",
#   "https://static.zara.net/assets/public/fcb4/2c17/ed3540fa8ea7/462f31c9da30/08944336611-e1/08944336611-e1.jpg?ts=1723805674849&w=396",
#   "https://static.zara.net/assets/public/7f47/c252/abcc491ca1bb/cb1cfd8277fa/09929224800-e1/09929224800-e1.jpg?ts=1723020791628&w=396",
#   "https://static.zara.net/assets/public/d41f/786e/27414a0ea4e3/170babc9a3cc/05520221443-e1/05520221443-e1.jpg?ts=1720771680404&w=824"
# ]



# IMAGES = [
#   # tops
#   "https://static.zara.net/assets/public/c5ad/e9e3/3b8f4b648c02/9b3e82c05a75/02142153441-e1/02142153441-e1.jpg?ts=1724325334014&w=750",
#   "https://static.zara.net/assets/public/28a1/2541/4c384e229a35/56f69a7ff2f7/01131807644-e1/01131807644-e1.jpg?ts=1722936482233&w=396",
#   "https://static.zara.net/assets/public/5103/ff5c/e94d4ec89c39/5019cc8038ed/04437230800-e1/04437230800-e1.jpg?ts=1723124994327&w=396",
#   "https://static.zara.net/assets/public/4fef/17c4/3f24488ab471/285278f64714/02893104802-e1/02893104802-e1.jpg?ts=1722871726632&w=396",
#   "https://static.zara.net/assets/public/21b6/a1c2/5ff045f994a6/494eb4f51db7/02142115806-e1/02142115806-e1.jpg?ts=1723453415392&w=396",
#   "https://static.zara.net/assets/public/e651/83a9/85c94204b75a/dc4c5596c146/05536113620-e1/05536113620-e1.jpg?ts=1720004227302&w=396",
#   "https://static.zara.net/assets/public/b45f/bd0f/33e54c1d82f7/4eac485d4ce5/08417800621-e1/08417800621-e1.jpg?ts=1723650458872&w=396",
#   "https://static.zara.net/assets/public/81c5/8e3a/f3e143749223/57a4b125f060/02893104300-e1/02893104300-e1.jpg?ts=1722871396195&w=396",
#   "https://static.zara.net/assets/public/218a/8206/096d4e6d88fc/096497dbb495/02893104400-e1/02893104400-e1.jpg?ts=1722871387524&w=396",
#   "https://static.zara.net/assets/public/dd6f/1e3e/c5014b27b697/3f89d9ddd3ae/02142112600-e1/02142112600-e1.jpg?ts=1723644496360&w=396",
#   # bottoms
#   "https://static.zara.net/assets/public/73b3/a947/09a449feb515/4cbaa69f6ad9/08417801712-e1/08417801712-e1.jpg?ts=1723650452774&w=750",
#   "https://static.zara.net/assets/public/2d38/8003/934c4d7e8cb9/a411e2c1ad8c/01889159427-e1/01889159427-e1.jpg?ts=1723651182038&w=396",
#   "https://static.zara.net/assets/public/fcb4/2c17/ed3540fa8ea7/462f31c9da30/08944336611-e1/08944336611-e1.jpg?ts=1723805674849&w=396",
#   "https://static.zara.net/assets/public/7f47/c252/abcc491ca1bb/cb1cfd8277fa/09929224800-e1/09929224800-e1.jpg?ts=1723020791628&w=396",
#   "https://static.zara.net/assets/public/ccae/d934/f767462cb900/7a3d38a22bc1/02157232632-015-a1/02157232632-015-a1.jpg?ts=1720801468574&w=750",
#   "https://static.zara.net/assets/public/5885/f99e/6d094c1e8385/ddc723e808c1/02142134681-e1/02142134681-e1.jpg?ts=1724315557111&w=750"
# ]



# def crop_image(image_path)
#   image = MiniMagick::Image.open(image_path)
#   image.combine_options do |c|
#     c.trim
#     c.repage.+
#   end
#   image
# end

# 3.times do
#   sleep 45
#   image = URI.open(IMAGES.sample)
#   garment = Garment.new(
#     user: ines
#   )
#   garment.photo.attach(io: image, filename: "image.png", content_type: "image/png")
#   garment.save
# end
