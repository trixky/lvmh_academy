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
          // type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue: () {
            // Handle 'Next' button press
            if (_currentStep < 2) {
              setState(() {
                _currentStep++;
              });
            } else {
              // Handle submission, for example, by calling a function
              _submitForm();
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--;
              });
            }
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
              controller: _firstNameController,
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
    ];
  }

  void _submitForm() {
    // Handle registration logic here
    print('First Name: ${_firstNameController.text}');
    print('Last Name: ${_lastNameController.text}');
    print('Email: ${_emailController.text}');
    // Reset the form
    _resetForm();
  }

  void _resetForm() {
    setState(() {
      // _currentStep = 0;
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
    });
  }
}
