require 'faker'

Garment.destroy_all
User.destroy_all
IMAGES = [
  # tops
  "https://communityclothing.co.uk/cdn/shop/files/220421CommunityClothing175768_Portrait_12c00a3a-1b81-44ef-adfe-452c54e677b8_2048x.jpg?v=1694641971",
  "https://ivyt.co.uk/cdn/shop/files/organiccottonwhitetshirt_668fb6f5-2e2f-44a6-93d1-4237ecb12e6d_900x.png?v=1688123214",
  "https://www.umbro.co.uk/uploads/images/products/verylarge/umbro_coreoversizedtee_1693913587UMTL0184_D88_3.jpg",
  "https://colorfulstandard.com/cdn/shop/products/Women_Light_Organic_Tee-Women_T-shirt-CS2051-Emerald_Green.jpg?v=1664771706&width=2048",
  "https://silverstick.co.uk/cdn/shop/products/Silverstick-Womens-Organic-Cotton-T-Shirt-Navy-Front_3434d4e4-9916-4298-9ba2-495da85b49bd.jpg?v=1564655880",
  "https://uk.saintandsofia.com/cdn/shop/products/austen-crew-neck-tee-burgundy-women-s-t-shirt-saint-sofia-uk-29939391529063.jpg?v=1667585589",
  "https://xcdn.next.co.uk/Common/Items/Default/Default/ItemImages/Search/676/322959.jpg?im=Resize,width=350",
  "https://img.kwcdn.com/product/fancy/571c0264-cbdd-4e8c-ba54-bee75eb3784d.jpg?imageView2/2/w/500/q/60/format/webp",
  "https://m.media-amazon.com/images/I/71eZJ1UkKfL._AC_UY350_.jpg",
  "https://assets.digitalcontent.marksandspencer.app/image/upload/w_1024,q_80,f_auto/SD_01_T43_3835_A0_X_EC_0",
  # bottoms
  "https://m.media-amazon.com/images/I/51wjFtdiZrL._AC_UY1000_.jpg",
  "https://www.simonjersey.com/images/contemporary-womens-slim-leg-trouser-unhemmed-length-charcoal-p4027-291991_image.jpg",
  "https://m.media-amazon.com/images/I/515kkLE9+cL._AC_UF894,1000_QL80_.jpg",
  "https://img.kwcdn.com/product/Fancyalgo/VirtualModelMatting/15e8a8b7a1804068c2ea0c58596ca96b.jpg?imageMogr2/auto-orient%7CimageView2/2/w/800/q/70/format/webp",
  "https://cdn.thewirecutter.com/wp-content/media/2023/10/womensjeans-2048px-04346.jpg?auto=webp&quality=75&width=1024"
]



ines = User.create!(
  email: "ines@ines.com",
  password: "123456")

10.times do
  garment = Garment.new(
    ai_description: Faker::Marketing.buzzwords,
    user: ines,
    image_url: IMAGES.sample
  )
  garment.save
end
