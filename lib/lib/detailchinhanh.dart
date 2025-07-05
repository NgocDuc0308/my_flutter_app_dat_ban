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
        'name': 'Chi nhánh Bến Thành',
        'address': '121 Lê Thánh Tôn, P. Bến Thành, Q.1, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh2.jpg',
        'name': 'Chi nhánh Phú Nhuận',
        'address': '124 Phan Xích Long, P.2, Q. Phú Nhuận, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh3.png',
        'name': 'Chi nhánh Tân Phú',
        'address': '245 Tân Sơn Nhì, P. Tân Sơn Nhì, Q. Tân Phú, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh4.png',
        'name': 'Chi nhánh Thủ Đức',
        'address': '56 Võ Văn Ngân, P. Linh Chiểu, TP. Thủ Đức, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh5.png',
        'name': 'Chi nhánh Gò Vấp',
        'address': '450 Quang Trung, P.10, Q. Gò Vấp, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh6.jpg',
        'name': 'Chi nhánh Tân Bình',
        'address': '62 Trường Chinh, P.12, Q. Tân Bình, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh7.jpg',
        'name': 'Chi nhánh Bình Thạnh',
        'address': '234 Xô Viết Nghệ Tĩnh, P.21, Q. Bình Thạnh, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh8.jpg',
        'name': 'Chi nhánh Quận 3',
        'address': '8 Nguyễn Thị Minh Khai, P. Đa Kao, Q.3, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh9.jpg',
        'name': 'Chi nhánh Quận 10',
        'address': '285 Cách Mạng Tháng 8, P.12, Q.10, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh10.jpg',
        'name': 'Chi nhánh Quận 7',
        'address': '100 Nguyễn Văn Linh, P. Tân Phong, Q.7, TP.HCM',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh11.jpg',
        'name': 'Chi nhánh Hà Đông',
        'address': '102 Trần Phú, Q. Hà Đông, Hà Nội',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh12.jpg',
        'name': 'Chi nhánh Cầu Giấy',
        'address': '165 Cầu Giấy, Q. Cầu Giấy, Hà Nội',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh13.webp',
        'name': 'Chi nhánh Hoàn Kiếm',
        'address': '2 Hàng Bài, Q. Hoàn Kiếm, Hà Nội',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh14.webp',
        'name': 'Chi nhánh Thanh Xuân',
        'address': '1 Nguyễn Trãi, Q. Thanh Xuân, Hà Nội',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh15.jpg',
        'name': 'Chi nhánh Long Biên',
        'address': '50 Nguyễn Văn Cừ, Q. Long Biên, Hà Nội',
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
