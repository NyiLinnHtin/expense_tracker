import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/widgets/expenses/expenses_list.dart';
import 'package:flutter/material.dart';
import 'new_expense.dart';
import '../blueprint/expense_data.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseData> _registeredExpense = [
    ExpenseData(
      title: "Test1",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseData(
      title: "Test2",
      amount: 5.99,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpense(addExpenses: _addExpenses),
    );
  }

  void _addExpenses(ExpenseData expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpenses(ExpenseData expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text("Expense is Deleted!"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expense is found. Try Adding some new"),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = Expanded(
        child: ExpensesList(
            expenses: _registeredExpense, removeExpense: _removeExpenses),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Flutter ExpenseTracker!"), actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon: const Icon(Icons.add),
        ),
      ]),
      body: Column(
        children: [
          const Text("My Expenses"),
          mainContent,
        ],
      ),
    );
  }
}
