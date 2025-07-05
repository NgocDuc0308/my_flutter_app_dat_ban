import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Payment extends StatefulWidget {
  final String imagePath;
  final String name;
  final String address;
  final String fullName;
  final String phone;
  final String email;
  final int quantity;
  final DateTime arriveTime;

  const Payment({
    super.key,
    required this.imagePath,
    required this.name,
    required this.address,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.quantity,
    required this.arriveTime,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> with SingleTickerProviderStateMixin {
  String numberPhone = '';
  String fullName = '';
  String email = '';
  DateTime arriveTime = DateTime.now();
  DateTime endTime = DateTime.now();
  int quantity = 0;

  bool _isExpanded = false;
  late final AnimationController _controller;
  late final Animation<double> _arrowAnimation;

  String? _selectedMethod;

  @override
  void initState() {
    super.initState();
    fullName = widget.fullName;
    numberPhone = widget.phone;
    email = widget.email;
    quantity = widget.quantity;
    arriveTime = widget.arriveTime;
    endTime = widget.arriveTime.add(const Duration(hours: 2));

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _arrowAnimation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _selectPaymentMethod(String method) {
    setState(() {
      _selectedMethod = method;
      _isExpanded = false;
      _controller.reverse();
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Đã chọn: $method')));
  }

  Widget _getPaymentMethodWidget() {
    Widget icon;
    String text;

    switch (_selectedMethod) {
      case 'Thanh toán bằng Momo':
        icon = Image.asset('assets/imgPayment/momo.png', width: 24, height: 24);
        text = 'Thanh toán bằng Momo';
        break;
      case 'Thanh toán bằng ngân hàng':
        icon = Image.asset('assets/imgPayment/ATM.png', width: 24, height: 24);
        text = 'Thanh toán bằng ngân hàng';
        break;
      case 'Thanh toán bằng thẻ tín dụng':
        icon = Image.asset(
          'assets/imgPayment/creditcard.png',
          width: 24,
          height: 24,
        );
        text = 'Thanh toán bằng thẻ tín dụng';
        break;
      case 'Thanh toán bằng ZaloPay':
        icon = Image.asset(
          'assets/imgPayment/zalopay.png',
          width: 24,
          height: 24,
        );
        text = 'Thanh toán bằng ZaloPay';
        break;
      default:
        icon = const Icon(Icons.payment, color: Colors.black);
        text = 'Chọn phương thức thanh toán';
    }

    return Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildOption(String text) {
    Widget icon;

    switch (text) {
      case 'Thanh toán bằng Momo':
        icon = Image.asset('assets/imgPayment/momo.png', width: 24, height: 24);
        break;
      case 'Thanh toán bằng ngân hàng':
        icon = Image.asset('assets/imgPayment/ATM.png', width: 24, height: 24);
        break;
      case 'Thanh toán bằng thẻ tín dụng':
        icon = Image.asset(
          'assets/imgPayment/creditcard.png',
          width: 24,
          height: 24,
        );
        break;
      case 'Thanh toán bằng ZaloPay':
        icon = Image.asset(
          'assets/imgPayment/zalopay.png',
          width: 24,
          height: 24,
        );
        break;
      case 'Thanh toán khi nhận bàn':
        icon = Image.asset('assets/imgPayment/COD.png', width: 24, height: 24);
        break;
      default:
        icon = const Icon(Icons.payment);
    }

    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: () => _selectPaymentMethod(text),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        elevation: 0,
        title: const Text(
          "Thông tin đặt bàn",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Lựa chọn của bạn",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.imagePath,
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
                        widget.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(widget.address),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 5, color: Colors.grey.shade200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Thời gian đến',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(arriveTime.toString()),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Thời gian kết thúc',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(endTime.toString()),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Người đặt bàn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sửa',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Số điện thoại:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  numberPhone,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Họ tên:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  fullName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Email:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  email,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(thickness: 5, color: Colors.grey.shade200),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Ưu đãi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
                ],
              ),
            ),
            Divider(thickness: 5, color: Colors.grey.shade200),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chi tiết thanh toán",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Số lượng người đặt bàn",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Số tiền", style: TextStyle(fontSize: 15)),
                    Text(
                      currencyFormat.format(quantity * 200000),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Divider(thickness: 5, color: Colors.grey.shade200),
            const Text(
              "Chính sách hủy bàn",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Khách hủy trước 1 ng sẽ được hoàn 50% phí",
              style: TextStyle(fontSize: 15),
            ),
            Divider(thickness: 5, color: Colors.grey.shade200),
            Column(
              children: [
                InkWell(
                  onTap: _toggleExpand,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _getPaymentMethodWidget(),
                        RotationTransition(
                          turns: _arrowAnimation,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_isExpanded)
                  Column(
                    children: [
                      _buildOption('Thanh toán bằng Momo'),
                      _buildOption('Thanh toán bằng ngân hàng'),
                      _buildOption('Thanh toán bằng thẻ tín dụng'),
                      _buildOption('Thanh toán bằng ZaloPay'),
                    ],
                  ),
              ],
            ),
            Divider(thickness: 5, color: Colors.grey.shade200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Tổng thanh toán"),
                    Text(
                      currencyFormat.format(quantity * 200000),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Đặt bàn',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
