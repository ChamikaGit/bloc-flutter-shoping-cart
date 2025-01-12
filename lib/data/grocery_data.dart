class GroceryData {
  static List<Map<String, dynamic>> groceryProducts = [
    {
      "id": 1,
      "name": "Apple",
      "description": "Fresh and juicy apples.",
      "price": 2.99,
      "imageUrl":
          "https://images.unsplash.com/photo-1567306226416-28f0efdc88ce",
    },
    {
      "id": 2,
      "name": "Milk",
      "description": "1 liter of full cream milk.",
      "price": 1.49,
      "imageUrl":
          "https://images.unsplash.com/photo-1585411278840-a72db245c8f0",
    },
    {
      "id": 3,
      "name": "Bread",
      "description": "Whole grain bread loaf.",
      "price": 2.19,
      "imageUrl":
          "https://images.unsplash.com/photo-1588345921523-9f07eac1e57e",
    },
    {
      "id": 4,
      "name": "Eggs",
      "description": "A dozen organic eggs.",
      "price": 3.99,
      "imageUrl":
          "https://images.unsplash.com/photo-1571142824303-9a34d1f53738",
    },
    {
      "id": 5,
      "name": "Banana",
      "description": "Ripe and sweet bananas.",
      "price": 1.29,
      "imageUrl":
          "https://images.unsplash.com/photo-1574226516831-e1dff420485d",
    },
  ];
}

// void main() {
//   // Access and print the static list
//   for (var product in GroceryData.groceryProducts) {
//     print(
//         "${product['name']} - \$${product['price']} - Image: ${product['imageUrl']}");
//   }
// }

// void main() {
//   // Access and print the static list
//   for (var product in GroceryData.groceryProducts) {
//     print("${product['name']} - \$${product['price']}");
//   }
// }
