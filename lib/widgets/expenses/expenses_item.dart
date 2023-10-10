import 'package:expense_tracker/blueprint/expense_data.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expenses});

  final ExpenseData expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expenses.title),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text("\$${expenses.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenses.category]),
                    const SizedBox(width: 8),
                    Text(expenses.formattedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
