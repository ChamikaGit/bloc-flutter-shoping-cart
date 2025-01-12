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
          "https://images.unsplash.com/photo-1550583724-b2692b85b150?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWlsa3xlbnwwfHwwfHx8MA%3D%3D",
    },
    {
      "id": 3,
      "name": "Bread",
      "description": "Whole grain bread loaf.",
      "price": 2.19,
      "imageUrl":
          "https://media.istockphoto.com/id/522566233/photo/toast-bread.jpg?s=612x612&w=0&k=20&c=Dk7k60QaB4fVik7OyO9LQGi_a_2vEAdKX7GBJDzqskw=",
    },
    {
      "id": 4,
      "name": "Eggs",
      "description": "A dozen organic eggs.",
      "price": 3.99,
      "imageUrl":
          "https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg",
    },
    {
      "id": 5,
      "name": "Banana",
      "description": "Ripe and sweet bananas.",
      "price": 1.29,
      "imageUrl":
          "https://media.istockphoto.com/id/172876004/photo/banana-wallpaper.jpg?s=612x612&w=0&k=20&c=DjUIq77Fh3ljde_WJNwYl17e86VxMUpOwYiVL2XJo9U=",
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
