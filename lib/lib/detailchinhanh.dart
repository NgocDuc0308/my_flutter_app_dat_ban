import 'package:flutter/material.dart';
import 'order.dart';

class DetailChiNhanhPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String address;

  const DetailChiNhanhPage({
    super.key,
    required this.imagePath,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                imagePath,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              const Positioned(
                top: 40,
                right: 60,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border),
                ),
              ),
              const Positioned(
                top: 40,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.share),
                ),
              ),
            ],
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                address,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(width: 4),
                            Text('Đặt cọc: 200.000 VND'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Gradient Button
                        SizedBox(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderPage(
                                    imagePath: imagePath,
                                    name: name,
                                    address: address,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF6E0000),
                                    Color(0xFFFF2323),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Đặt ngay',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Các chi nhánh liên quan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: _buildRelatedBranches(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRelatedBranches(BuildContext context) {
    final List<Map<String, String>> branches = [
      {
        'image': 'assets/imgChiNhanh/chinhanh1.jpg',
        'name': 'Chi nhánh 1',
        'address': 'Số 11 Nguyễn Văn Quá, P. Đông Hưng Thuận, Q.12',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh2.jpg',
        'name': 'Chi nhánh 2',
        'address': 'Số 23 Chế Lan Viên, P. Tây Thạnh, Q. Tân Phú',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh3.png',
        'name': 'Chi nhánh 3',
        'address': 'Số 62 Hoàng Văn Thụ, P. Đông Hưng Thuận, Q.3',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh4.png',
        'name': 'Chi nhánh 4',
        'address': 'Số 38 Lý Tự Trọng, P. Đông Hưng Thuận, Q.10',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh5.png',
        'name': 'Chi nhánh 5',
        'address': 'Số 42 Quang Trung, P. Đông Hưng Thuận, Q.Tân Phú',
      },
    ];

    final relatedBranches = branches.where((branch) {
      return branch['image'] != imagePath;
    }).toList();

    return relatedBranches.map((branch) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DetailChiNhanhPage(
                  imagePath: branch['image']!,
                  name: branch['name']!,
                  address: branch['address']!,
                ),
              ),
            );
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  branch['image']!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      branch['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      branch['address']!,
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Đặt bàn giữ chỗ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
