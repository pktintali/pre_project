class CategoryData {
  final String name;
  final int numOfShops;
  final String image;

  CategoryData(this.name, this.numOfShops, this.image);
}

List<CategoryData> categories = categoriesData
    .map((item) => CategoryData(item['name'], item['shops'], item['image']))
    .toList();

var categoriesData = [
  {"name": "Electronics", 'shops': 17, 'image': "assets/images/red.png"},
  {"name": "Grocery", 'shops': 25, 'image': "assets/images/green.png"},
  {"name": "Utensils", 'shops': 13, 'image': "assets/images/blue.png"},
  {"name": "Households", 'shops': 17, 'image': "assets/images/yellow.png"},
  {"name": "Electronics", 'shops': 17, 'image': "assets/images/red.png"},
  {"name": "Grocery", 'shops': 25, 'image': "assets/images/green.png"},
  {"name": "Utensils", 'shops': 13, 'image': "assets/images/blue.png"},
];
