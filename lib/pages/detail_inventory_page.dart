import 'package:ezstock/pages/edit_inventory_page.dart';
import 'package:flutter/material.dart';

class DetailInventoryPage extends StatelessWidget {
  final Map<String, dynamic> inventory = {
    'id': '1',
    'title': 'Item 1',
    'description': 'This is a description of Item 1.',
    'quantity': 10,
    'price': 10000,
    'imageUrl':
        'https://images.tokopedia.net/img/cache/700/VqbcmM/2024/3/21/34e2aca4-19cc-4d43-ba91-f774d953035d.jpg'
  };

  DetailInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Details'),
        actions: [
          IconButton(
            onPressed: () {
              // Handle delete inventory
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditInventoryPage(),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              inventory['title'] ?? 'No Title',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Description: ${inventory['description'] ?? 'No Description'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: ${inventory['price']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Quantity: ${inventory['quantity']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  inventory['imageUrl'] ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text('Image not found'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
