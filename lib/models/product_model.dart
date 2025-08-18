// For demo only
import 'package:shop/constants.dart';

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final String? description;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    required this.description,
    this.priceAfetDiscount,
    this.dicountpercent,
  });
}

List<ProductModel> tilesProducts = [
  ProductModel(
    image: productDemoImg1,
    title: "Glossy White Wall Tiles",
    brandName: "TilePro",
    price: 750,

   
    description:
        "Enhance your space with glossy white tiles. \nDurable and easy-to-clean surface. \nIdeal for kitchens and bathrooms. \nGives a sleek and modern look.",
  ),
  ProductModel(
    image: productDemoImg3,
    title: "Matte Finish Black Tiles",
    brandName: "TileMaster",
    price: 1200,
  
    description:
        "Premium matte black finish for elegance. \nNon-slip surface for extra safety. \nPerfect for indoor and outdoor use. \nResistant to stains and moisture.",
  ),
  ProductModel(
    image: productDemoImg2,
    title: "Classic White Wall Tiles",
    brandName: "TilePro",
    price: 750,
   
    description:
        "Classic white glossy tiles for bright interiors. \nSmooth finish with high durability. \nIdeal for modern and minimalistic designs. \nResists water and stains effectively.",
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Matte Finish Black Tiles",
    brandName: "TileMaster",
    price: 1200,
 
    description:
        "Matte black tiles with anti-slip texture. \nAdds a bold and elegant touch to spaces. \nHighly resistant to scratches and moisture. \nPerfect for both residential and commercial use.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/SLATEBEIGE60X120copy.jpg?v=1721714558&width=600',
    title: "Beige Emboss Porcelain Tile",
    brandName: "Orient Ceramica",
    price: 2800,
  
    description:
        "Elegant beige embossed texture for a natural stone look. \nDurable and scratch-resistant. \nIdeal for both indoor and outdoor applications. \nMoisture and stain-resistant surface.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/L62080_53784408-60e7-4a9c-ab0b-8ade80939d25.jpg?v=1719298206&width=600',
    title: "L62080 Gloss Porcelain Tile",
    brandName: "Time Ceramics",
    price: 2100,

    description:
        "Glossy porcelain tiles for a luxurious finish. \nHighly durable and scratch-resistant. \nPerfect for living rooms, kitchens, and bathrooms. \nEasy to maintain and clean.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/L4210_7dd203e9-e9e7-4a6f-bc72-fb9bc195e533.jpg?v=1719293364&width=600',
    title: "L4210 Gloss Porcelain Tile",
    brandName: "Time Ceramics",
    price: 1550,
    description:
        "Bright white glossy finish for a sleek look. \nHighly resistant to water and stains. \nPerfect for modern interiors and high-traffic areas. \nDurable and easy to maintain.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/OR66055.jpg?v=1720002949&width=600',
    title: "OR66055 Gloss Porcelain Tile",
    brandName: "Oreal Ceramics",
    price: 1550,
   
    description:
        "Glossy surface with a luxurious feel. \nIdeal for residential and commercial interiors. \nStain-resistant and easy to clean. \nProvides an elegant touch to any space.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/L4253_102c6d8f-2283-4458-bdac-dcb2a32b8d29.jpg?v=1719293335&width=600',
    title: "L4253 Gloss Porcelain Tile",
    brandName: "TilePro",
    price: 1550,
    description:
        "Smooth white glossy finish for a clean and elegant look. \nHighly durable and long-lasting. \nIdeal for walls and flooring in modern spaces. \nResistant to stains and moisture.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/L62098_2aae8e9b-ed1b-4f95-92dc-a76b70e06ff1.jpg?v=1719298257&width=600',
    title: "L62098 Gloss Porcelain Tile",
    brandName: "Time Ceramics",
    price: 2100,
    description:
        "High-gloss porcelain tile for an elegant appeal. \nStrong and resistant to scratches. \nPerfect for both residential and commercial use. \nEasy to clean and maintain.",
  ),
];

