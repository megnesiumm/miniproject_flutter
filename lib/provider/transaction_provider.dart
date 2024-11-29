import 'package:flutter/foundation.dart';
import 'package:miniproject_flutter/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: 'ที่ตกแมวววว',quantityy:2 ,price: 500, date: DateTime.now()),
    Transaction(title: 'หนูปลอมคั๊บ',quantityy:3, price: 900, date: DateTime.now()),
  ];
  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.insert(0, statement);
    notifyListeners();
  }
  void removeTransaction(Transaction transaction) {
    transactions.remove(transaction);
    notifyListeners();
  }
}
