import 'package:flutter/material.dart';
import 'transaction_item.dart';
import '../DataClasses/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList({@required this.transactions, @required this.deleteTx});
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: constraints.maxHeight * 0.2,
                  child: Text(
                    'No List Found',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.75,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/Image/waiting.png',
                    fit: BoxFit.scaleDown,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionItem(
                transactions: transactions[index],
                deleteTx: deleteTx,
                key: ValueKey(transactions[index].id),
              );
            },
          );
  }
}