List<ProductModel> floorTilesProducts = [
  ProductModel(
    image:
        'https://www.stile.com.pk/wp-content/uploads/2025/03/WP-009-Orange-3-min.jpg',
    title: "Vitrified-Glazed Matt Floor Tiles",
    brandName: "Stile",
    price: 900,

    description: "Elegant wood-like texture enhances the natural look.\n"
        "Water-resistant and scratch-proof for durability.\n"
        "Perfect for living rooms and bedrooms.\n"
        "Easy to install and maintain.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9557.jpg?v=1668607980&width=600',
    title: "Silver Wave Gloss Porcelain Slab Tile",
    brandName: "Porcelux China",
    price: 5500,
    description: "Luxurious marble-like finish for a premium look.\n"
        "Highly durable and resistant to wear.\n"
        "Adds elegance and sophistication to any space.\n"
        "Ideal for high-traffic areas like hallways and offices.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9484.jpg?v=1668607981&width=600',
    title: "Beige Carrara Gloss Porcelain Tile",
    brandName: "Porcelux China",
    price: 3000,
    description: "Soft beige tone with a natural marble pattern.\n"
        "High-gloss finish for a sophisticated appeal.\n"
        "Long-lasting and easy to clean.\n"
        "Ideal for both residential and commercial spaces.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9391.jpg?v=1668607978&width=600',
    title: "Classic Beige Gloss Porcelain Tile",
    brandName: "Porcelux China",
    price: 3100,
    description: "Subtle beige hues with a glossy finish.\n"
        "Durable and resistant to stains and scratches.\n"
        "Enhances the elegance of any room.\n"
        "Best suited for living rooms, kitchens, and bathrooms.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9564.jpg?v=1668607980&width=600',
    title: "Macael White Gloss Porcelain Slab Tile",
    brandName: "Porcelux China",
    price: 6300,

    description: "Premium white marble-inspired porcelain slab.\n"
        "Reflective glossy finish for a luxurious touch.\n"
        "Scratch and water-resistant for lasting beauty.\n"
        "Ideal for high-end interiors and modern spaces.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9472.jpg?v=1668607980&width=600',
    title: "Floral Ivory Motive Gloss Porcelain Tile",
    brandName: "Porcelux China",
    price: 900,

    description: "Unique floral-inspired ivory design.\n"
        "Glossy finish adds a sophisticated shine.\n"
        "Water-resistant and easy to maintain.\n"
        "Great for accent walls and elegant flooring.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9607.jpg?v=1668607980&width=600',
    title: "Creme Grey Textured Matte Porcelain Tile",
    brandName: "Porcelux China",
    price: 2800,
    description: "Neutral grey shade with a subtle texture.\n"
        "Matte finish prevents glare and enhances aesthetics.\n"
        "High durability makes it perfect for busy areas.\n"
        "Suitable for both modern and rustic interior styles.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9627.jpg?v=1668607980&width=600',
    title: "Natural Brown Print Matte Porcelain Tile",
    brandName: "Porcelux China",
    price: 2800,

    description: "Warm brown tone with a wood-like texture.\n"
        "Scratch-resistant and water-resistant.\n"
        "Matte finish provides a natural and authentic look.\n"
        "Ideal for cozy living spaces and nature-inspired interiors.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9480.jpg?v=1668607984&width=600',
    title: "Grander Lucido Quipar Satin Texture Matte Porcelain Tile",
    brandName: "Porcelux China",
    price: 3000,
    description: "Satin-textured matte finish for a soft, elegant feel.\n"
        "Neutral color complements various design themes.\n"
        "High durability for both indoor and outdoor use.\n"
        "Enhances contemporary and minimalist interiors.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9537.jpg?v=1668607975&width=600',
    title: "Bardiglio Carrara Grey Gloss Porcelain Slab Tile",
    brandName: "Porcelux China",
    price: 2800,
    description: "Elegant grey Carrara marble design.\n"
        "Glossy surface for a premium look.\n"
        "Ideal for modern and classic interiors.\n"
        "Durable, easy to maintain, and perfect for high-traffic areas.",
  ),
];

