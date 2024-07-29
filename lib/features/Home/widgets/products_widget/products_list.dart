import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Home/widgets/products_widget/product_item.dart';

class HorizontalProductListScreen extends StatelessWidget {
  final bool isShoppingSale;
  HorizontalProductListScreen({super.key, this.isShoppingSale = false});
  final List<Map<String, dynamic>> products = [
    {
      "image":
          "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg",
      "product_name": 'Nước lau sàn Sunlight',
      "price": 100000,
      "sale": 12,
      "address": "Tô Hiệu, Hà Đông, Hà Nội"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAajh75K4_fhc3FTBqna0WQmL2BqBvA9vaBA&s",
      "product_name": 'Nước lau sàn Sunlight',
      "price": 150000,
      "sale": 0,
      "address": "Tô Hiệu, Hà Đông, Hà Nội"
    },
    {
      "image":
          "https://st2.depositphotos.com/2001755/8564/i/450/depositphotos_85647140-stock-photo-beautiful-landscape-with-birds.jpg",
      "product_name": 'Nước lau sàn Sunlight',
      "price": 80000,
      "sale": 0,
      "address": "Tô Hiệu, Hà Đông, Hà Nội"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final filterProduct = isShoppingSale ? products.where((e)=>e['sale'] > 0).toList() : products; 
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      height: 200,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 12.0),
          scrollDirection: Axis.horizontal,
          itemCount: filterProduct.length,
          itemBuilder: (context, index) {
            return ProductItem(
              image: filterProduct[index]['image'],
              product_name: filterProduct[index]['product_name'],
              price: filterProduct[index]['price'],
              sale: filterProduct[index]['sale'],
              address: filterProduct[index]['address'],
            );
          }),
    );
  }
}
