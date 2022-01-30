import 'package:cards/digital_card.dart';
import 'package:flutter/material.dart';

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {

  final _formKey = GlobalKey<FormState>();
  CardType? _cardType = CardType.Credit;
  PaymentCompany? _paymentCompany = PaymentCompany.MasterCard;
  bool? _supportsNfc = true;

  bool _showCVV = false;
  bool _showPIN = false;

  Widget textField({
    String initialValue = "",
    String labelText = "",
    TextInputType keyboardType = TextInputType.name,
    bool obscureText = false,
    bool isRequired = false,

  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType, // Use email input type for emails.
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          labelText: labelText,
          helperText: isRequired ? "required": null,
          suffixIcon: obscureText ? IconButton(
            icon: Icon(
              Icons.visibility,
            ),
            onPressed: (){},
          ) : null,
        ),
        obscureText: obscureText,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text("Add Card"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () { },
            child: Text('Save'),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        child: Form(
          key: _formKey,
          child: Container(
            child: ListView(
              children: [
                textField(
                  initialValue: "",
                  labelText: "Card Name",
                  keyboardType: TextInputType.name,
                  isRequired: false
                ),
                textField(
                    initialValue: "",
                    labelText: "Card Number",
                    keyboardType: TextInputType.number,
                    isRequired: false
                ),
                textField(
                    initialValue: "",
                    labelText: "Expiry Date",
                    keyboardType: TextInputType.datetime,
                    isRequired: false
                ),
                textField(
                    initialValue: "",
                    labelText: "Card Holder's Name",
                    keyboardType: TextInputType.name,
                    isRequired: false
                ),
                textField(
                    initialValue: "",
                    labelText: "Bank Name",
                    keyboardType: TextInputType.name,
                    isRequired: false
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.05),
                    ),
                    value: _paymentCompany,
                    items: PaymentCompany.values.map((value) {
                      return DropdownMenuItem(
                        child: Text(value.string),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: DropdownButtonFormField(
                    // itemHeight: 50.0,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.05),
                    ),
                    value: _cardType,
                    items: CardType.values.map((CardType value) {
                      return DropdownMenuItem<CardType>(
                        child: Text(value.string),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  color: Colors.black.withOpacity(0.05),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: const Text("Supports NFC"),
                        value: _supportsNfc,
                        onChanged: (value) {
                          setState(() {
                            _supportsNfc = value;
                          });
                        },
                      ),
                      Divider(
                        height: 1.0,
                        thickness: 2.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                textField(
                    initialValue: "",
                    labelText: "CVV/CVC",
                    keyboardType: TextInputType.number,
                    isRequired: false,
                  obscureText: true,
                ),
                textField(
                    initialValue: "",
                    labelText: "PIN",
                    keyboardType: TextInputType.number,
                    isRequired: false,
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