List<ProductModel> bathroomTilesProducts = [
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9472.jpg?v=1668607980&width=600',
    title: "Floral Ivory Motive Gloss Porcelain Tile",
    brandName: "Porcelux China",
    price: 900,
 
    description: "Unique floral-inspired ivory design.\n"
        "Glossy finish adds a sophisticated shine.\n"
        "Water-resistant and easy to maintain.\n"
        "Great for accent walls and elegant flooring.",
  ),
  ProductModel(
    image:
        'https://www.stile.com.pk/wp-content/uploads/2025/03/WP-009-Orange-3-min.jpg',
    title: "Vitrified-Glazed Matt Floor Tiles",
    brandName: "Stile",
    price: 900,

    description: "Elegant wood-like texture enhances the natural look.\n"
        "Water-resistant and scratch-proof for durability.\n"
        "Perfect for living rooms and bedrooms.\n"
        "Easy to install and maintain.",
  ),
  ProductModel(
    image: productDemoImg3,
    title: "Anti-Skid Bathroom Tiles",
    brandName: "SafeTiles",
    price: 500,

    description:
        "Slip-resistant tiles for safety. \nStylish and moisture-resistant. \nPerfect for wet areas like bathrooms. \nEnsures long-term durability.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/L62080_53784408-60e7-4a9c-ab0b-8ade80939d25.jpg?v=1719298206&width=600',
    title: "L62080 Gloss Porcelain Tile",
    brandName: "Time Ceramics",
    price: 2100,
 
    description:
        "Glossy porcelain tiles for a luxurious finish. \nHighly durable and scratch-resistant. \nPerfect for living rooms, kitchens, and bathrooms. \nEasy to maintain and clean.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9484.jpg?v=1668607981&width=600',
    title: "Beige Carrara Gloss Porcelain Tile",
    brandName: "Porcelux China",
    price: 3000,
    description: "Soft beige tone with a natural marble pattern.\n"
        "High-gloss finish for a sophisticated appeal.\n"
        "Long-lasting and easy to clean.\n"
        "Ideal for both residential and commercial spaces.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/products/IMG_9391.jpg?v=1668607978&width=600',
    title: "Classic Beige Gloss Porcelain Tile",
    brandName: "Porcelux China",
    price: 3100,
    description: "Subtle beige hues with a glossy finish.\n"
        "Durable and resistant to stains and scratches.\n"
        "Enhances the elegance of any room.\n"
        "Best suited for living rooms, kitchens, and bathrooms.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/L4210_7dd203e9-e9e7-4a6f-bc72-fb9bc195e533.jpg?v=1719293364&width=600',
    title: "L4210 Gloss Porcelain Tile",
    brandName: "Time Ceramics",
    price: 1550,
    description:
        "Bright white glossy finish for a sleek look. \nHighly resistant to water and stains. \nPerfect for modern interiors and high-traffic areas. \nDurable and easy to maintain.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/L4253_102c6d8f-2283-4458-bdac-dcb2a32b8d29.jpg?v=1719293335&width=600',
    title: "L4253 Gloss Porcelain Tile",
    brandName: "TilePro",
    price: 1550,
    description:
        "Smooth white glossy finish for a clean and elegant look. \nHighly durable and long-lasting. \nIdeal for walls and flooring in modern spaces. \nResistant to stains and moisture.",
  ),
  ProductModel(
    image:
        'https://zatile.co/cdn/shop/files/L62098_2aae8e9b-ed1b-4f95-92dc-a76b70e06ff1.jpg?v=1719298257&width=600',
    title: "L62098 Gloss Porcelain Tile",
    brandName: "Time Ceramics",
    price: 2100,
    description:
        "High-gloss porcelain tile for an elegant appeal. \nStrong and resistant to scratches. \nPerfect for both residential and commercial use. \nEasy to clean and maintain.",
  ),
  ProductModel(
    image: productDemoImg1,
    title: "Shower Area Ceramic Tiles",
    brandName: "AquaTiles",
    price: 600,

    description:
        "Perfect tiles for shower and wet areas. \nNon-porous and easy to maintain. \nProvides a sleek and elegant look. \nEnsures durability and slip resistance.",
  ),
];
List<ProductModel> importedTilesProducts = [
  ProductModel(
    image: 'https://abuyousaftraders.com/wp-content/uploads/2024/06/SFORZA.jpg',
    title: "SFORZA Tiles",
    brandName: "Abu Yousaf Traders",
    price: 7950,

    description:
        "Elegant Italian marble-style tiles. \nPerfect for creating a luxurious ambiance. \nHighly durable and scratch-resistant. \nIdeal for both floors and walls.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/COLONIAL-CAOBA.jpg',
    title: "COLONIAL-CAOBA Tiles",
    brandName: "Abu Yousaf Traders",
    price: 9500,
    description:
        "Classic Spanish ceramic tiles. \nRich wooden texture with a polished finish. \nGreat for adding warmth to any space. \nEasy to clean and long-lasting.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/TUSCANIA-LORETO.jpg',
    title: "TUSCANIA-LORETO Tiles",
    brandName: "Abu Yousaf Traders",
    price: 7950,
  
    description:
        "Premium Italian-style tiles. \nSubtle and elegant veining for a timeless look. \nHighly resistant to stains and moisture. \nIdeal for high-traffic areas.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/RICORDI-NERO.jpg',
    title: "RICORDI-NERO Tiles",
    brandName: "Abu Yousaf Traders",
    price: 8950,

    description:
        "Sophisticated black marble-inspired tiles. \nCreates a bold and stylish interior. \nNon-slip and highly durable. \nPerfect for modern spaces.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/RICORDI-CREAM.jpg',
    title: "RICORDI-CREAM Tiles",
    brandName: "Abu Yousaf Traders",
    price: 9500,
    description:
        "Soft cream-colored tiles with a polished surface. \nBrings warmth and elegance to interiors. \nEasy to maintain and highly durable. \nIdeal for both residential and commercial use.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/RICORDI-AZURRO.jpg',
    title: "RICORDI-AZURRO Tiles",
    brandName: "Abu Yousaf Traders",
    price: 8900,
    description:
        "Beautiful blue-toned tiles with a unique texture. \nPerfect for refreshing interior designs. \nScratch-resistant and moisture-proof. \nGreat for bathrooms and kitchens.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/DECOR-LEGEND.jpg',
    title: "DECOR-LEGEND Tiles",
    brandName: "Abu Yousaf Traders",
    price: 8800,
 
    description:
        "Decorative tiles with an intricate pattern. \nAdds artistic charm to any space. \nMade from high-quality ceramic. \nPerfect for feature walls and floors.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/SOHO_MIX_15X15.jpg',
    title: "SOHO MIX 15x15 Tiles",
    brandName: "Abu Yousaf Traders",
    price: 9500,
    description:
        "Trendy mix of patterned tiles. \nIdeal for creative and modern interiors. \nEasy to install and maintain. \nPerfect for kitchens and accent walls.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/DECOR-NILO-BROWN.jpg',
    title: "DECOR-NILO-BROWN Tiles",
    brandName: "Abu Yousaf Traders",
    price: 9500,
    description:
        "Warm brown-toned tiles with a rustic touch. \nEnhances the charm of any space. \nResistant to stains and moisture. \nGreat for both indoor and outdoor use.",
  ),
  ProductModel(
    image:
        'https://abuyousaftraders.com/wp-content/uploads/2024/06/ESCAMA-CARAMEL.jpg',
    title: "ESCAMA-CARAMEL Tiles",
    brandName: "Abu Yousaf Traders",
    price: 8500,
    description:
        "Textured caramel-colored tiles. \nAdds warmth and depth to interiors. \nHighly durable and easy to clean. \nIdeal for living spaces and feature walls.",
  ),
];
List<ProductModel> sanitaryWareProducts = [
  ProductModel(
    image: productDemoImg01,
    title: "Modern Wash Basin",
    brandName: "Sanitech",
    price: 1800,
  
    description: "Sleek and modern wash basin design. Made from high-quality ceramic. Scratch and stain-resistant. Perfect for contemporary bathrooms.",
  ),
  ProductModel(
    image: productDemoImg02,
    title: "Sanitary Wares",
    brandName: "AquaSan",
    price: 3500,

    description: "High-quality sanitary ware collection. Designed for durability and comfort. Easy to clean and maintain. Perfect for modern washrooms.",
  ),
  ProductModel(
    image: 'https://sanitariopk.com/cdn/shop/files/bs3.webp?v=1711519600',
    title: "Stainless Steel 304 Bathroom Hot and Cold Faucet Spot",
    brandName: "Sanitari",
    price: 7399,
 
    description: "Premium stainless steel faucet with hot and cold water functionality. Corrosion-resistant and durable. Adds a touch of elegance to any bathroom.",
  ),
  ProductModel(
    image: 'https://sanitariopk.com/cdn/shop/products/81rsh001-8in-chr-a_1024x1024_2x_5bfb3a70-b96b-4d6e-a3a8-b1d67b9c77ff.webp?v=1682589147',
    title: "Overhead Rain Shower – Stainless Steel",
    brandName: "Sanitari",
    price: 3500,
    description: "Luxury overhead rain shower for a spa-like experience. Made from high-quality stainless steel. Ensures even water distribution for a refreshing bath.",
  ),
  ProductModel(
    image: 'https://sanitariopk.com/cdn/shop/products/51BuswCaMaL._AC_SL1001.webp?v=1684367265',
    title: "Stainless Steel 304 Push Floor Drain Waste 6x6",
    brandName: "Sanitari",
    price: 2799,
    description: "High-quality push floor drain made from stainless steel. Prevents clogging and ensures smooth water drainage. Rust and corrosion-resistant.",
  ),
  ProductModel(
    image: 'https://sanitariopk.com/cdn/shop/products/NewProductDevelopmenPostInstagram_42.jpg?v=1707154238',
    title: "Stainless Steel Muslim Toilet Shower",
    brandName: "Sanitari",
    price: 3799,

    description: "Ergonomic and hygienic toilet shower. Made of durable stainless steel. Provides a smooth and controlled water flow.",
  ),
  ProductModel(
    image: 'https://sanitariopk.com/cdn/shop/files/7_db052c9b-0c83-448d-afb5-950935aec48a.png?v=1741657316',
    title: "6-Piece Luxury Bathroom Accessories Set – Premium Quality",
    brandName: "Sanitari",
    price: 19999,
    description: "Complete bathroom set including towel racks, soap dispensers, and more. Premium stainless steel construction. Ideal for modern and luxurious bathrooms.",
  ),
  ProductModel(
    image: 'https://www.britesanitaryware.com/wp-content/uploads/2024/06/p15.jpg',
    title: "Beauty One Piece Cito by Brite Sanitary Ware",
    brandName: "Sanitari",
    price: 18999,
    description: "Premium one-piece toilet with a sleek and modern design. Made from high-grade ceramic for durability and easy maintenance. Comfortable and water-efficient.",
  ),
];
