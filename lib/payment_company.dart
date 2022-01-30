
/*
import 'package:flutter/material.dart';

class PaymentCompanyName {
  static const Unknown = "Unknown";
  static const AmericanExpress = "AmericanExpress";
  static const Cirrus = "Cirrus";
  static const DinersClub = "DinersClub";
  static const Maestro = "Maestro";
  static const MasterCard = "MasterCard";
  static const RuPay = "Rupay";
  static const Visa = "Visa";

  PaymentCompanyName._();
}

class PaymentCompany {
  var name;
  var logo;

  PaymentCompany._();

  PaymentCompany.americanExpress() {
    name = "AmericanExpress";
    logo = "assets/logos/amex/amex_2.png";
  }
  PaymentCompany.cirrus() {
    name = "Cirrus";
    logo = "assets/logos/cirrus/cirrus_2.png";
  }
  PaymentCompany.dinersClub() {
    name = "DinersClub";
    logo = "assets/logos/dci/dci_1.jpg";
  }
  PaymentCompany.maestro() {
    name = "Maestro";
    logo = "assets/logos/maestro/maestro_2.png";
  }
  PaymentCompany.masterCard() {
    name = "MasterCard";
    logo = "assets/logos/mastercard/mastercard_1.png";
  }
  PaymentCompany.ruPay() {
    name = "RuPay";
    logo = "assets/logos/rupay/rupay_1.png";
  }
  PaymentCompany.visa() {
    name = "Visa";
    logo = "assets/logos/visa/visa_3.png";
  }

  PaymentCompany.fromCardNumber(String cardNumber) {
    if (isAmericanExpress(cardNumber)) {
      PaymentCompany.americanExpress();
    } else if (isCirrus(cardNumber)) {
      PaymentCompany.cirrus();
    } else if (isDinersClub(cardNumber)) {
      PaymentCompany.dinersClub();
    } else if (isMaestro(cardNumber)) {
      PaymentCompany.maestro();
    } else if (isMasterCard(cardNumber)) {
      PaymentCompany.masterCard();
    } else if (isRuPay(cardNumber)) {
      PaymentCompany.ruPay();
    } else if (isVisa(cardNumber)) {
      PaymentCompany.visa();
    }
  }

  bool isAmericanExpress(String cardNumber) {
    return ["34", "37"].contains(cardNumber.substring(0, 2));
  }

  bool isCirrus(String cardNumber) {
    return false;
  }

  bool isDinersClub(String cardNumber) {
    return ["30", "36", "38", "54"].contains(cardNumber.substring(0, 2));
  }

  bool isMaestro(String cardNumber) {
    return ["6759", "5018", "5020", "5038", "5893", "6304", "6759", "6761", "6762", "6763"].contains(cardNumber.substring(0, 4)) || ["676770", "676774"].contains(cardNumber.substring(0, 6));
  }

  bool isMasterCard(String cardNumber) {
    var twoDigits = int.tryParse(cardNumber.substring(0, 2));
    if (twoDigits != null) {
      if (twoDigits.clamp(51, 55) == twoDigits) {
        return true;
      } else {
        var fourDigits = int.tryParse(cardNumber.substring(0, 4));
        if (fourDigits != null) {
          if (fourDigits.clamp(2221, 2720) == fourDigits) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool isRuPay(String cardNumber) {
    return ["60", "65", "81", "82"].contains(cardNumber.substring(0, 2)) || ["508", "353", "356"].contains(cardNumber.substring(0, 3));
  }

  bool isVisa(String cardNumber) {
    return cardNumber.substring(0, 1) == "4";
  }
}

*/