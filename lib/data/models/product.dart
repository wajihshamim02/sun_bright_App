import 'package:flutter/material.dart';

class Product {
  late final int id;
  late final String title;
  late final Map<String, String> description;
  late final String image;
  late final List<String> images;
  // late final List<Map<String, dynamic>> colors;
  late final double rating;
  late final double price;
  late final String category;
  late bool isFavourite, isPopular;
  // late DateTime createdAt;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    // required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.price,
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'images': images,
      'category': category,
      // 'colors': colors,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
    };
  }

  Product.fromMap(dynamic map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    image = map['image'];
    category = map['category'];
    images = map['images'];
    // colors = map['colors'];
    rating = map['rating'];
    price = map['price'];
    isFavourite = map['isFavourite'];
    isPopular = map['isPopular'];
  }
  Product toEntity() => Product(
        id: id,
        title: title,
        description: description,
        image: image,
        images: images,
        category: category,
        // colors: colors,
        rating: rating,
        price: price,
        isFavourite: isFavourite,
        isPopular: isPopular,
      );
}

// Demo data
List<Product> demoProducts = [
  Product(
    id: 1,
    image: "assets/images/paint_1.png",
    images: [
      "assets/images/PastelPeach_room_1.png",
      "assets/images/Pastel_Peach_1.png",
      "assets/images/Pastel_Peach_2.jfif",
    ],
    category: "Interior",
    // colors: [
    //   {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
    //   {"colorName": "Purple", "color": const Color(0xFF836DB8)},
    //   {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
    // ],
    title: "Royal Matt Emulsion",
    price: 64.99,
    description: {
      "headline": "Intensify your wall with Royal Matt Emulsion",
      "description": description
    },
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    image: "assets/images/paint_2.jpeg",
    images: [
      "assets/images/PastelPeach_room_1.png",
      "assets/images/Pastel_Peach_1.png",
    ],
    category: "Interior",
    // colors: [
    //   {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
    //   {"colorName": "Purple", "color": const Color(0xFF836DB8)},
    //   {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
    //   {"colorName": "Red", "color": const Color(0xE7FF0D29)}
    // ],
    title: "Royal Pearl Emulsion",
    price: 50.5,
    description: {
      "headline": "Intensify your wall with Royal Pearl Emulsion",
      "description": description
    },
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    image: "assets/images/paint_4.png",
    images: [
      "assets/images/PastelPeach_room_1.png",
    ],
    category: "Interior",
    // colors: [
    //   {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
    //   {"colorName": "Purple", "color": const Color(0xFF836DB8)},
    //   {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
    //   {"colorName": "Red", "color": const Color(0xE7FF0D29)}
    // ],
    title: "Luxary Plastic Emulsion",
    price: 20.20,
    description: {
      "headline": "Intensify your wall with Luxary Plastic Emulsion",
      "description": description
    },
    rating: 4.1,
    isFavourite: false,
  ),
  Product(
    id: 4,
    image: "assets/images/paint_4.png",
    images: [
      "assets/images/PastelPeach_room_1.png",
      "assets/images/Pastel_Peach_1.png",
      "assets/images/Pastel_Peach_2.jfif",
    ],
    category: "Interior",
    // colors: [
    //   {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
    //   {"colorName": "Purple", "color": const Color(0xFF836DB8)},
    //   {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
    //   {"colorName": "Red", "color": const Color(0xE7FF0D29)}
    // ],
    title: "Super Emulsion",
    price: 20.20,
    description: {
      "headline": "Intensify your wall with Super Emulsion",
      "description": description
    },
    rating: 4.1,
    isFavourite: false,
  ),
  Product(
    id: 5,
    image: "assets/images/paint_5.png",
    images: [
      "assets/images/PastelPeach_room_1.png",
      "assets/images/Pastel_Peach_1.png",
      "assets/images/Pastel_Peach_2.jfif",
    ],
    category: "Interior",
    // colors: [
    //   {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
    //   {"colorName": "Purple", "color": const Color(0xFF836DB8)},
    //   {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
    //   {"colorName": "Red", "color": const Color(0xE7FF0D29)},
    //   {"colorName": "Yellow", "color": const Color(0xE7FFD70D)}
    // ],
    title: "Texture Finish",
    price: 36.55,
    description: {
      "headline": "Intensify your wall with Texture Finish",
      "description": description
    },
    rating: 4.4,
    isFavourite: true,
    isPopular: true,
  ),
];

const String description =
    "Due to its high performance, it can be used on concrete substrates where abrasion resistance and concrete adhesion are essential …";
