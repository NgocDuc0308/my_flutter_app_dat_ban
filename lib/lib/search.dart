import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> branches = [
      {
        'image': 'assets/imgChiNhanh/chinhanh1.jpg',
        'name': 'Chi nhánh 1',
        'address': 'Số 11 Nguyễn Văn Quá, P. Đông Hưng Thuận, Q.12',
        'action': 'Đặt bàn giữ chỗ',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh2.jpg',
        'name': 'Chi nhánh 2',
        'address': 'Số 23 Chế Lan Viên, P. Tây Thạnh, Q. Tân Phú',
        'action': 'Đặt bàn giữ chỗ',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh3.png',
        'name': 'Chi nhánh 3',
        'address': 'Số 62 Hoàng Văn Thụ, P. Đông Hưng Thuận, Q.3',
        'action': 'Đặt bàn giữ chỗ',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh4.png',
        'name': 'Chi nhánh 4',
        'address': 'Số 38 Lý Tự Trọng, P. Đông Hưng Thuận, Q.10',
        'action': 'Đặt bàn giữ chỗ',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh5.png',
        'name': 'Chi nhánh 5',
        'address': 'Số 42 Quang Trung, P. Đông Hưng Thuận, Q.Tân Phú',
        'action': 'Đặt bàn giữ chỗ',
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6E0000), Color(0xFFFF2323)],
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'TP. Hồ Chí Minh',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Bạn muốn đặt chỗ ở đâu',
                      prefixIcon: const Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'TỪ KHÓA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Wrap(
            spacing: 16,
            runSpacing: 10,
            children: List.generate(8, (index) => _buildKeywordBox(index + 1)),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(
              16.0,
              10,
              16.0,
              0,
            ), // giảm padding dưới
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'GỢI Ý',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 4), // giãn nhẹ
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 12),
              itemCount: branches.length,
              itemBuilder: (context, index) {
                final branch = branches[index];
                return _buildBranchItem(
                  context,
                  branch['image']!,
                  branch['name']!,
                  branch['address']!,
                  branch['action']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeywordBox(int districtNumber) {
    return InkWell(
      onTap: () {
        debugPrint('Đã chọn Quận $districtNumber');
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black38)),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              'Quận $districtNumber',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBranchItem(
    BuildContext context,
    String imagePath,
    String name,
    String address,
    String actionText,
  ) {
    return InkWell(
      onTap: () {
        // TODO: hành động khi nhấn vào chi nhánh
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
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
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(address, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(actionText, style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
