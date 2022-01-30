import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cards/payment_company.dart';
import 'package:path_provider/path_provider.dart';

enum CardType { Credit, Debit, PrePaid }
extension CardTypeName on CardType {
  String get name => describeEnum(this);
  String get string {
    switch(this) {
      case CardType.Credit:
        return "Credit";
      case CardType.Debit:
        return "Debit";
      case CardType.PrePaid:
        return "PrePaid";
    }
  }
}

enum PaymentCompany { AmericanExpress, Cirrus, DinersClub, Maestro, MasterCard, RuPay, Visa }
extension PaymentCompanyName on PaymentCompany {
  String get name => describeEnum(this);
  String get string {
    switch(this) {
      case PaymentCompany.AmericanExpress:
        return "American Express";
      case PaymentCompany.Cirrus:
        return "Cirrus";
      case PaymentCompany.DinersClub:
        return "DinersClub";
      case PaymentCompany.Maestro:
        return "Maestro";
      case PaymentCompany.MasterCard:
        return "MasterCard";
      case PaymentCompany.RuPay:
        return "RuPay";
      case PaymentCompany.Visa:
        return "Visa";
    }
  }
  Widget get logo {
    return Icon(
      Icons.warning_rounded,
      color: Colors.white,
      size: 36,
    );
  }
}

class DigitalCard {
  var id;
  var name;
  var number;
  var expiryDate;
  var holderName;
  var bankName;
  var paymentCompany;
  var type;
  var supportsNfc;

  var pin;
  var cvv;

  var dueDate;

  // var remindDueDate;
  // var remindExpiryDate;

  Color bgColor;
  var bgPattern;

  DigitalCard({
        this.name,
        this.number,
        this.expiryDate,
        this.holderName,
        this.bankName,
        this.type = CardType.Credit,
        this.paymentCompany = PaymentCompany.MasterCard,
        this.supportsNfc,
        this.cvv,
        this.pin,
        this.bgColor = Colors.black87
      }) {
    id = UniqueKey().toString();
  }

  fromJson(Map json) {
    id = json["id"];
    name = json["nm"];
    number = json["nb"];
    expiryDate = json["ex"];
    holderName = json["hn"];
    bankName = json["bk"];
    type = json["ty"];
    paymentCompany = json["py"];
    supportsNfc = json["sn"];
    cvv = json["cv"];
    pin = json["pn"];
    bgColor = json["bg"];
  }

  Map toJson() {
    var map = {
      "id": id,
      "nm": name,
      "nb": number,
      "ex": expiryDate,
      "hn": holderName,
      "bk": bankName,
      "ty": type,
      "py": paymentCompany,
      "sn": supportsNfc,
      "cv": cvv,
      "pn": pin,
      "bg": bgColor
    };
    return map;
  }

  void save() async {
    final file = File('${(await getApplicationDocumentsDirectory()).path}/$number.json');
    file.writeAsString(json.encode(toJson()));
    // DigitalCard.fromJson(file.readAsString());
    print("CARD_FILE_PATH: ${file.path}");
  }

  String formattedExpiryDate() {
    if (expiryDate != null) {
      var year = expiryDate.year%1000;
      var yearStr = year.toString();
      var month = expiryDate.month;
      var monthStr = month.toString();
      if (month < 10) {
        monthStr = "0$monthStr";
      }
      return "$monthStr/$yearStr";
    }
    return "XX/XX";
  }

  String formattedCardNumber() {
    if (number != null) {
      var numbers = number.split('');
      var formattedNumber = [];
      for (int i=1; i<numbers.length+1; i++) {
        formattedNumber.add(numbers[i-1]);
        if (i%4 == 0 && i<numbers.length) {
          formattedNumber.add('  ');
        }
      }
      return formattedNumber.join();
    }
    return "XXXX XXXX XXXX XXXX";
  }

  String formattedCardType() {
    switch (type) {
      case CardType.Credit: {
        return "Credit";
      }
      break;
      case CardType.Debit: {
        return "Debit";
      }
      break;
      case CardType.PrePaid: {
        return "PrePaid";
      }
      break;

    }
    return "XXX";
  }

  Widget paymentCompanyLogo() {
    switch (paymentCompany) {
      case PaymentCompany.AmericanExpress: {
        return Image.asset(
          "assets/logos/amex/amex_2.png",
          height: 40.0,
          // width: 54.0,
        );
      }
      break;
      case PaymentCompany.Cirrus: {
        return Image.asset(
          "assets/logos/cirrus/cirrus_2.png",
          height: 40.0,
          // width: 54.0,
        );
      }
      break;
      case PaymentCompany.DinersClub: {
        return Image.asset(
          "assets/logos/dci/dci_1.jpg",
          height: 40.0,
          // width: 54.0,
        );
      }
      break;
      case PaymentCompany.Maestro: {
        return Image.asset(
          "assets/logos/maestro/maestro_2.png",
          height: 40.0,
          // width: 54.0,
        );
      }
      break;
      case PaymentCompany.MasterCard: {
        return Image.asset(
          "assets/logos/mastercard/mastercard_1.png",
          height: 40.0,
          // width: 54.0,
        );
      }
      break;
      case PaymentCompany.RuPay: {
        return Image.asset(
          "assets/logos/rupay/rupay_1.png",
          height: 40.0,
          // width: 54.0,
          color: Colors.white,
        );
      }
      break;
      case PaymentCompany.Visa: {
        return Image.asset(
          "assets/logos/visa/visa_3.png",
          height: 40.0,
          // width: 54.0,
        );
      }
      break;
    }

    return Icon(
      Icons.warning_rounded,
      color: Colors.white,
      size: 36,
    );
  }

}
