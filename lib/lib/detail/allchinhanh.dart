import 'package:app_dat_ban/lib/detailchinhanh.dart';
import 'package:flutter/material.dart';
import 'package:app_dat_ban/lib/detail/alluudai.dart';

class AllChiNhanhPage extends StatefulWidget {
  const AllChiNhanhPage({super.key});

  @override
  State<AllChiNhanhPage> createState() => _AllChiNhanhPageState();
}

class _AllChiNhanhPageState extends State<AllChiNhanhPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildTab(String label, int index) {
    final bool isSelected = _tabController.index == index;
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.red : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.red : Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text('Xem tất cả', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6E0000), Color(0xFFFF2323)],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => _tabController.animateTo(0),
                  child: buildTab('Nhà hàng', 0),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => _tabController.animateTo(1),
                  child: buildTab('Ưu đãi', 1),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: branches.length,
            itemBuilder: (context, index) {
              final branch = branches[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          branch['image']!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              branch['name']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              branch['address']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Đặt bàn giữ chỗ',
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const AllUuDaiPage(),
        ],
      ),
    );
  }
}
