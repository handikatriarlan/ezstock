import 'package:ezstock/pages/add_inventory_page.dart';
import 'package:ezstock/pages/detail_inventory_page.dart';
import 'package:flutter/material.dart';

class ListInventoryPage extends StatefulWidget {
  const ListInventoryPage({super.key});

  @override
  State<ListInventoryPage> createState() => _ListInventoryPageState();
}

class _ListInventoryPageState extends State<ListInventoryPage> {
  String _searchQuery = '';
  final List<Map<String, dynamic>> _dummyData = [
    {
      'id': '1',
      'title': 'Item 1',
      'quantity': 10,
      'price': 10000,
      'imageUrl':
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2024/3/21/34e2aca4-19cc-4d43-ba91-f774d953035d.jpg'
    },
    {
      'id': '2',
      'title': 'Item 2',
      'quantity': 5,
      'price': 20000,
      'imageUrl':
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2024/3/21/34e2aca4-19cc-4d43-ba91-f774d953035d.jpg'
    },
    {
      'id': '3',
      'title': 'Item 3',
      'quantity': 15,
      'price': 15000,
      'imageUrl':
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2024/3/21/34e2aca4-19cc-4d43-ba91-f774d953035d.jpg'
    },
  ];

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  List<Map<String, dynamic>> _filterInventory(
      List<Map<String, dynamic>> inventory) {
    if (_searchQuery.isEmpty) {
      return inventory;
    }
    return inventory
        .where((item) =>
            item['title'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  Widget _buildInventoryList(List<Map<String, dynamic>> inventory) {
    final filteredInventory = _filterInventory(inventory);
    if (filteredInventory.isEmpty) {
      return _buildEmpty();
    } else {
      return ListView.builder(
        itemCount: filteredInventory.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    filteredInventory[index]['imageUrl'] ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: Colors.grey,
                        size: 48,
                      );
                    },
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filteredInventory[index]['title']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("ID: ${filteredInventory[index]['id']}"),
                    const SizedBox(height: 10),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stock: ${filteredInventory[index]['quantity']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Price: ${filteredInventory[index]['price']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailInventoryPage(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    }
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.inbox, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'No data found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddInventoryPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('List Inventory'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: _updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _buildInventoryList(_dummyData),
    );
  }
}
