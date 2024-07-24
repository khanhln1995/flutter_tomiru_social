import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/transaction_detail_screen.dart';

class CreateWithdrawalWidget extends StatefulWidget {
  const CreateWithdrawalWidget({super.key});

  @override
  _CreateWithdrawalWidgetState createState() => _CreateWithdrawalWidgetState();
}

class _CreateWithdrawalWidgetState extends State<CreateWithdrawalWidget> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transaction Information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Convert and withdraw Tomxu balance',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Amount of Tomxu to withdraw',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            cursorColor: theme.primaryColor,
            decoration: InputDecoration(
              labelText: 'Minimum 1000 Tomxu (rounded to nearest 100 Tomxu)',
              labelStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Bank Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: 'Choose a bank',
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
            ),
            items: ['Bank A', 'Bank B', 'Bank C']
                .map((bank) => DropdownMenuItem<String>(
                      value: bank,
                      child: Text(bank),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Account Number',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            cursorColor: theme.primaryColor,
            decoration: InputDecoration(
              labelText: 'Enter account number',
              labelStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Checkbox(
                value: _agreedToTerms,
                activeColor: theme.primaryColor,
                onChanged: (value) {
                  setState(() {
                    _agreedToTerms = value!;
                  });
                },
              ),
              const Text('I agree to the terms and conditions'),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _agreedToTerms
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransactionDetailScreen(),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Submit Withdrawal Request',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
