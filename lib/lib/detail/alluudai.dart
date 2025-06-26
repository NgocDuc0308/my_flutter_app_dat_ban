// lib/detail/alluudai.dart
import 'package:flutter/material.dart';

class AllUuDaiPage extends StatelessWidget {
  const AllUuDaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> deals = [
      {
        'image': 'assets/imgUuDai/uudai1.jpg',
        'title': 'Combo ưu đãi 1',
        'expiry': '30/06/2025',
      },
      {
        'image': 'assets/imgUuDai/uudai2.webp',
        'title': 'Combo ưu đãi 2',
        'expiry': '12/07/2025',
      },
      {
        'image': 'assets/imgUuDai/uudai3.jpg',
        'title': 'Combo ưu đãi 3',
        'expiry': '29/09/2025',
      },
      {
        'image': 'assets/imgUuDai/uudai4.jpg',
        'title': 'Combo ưu đãi 4',
        'expiry': '16/08/2025',
      },
    ];

    return ListView.builder(
      itemCount: deals.length,
      itemBuilder: (context, index) {
        final deal = deals[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              deal['image']!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            deal['title']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Áp dụng đến: ${deal['expiry']}'),
        );
      },
    );
  }
}
