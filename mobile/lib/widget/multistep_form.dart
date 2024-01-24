import 'package:flutter/material.dart';
import 'package:mobile/models/client.dart';
import 'package:mobile/widget/qr_code_generator.dart';
import 'package:uuid/uuid.dart';

final buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
);

class MultiStepForm extends StatefulWidget {
  const MultiStepForm(
      {super.key, required this.addClient, required this.focusClient});

  final void Function(LVMHclient client) addClient;
  final void Function(LVMHclient client) focusClient;

  @override
  State<MultiStepForm> createState() => _MultiStateFormState();
}

class _MultiStateFormState extends State<MultiStepForm> {
  int _currentStep = 0;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final uuidGenerator = Uuid();

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
        title: const Text('Nom'),
        content: Column(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'Prénom',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
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
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
      const Step(
        title: Text('Confirmation'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Créer un compte et générer un QR code',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ];
  }

  String _generateURL(String firstname, lastname, email, phone) {
    const baseUrl = "https://lvmh.trixky.com:5173";
    String url = "$baseUrl?firstname=$firstname&lastname=$lastname";

    if (email != null && email.isNotEmpty) {
      url += "&email=$email";
    }
    if (phone != null && phone.isNotEmpty) {
      url += "&phone=$phone";
    }

    return url;
  }

  void _submitForm() {
    const defaultValue = "Default";

    final newClient = LVMHclient(
      id: uuidGenerator.v4(),
      firstname: _firstNameController.text.isNotEmpty
          ? _firstNameController.text
          : defaultValue,
      lastname: _lastNameController.text.isNotEmpty
          ? _lastNameController.text
          : defaultValue,
      email: _emailController.text,
    );

    widget.addClient(newClient);
    widget.focusClient(newClient);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Client enregistré'),
          content: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 200,
              child: QRcodeGenerator(url: newClient.passUrl),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Close the dialog
              },
              child:
                  const Text('Fermer', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildDefaultControls(details) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      children: [
        ElevatedButton(
          onPressed: details.onStepContinue,
          style: buttonStyle,
          child: const Text('Suivant'),
        ),
        const SizedBox(width: 16.0),
        TextButton(
          onPressed: details.onStepCancel,
          style: buttonStyle,
          child: const Text('Retour'),
        ),
      ],
    ),
  );
}

Widget _buildLastStepControls(details) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: details.onStepContinue,
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: const Text('Confirmer', style: TextStyle(fontSize: 16.0)),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: details.onStepCancel,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: const Text('Retour'),
          ),
        ),
      ],
    ),
  );
}
