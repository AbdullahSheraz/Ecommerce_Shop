class CategoryModel {
  final String title;
  final String? image, svgSrc;
  final List<CategoryModel>? subCategories;

  CategoryModel({
    required this.title,
    this.image,
    this.svgSrc,
    this.subCategories,
  });
}
final List<CategoryModel> demoCategoriesWithImage = [
  CategoryModel(title: "Tiles", image: "https://i.imgur.com/5M89G2P.png"),
  CategoryModel(title: "Floor Tiles", image: "https://i.imgur.com/UM3GdWg.png"),
  CategoryModel(title: "Bathroom Tiles", image: "https://i.imgur.com/Lp0D6k5.png"),
  CategoryModel(title: "Imported Tiles", image: "https://i.imgur.com/3mSE5sN.png"),
  CategoryModel(title: "Sanitary Ware", image: "https://i.imgur.com/3mSE5sN.png"),
];

final List<CategoryModel> demoCategories = [
  CategoryModel(
    title: "Tiles",
    svgSrc: "assets/icons/Tiles.svg",
    subCategories: [
      CategoryModel(title: "All Tiles"),
      CategoryModel(title: "Wall Tiles"),
      CategoryModel(title: "Kitchen Tiles"),
      CategoryModel(title: "Outdoor Tiles"),
    ],
  ),
  CategoryModel(
    title: "Floor Tiles",
    svgSrc: "assets/icons/FloorTiles.svg",
    subCategories: [
      CategoryModel(title: "Ceramic Tiles"),
      CategoryModel(title: "Porcelain Tiles"),
      CategoryModel(title: "Wooden Finish Tiles"),
    ],
  ),
  CategoryModel(
    title: "Bathroom Tiles",
    svgSrc: "assets/icons/BathroomTiles.svg",
    subCategories: [
      CategoryModel(title: "Anti-Skid Tiles"),
      CategoryModel(title: "Wall Tiles"),
      CategoryModel(title: "Shower Area Tiles"),
    ],
  ),
  CategoryModel(
    title: "Imported Tiles",
    svgSrc: "assets/icons/ImportedTiles.svg",
    subCategories: [
      CategoryModel(title: "Italian Tiles"),
      CategoryModel(title: "Spanish Tiles"),
      CategoryModel(title: "Marble Finish Tiles"),
    ],
  ),
  CategoryModel(
    title: "Sanitary Ware",
    svgSrc: "assets/icons/SanitaryWare.svg",
    subCategories: [
      CategoryModel(title: "Wash Basins"),
      CategoryModel(title: "Toilets"),
      CategoryModel(title: "Urinals"),
      CategoryModel(title: "Bathroom Accessories"),
    ],
  ),
];
