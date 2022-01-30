import 'package:cards/digital_card.dart';
import 'package:cards/edit_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cards/card_tile.dart';
import 'package:hexcolor/hexcolor.dart';

class CardsHome extends StatefulWidget {
  const CardsHome({Key? key}) : super(key: key);

  @override
  _CardsHomeState createState() => _CardsHomeState();
}

class _CardsHomeState extends State<CardsHome> {

  var cards = [];

  fetchCards() {
    var card1 = DigitalCard(
        name: "Rewards",
        number: "4386280039678069",
        expiryDate: DateTime(2022, 12),
        holderName: "MEHUL BHAVANI",
        bankName: "CITI",
        paymentCompany: PaymentCompany.Visa,
        type: CardType.Credit,
        supportsNfc: true,
        cvv: "288",
        pin: "1234",
        bgColor: HexColor("#055F86")
    );
    cards.add(card1);

    var card2 = DigitalCard(
        name: "My Zone",
        number: "5305620500676735",
        expiryDate: DateTime(2022, 7),
        holderName: "MAHENDRA KUMAR",
        bankName: "AXIS BANK",
        paymentCompany: PaymentCompany.Visa,
        type: CardType.Credit,
        supportsNfc: true,
        cvv: "123",
        pin: "1234",
        bgColor: Colors.deepPurple
    );
    cards.add(card2);

    var card3 = DigitalCard(
        name: null,
        number: "6070613011300375",
        expiryDate: DateTime(2021, 3),
        holderName: "SYNDINSTANT DR CARD",
        bankName: "SYNDICATE BANK",
        paymentCompany: PaymentCompany.RuPay,
        type: CardType.Debit,
        supportsNfc: false,
        cvv: "123",
        pin: "1234",
        bgColor: Colors.grey.shade800
    );
    cards.add(card3);

    var card4 = DigitalCard(
        name: "Flipkart",
        number: "5334670001565361",
        expiryDate: DateTime(2024, 10),
        holderName: "MAHENDRA KUMAR",
        bankName: "AXIS BANK",
        paymentCompany: PaymentCompany.MasterCard,
        type: CardType.Credit,
        supportsNfc: true,
        cvv: "123",
        pin: "1234",
        bgColor: HexColor("#CC3B46")
    );
    cards.add(card4);

    var card5 = DigitalCard(
        name: "Flipkart",
        number: "5334670001565361",
        expiryDate: DateTime(2024, 10),
        holderName: "MAHENDRA KUMAR",
        bankName: "AXIS BANK",
        paymentCompany: PaymentCompany.MasterCard,
        type: CardType.Credit,
        supportsNfc: true,
        cvv: "123",
        pin: "1234",
        bgColor: HexColor("#134165")
    );
    cards.add(card5);
  }

  @override
  void initState() {
    super.initState();
    fetchCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          "My Cards",
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 36.0,
          ),
        ),
        centerTitle: false,
        elevation: 0.0,
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.add_box_rounded,
              size: 42.0,
            ),
            label: Text(""),
            style: TextButton.styleFrom(
              primary: Colors.grey.shade900,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditCard(),
                    fullscreenDialog: true
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        // color: Colors.pinkAccent,
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        child: cards.length == 0
            ?
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: Text(
            "Tap on '+'\nto add a card",
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.w100,
            )
          ),
        )
            : ListView.builder(
            itemCount: cards.length > 0 ? cards.length : 1,
            itemBuilder: (context, index) {
              return CardTile(card:cards[index]);
            }
        ),
      ),
    );
  }
}
