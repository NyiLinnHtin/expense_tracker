import 'package:expense_tracker/blueprint/expense_data.dart';
import 'package:expense_tracker/widgets/expenses/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final List<ExpenseData> expenses;
  final Function(ExpenseData expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        child: ExpensesItem(expenses: expenses[index]),
      ),
    );
  }
}
