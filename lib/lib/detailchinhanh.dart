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
        'name': 'Chi nhánh 1',
        'address': 'Số 11 Nguyễn Văn Quá, P. Đông Hưng Thuận, Q.12',
        'image': 'assets/imgChiNhanh/chinhanh1.jpg',
      },
      {
        'name': 'Chi nhánh 2',
        'address': 'Số 23 Chế Lan Viên, P. Tây Thạnh, Q. Tân Phú',
        'image': 'assets/imgChiNhanh/chinhanh2.jpg',
      },
      {
        'name': 'Chi nhánh 3',
        'address': 'Số 62 Hoàng Văn Thụ, P. Đông Hưng Thuận, Q.12',
        'image': 'assets/imgChiNhanh/chinhanh3.png',
      },
      {
        'name': 'Chi nhánh 4',
        'address': 'Số 19 Quang Trung, P. Tây Thạnh, Q.10',
        'image': 'assets/imgChiNhanh/chinhanh4.png',
      },
      {
        'name': 'Chi nhánh 5',
        'address': 'Số 55 Lý Thái Tổ, P. Tây Thạnh, Q.3',
        'image': 'assets/imgChiNhanh/chinhanh5.png',
      },
      {
        'name': 'Chi nhánh 6',
        'address': 'Số 88 Phạm Văn Đồng, P. Hiệp Bình Chánh, Q.Thủ Đức',
        'image': 'assets/imgChiNhanh/chinhanh6.jpg',
      },
      {
        'name': 'Chi nhánh 7',
        'address': 'Số 77 Nguyễn Oanh, P.10, Q.Gò Vấp',
        'image': 'assets/imgChiNhanh/chinhanh7.jpg',
      },
      {
        'name': 'Chi nhánh 8',
        'address': 'Số 35 Nguyễn Thái Bình, Q.1',
        'image': 'assets/imgChiNhanh/chinhanh8.jpeg',
      },
      {
        'name': 'Chi nhánh 9',
        'address': 'Số 60 Trường Chinh, P.Tân Thới Nhất, Q.12',
        'image': 'assets/imgChiNhanh/chinhanh9.jpg',
      },
      {
        'name': 'Chi nhánh 10',
        'address': 'Số 45 Lê Văn Việt, P.Hiệp Phú, Q.9',
        'image': 'assets/imgChiNhanh/chinhanh10.jpg',
      },
      {
        'name': 'Chi nhánh 11',
        'address': 'Số 32 Nguyễn Thị Thập, Q.7',
        'image': 'assets/imgChiNhanh/chinhanh11.jpg',
      },
      {
        'name': 'Chi nhánh 12',
        'address': 'Số 81 Âu Cơ, Q.Tân Bình',
        'image': 'assets/imgChiNhanh/chinhanh12.jpg',
      },
      {
        'name': 'Chi nhánh 13',
        'address': 'Số 22 Dương Bá Trạc, Q.8',
        'image': 'assets/imgChiNhanh/chinhanh13.webp',
      },
      {
        'name': 'Chi nhánh 14',
        'address': 'Số 10 Nguyễn Tri Phương, Q.5',
        'image': 'assets/imgChiNhanh/chinhanh14.webp',
      },
      {
        'name': 'Chi nhánh 15',
        'address': 'Số 100 Nguyễn Thị Minh Khai, Q.3',
        'image': 'assets/imgChiNhanh/chinhanh15.jpg',
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
