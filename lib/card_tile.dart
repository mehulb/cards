import 'package:flutter/material.dart';
import 'package:cards/digital_card.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTile extends StatelessWidget {

  final card;
  CardTile({this.card});

  Widget creditCardText({String text = "", double fontSize = 12.0}) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white.withOpacity(0.85),
          fontSize: fontSize,
          fontFamily: "Credit Card",
          shadows: [
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          // margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          color: card.bgColor,
          child: Column(
            children: [
              // CardName; BankName;
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Text(
                      card.name ?? "",
                      style: GoogleFonts.andada(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0
                          )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Text(
                      card.bankName.toUpperCase() ?? "XXX BANK",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 14.0
                          )
                      ),
                    ),
                  )
                ],
              ),
              // CardType;
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Text(
                      card.formattedCardType(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              // Chip; NFC;
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    child: Image.asset(
                      "assets/icons/smart-chip-logo.png",
                      height: 42.0,
                    ),
                  ),
                  Container(
                    // color: Colors.green,
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                    child: Image.asset(
                      "assets/icons/nfc-logo.png",
                      color: Colors.white,
                      height: 32.0,
                      // width: 54.0,
                    ),
                  )
                ],
              ),
              // CardNumber;
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: creditCardText(
                      text: card.formattedCardNumber(),
                      fontSize: 16.0
                    )
                  ),
                ],
              ),
              // ValidThru;
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 3.0, 0.0),
                    child: Text(
                      "VALID THRU",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                    child: creditCardText(
                      text: card.formattedExpiryDate(),
                      fontSize: 12.0
                    )
                  ),
                ],
              ),
              // CardHolderName; PaymentCompanyLogo;
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: creditCardText(
                      text: card.holderName.toUpperCase(),
                      fontSize: 14.0
                    )
                  ),
                  Container(
                    // padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
                    // color: Colors.green,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: card.paymentCompanyLogo(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
