import '../../../../utils/constants/path_provider.dart';
import '../../model/order_model.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmount = <OrderStatus, double>{}.obs;

  List<OrderModel> orders = [
    OrderModel(
        id: 'CWT0012',
        status: OrderStatus.processing,
        totalAmount: 265,
        orderDate: DateTime(2025, 2, 26),
        deliveryDate: DateTime(2024, 5, 20)), // OrderModel
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime(2025, 2, 24),
      deliveryDate: DateTime(2024, 5, 21),
    ), // OrderModel
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 254,
      orderDate: DateTime(2025, 2, 25),
      deliveryDate: DateTime(2024, 15, 22),
    ), // OrderModel
    OrderModel(
      id: 'CWT0265',
      status: OrderStatus.delivered,
      totalAmount: 345,
      orderDate: DateTime(2025, 2, 28),
      deliveryDate: DateTime(2025, 2, 28),
    ), // OrderModel
    OrderModel(
      id: 'CWT1536',
      status: OrderStatus.delivered,
      totalAmount: 115,
      orderDate: DateTime(2025, 3, 2),
      deliveryDate: DateTime(2024, 5, 24),
    ),
    OrderModel(
        id: 'CWT0112',
        status: OrderStatus.processing,
        totalAmount: 265,
        orderDate: DateTime(2025, 3, 3),
        deliveryDate: DateTime(2024, 3, 20)),
    OrderModel(
        id: 'CWT0012',
        status: OrderStatus.processing,
        totalAmount: 265,
        orderDate: DateTime(2025, 2, 26),
        deliveryDate: DateTime(2024, 5, 20)), // OrderModel
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime(2025, 2, 24),
      deliveryDate: DateTime(2024, 5, 21),
    ), // OrderModel
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 254,
      orderDate: DateTime(2025, 2, 25),
      deliveryDate: DateTime(2024, 15, 22),
    ), // OrderModel
    OrderModel(
      id: 'CWT0265',
      status: OrderStatus.delivered,
      totalAmount: 345,
      orderDate: DateTime(2025, 2, 28),
      deliveryDate: DateTime(2025, 2, 28),
    ), // OrderModel
    OrderModel(
      id: 'CWT1536',
      status: OrderStatus.delivered,
      totalAmount: 115,
      orderDate: DateTime(2025, 3, 2),
      deliveryDate: DateTime(2024, 5, 24),
    ),
    OrderModel(
        id: 'CWT0112',
        status: OrderStatus.processing,
        totalAmount: 265,
        orderDate: DateTime(2025, 3, 11),
        deliveryDate: DateTime(2024, 3, 20)),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime(2025, 3, 12),
      deliveryDate: DateTime(2024, 3, 21),
    ), // OrderModel
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 254,
      orderDate: DateTime(
        2025,
        3,
        5,
      ),
      deliveryDate: DateTime(2024, 3, 22),
    ), // OrderModel
    OrderModel(
      id: 'CWT0265',
      status: OrderStatus.delivered,
      totalAmount: 345,
      orderDate: DateTime(2025, 3, 13),
      deliveryDate: DateTime(2025, 3, 28),
    ), // OrderModel
    OrderModel(
      id: 'CWT1536',
      status: OrderStatus.delivered,
      totalAmount: 115,
      orderDate: DateTime(2025, 3, 14),
      deliveryDate: DateTime(2024, 5, 24),
    ), // OrderModel
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    _calculateWeeklySales();
    _calculateOrderStatusData();
    super.onInit();
  }

  void _calculateWeeklySales() {
    // Reset weekly sales to zero
    weeklySales.value = List<double>.filled(7, 0.0);
    print('Weekly Sales1 $weeklySales');

    for (var order in orders) {
      final DateTime orderWeekStart =
          THelperFunctions.getStartOfWeek(order.orderDate);

      /// check if order is within the current week
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;

        /// ensure the index is non- negative
        weeklySales[index] += order.totalAmount;

        print(
            ' Order date: ${order.orderDate} - CurrentWeekDay: $orderWeekStart, index: $index ');
      }
    }
    print('Weekly Sales2 $weeklySales');
  }

  void _calculateOrderStatusData() {
    orderStatusData.clear();

    totalAmount.value = {for (var status in OrderStatus.values) status: 0.0};

    for (var order in orders) {
      final status = order.status;

      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;

      totalAmount[status] = (totalAmount[status] ?? 0) + order.totalAmount;
    }
  }

  String getDisplayStatusName(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }
}
