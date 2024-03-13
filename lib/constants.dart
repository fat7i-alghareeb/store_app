const String mainNavigator = "/";
const String detailsScreen = "/detailsScreen";
const String categoryProducts = "/categoryProducts";
const String searchScreen = "/searchScreen";
int selectedIndex = -1;

// final sliderImage = [
//   ClipRRect(
//     borderRadius: const BorderRadius.only(
//         bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
//     child: Image.asset(
//       "images/thumb.png",
//       fit: BoxFit.cover,
//       //width: double.infinity,
//     ),
//   ),
//   ClipRRect(
//     borderRadius: const BorderRadius.only(
//         bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
//     child: Image.asset(
//       "images/thumb2.png",
//       fit: BoxFit.cover,
//     ),
//   ),
//   ClipRRect(
//     borderRadius: const BorderRadius.only(
//         bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
//     child: Image.asset(
//       "images/thumb6.png",
//       fit: BoxFit.cover,
//     ),
//   ),
//   ClipRRect(
//     borderRadius: const BorderRadius.only(
//         bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
//     child: Image.asset(
//       "images/thumb3.png",
//       fit: BoxFit.cover,
//     ),
//   ),
//   ClipRRect(
//     borderRadius: const BorderRadius.only(
//         bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
//     child: Image.asset(
//       "images/thumb4.png",
//       fit: BoxFit.cover,
//     ),
//   ),
// ];

final categories = [
  "mens-shirts",
  "lighting",
  "furniture",
  "mens-shoes",
  "smartphones",
  "laptops",
  "fragrances",
  "skincare",
  "groceries",
  "home-decoration",
];
final categoriesAvailable = {
  "mens-shirts": "images/categories/shirt-long-sleeve.png",
  "lighting": "images/categories/plug.png",
  "furniture": "images/categories/couch.png",
  "mens-shoes": "images/categories/shoe-prints.png",
  "smartphones": "images/categories/mobile-button.png",
  "laptops": "images/categories/laptop.png",
  "skincare": "images/categories/cream.png",
  "fragrances": "images/categories/air-freshener.png",
  "groceries": "images/categories/grocery-bag.png",
  "home-decoration": "images/categories/home-decoration.png"
};
List<String> getImages(List<dynamic> images) {
  List<String> urls = [];

  RegExp exp = RegExp(r'https?://[^\\]+');

  for (var inputString in images) {
    Iterable<Match> matches = exp.allMatches(inputString);
    for (Match match in matches) {
      String url = match.group(0)!;
      urls.add(
          url.replaceAll(RegExp(r'[\[\]"]'), '')); // Remove brackets and quotes
    }
  }
  return urls;
}
