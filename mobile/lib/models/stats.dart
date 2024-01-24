class LVMHclientStats {
  LVMHclientStats({required this.purchases});

  final List<double> purchases;

  double get totalExpenses => purchases.isEmpty ? 0 :  purchases.fold(0, (a, b) => a + b);
  double get averageExpenses => purchases.isEmpty ? 0 :  totalExpenses / purchases.length;
  double get maxExpenses => purchases.isEmpty ? 0 :  purchases.fold(0, (a, b) => a > b ? a : b);
  double get minExpenses => purchases.isEmpty ? 0 : purchases.fold(double.infinity, (a, b) => a < b ? a : b);
}