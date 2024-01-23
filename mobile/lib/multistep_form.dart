import 'package:flutter/material.dart';

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStateFormState();
}

class _MultiStateFormState extends State<MultiStepForm> {
  int _currentStep = 0;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Client Registration'),
      ),
      body: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue: () {
            final isLastStep = _currentStep == getSteps().length - 1;
            if (isLastStep) {
              _submitForm();
            } else {
              setState(() {
                _currentStep++;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--;
              });
            }
          },
          controlsBuilder: (context, details) {
            return _currentStep == getSteps().length - 1
                ? _buildLastStepControls(details)
                : _buildDefaultControls(details);
          },
          steps: getSteps()),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        title: const Text('Name'),
        content: Column(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      Step(
        title: const Text('Email'),
        content: TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
      Step(
        title: const Text('Confirmation'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create an account and generate a QR Code ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ];
  }

  void _submitForm() {
    // Handle registration logic here
    print('First Name: ${_firstNameController.text}');
    print('Last Name: ${_lastNameController.text}');
    print('Email: ${_emailController.text}');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Client QR Code'),
          content: Text('QRCode will be displayed here'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildDefaultControls(details) {
  return Row(
    children: [
      ElevatedButton(
        onPressed: details.onStepContinue,
        child: Text('Next'),
      ),
      SizedBox(width: 16.0),
      TextButton(
        onPressed: details.onStepCancel,
        child: Text('Back'),
      ),
    ],
  );
}

Widget _buildLastStepControls(details) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: details.onStepContinue,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            ),
            child: Text('Confirm', style: TextStyle(fontSize: 16.0)),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: details.onStepCancel,
            child: Text('Back'),
          ),
        ),
      ],
    ),
  );
}
