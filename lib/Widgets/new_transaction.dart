import 'dart:io';
import 'package:expense/Widgets/adaptive_button.dart';
import 'package:expense/Widgets/adaptive_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MakeNewTransaction extends StatefulWidget {
  MakeNewTransaction({this.addTx});
  final Function addTx;

  @override
  _MakeNewTransactionState createState() => _MakeNewTransactionState();
}

class _MakeNewTransactionState extends State<MakeNewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _pickedDate;

  void submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    String title = _titleController.text;
    double amount = double.parse(
        _amountController.text.isEmpty ? "0" : _amountController.text);
    if (amount <= 0 || title.isEmpty || _pickedDate == null) {
      return;
    }
    widget.addTx(title, amount, _pickedDate);
    Navigator.of(context).pop();
  }

  void _selectDate(BuildContext ctx) {
    showDatePicker(
            context: ctx,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _pickedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AdaptiveTextField(
                controllerEditingText: _titleController,
                placeholderEditingText: "Title",
                textInputType: TextInputType.text,
              ),
              !Platform.isIOS ? SizedBox(height: 20) : Container(),
              AdaptiveTextField(
                placeholderEditingText: "Amount",
                controllerEditingText: _amountController,
                textInputType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(_pickedDate == null
                        ? 'No Date Chosen!'
                        : 'Chosen Date: ${DateFormat.yMd().format(_pickedDate)}'),
                  ),
                  FlatButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              AdaptiveButton(
                title: "Add Transaction",
                submitData: submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
