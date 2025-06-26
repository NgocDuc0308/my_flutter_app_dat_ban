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
