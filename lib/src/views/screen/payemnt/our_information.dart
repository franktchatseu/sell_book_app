import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seel_book_app/src/logic_app/services/payement_service.dart';

class OurInformation extends StatefulWidget {
  @override
  _OurInformationState createState() => _OurInformationState();
}

class _OurInformationState extends State<OurInformation> {

  dynamic reglement = [
    {
      'label': "Maintenant",
      'value': 0
    },
    {
      'label': "A la livraison",
      'value': 1
    },

  ];
  dynamic reglementChoose;
  String phone= "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vos Informations"),
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:15.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                  Border.all(width: 1.5, color: Colors.blueGrey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Google Sans',
                            color: Colors.black87),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText:
                          "Nom Complet",
                          hintStyle: TextStyle(fontSize: 18,),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            CupertinoIcons.profile_circled,

                          ),),
                        onChanged: (value) {
                          setState(() {
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                  Border.all(width: 1.5, color: Colors.blueGrey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Google Sans',
                            color: Colors.black87),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText:
                          "Adresse",
                          hintStyle: TextStyle(fontSize: 18,),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            CupertinoIcons.location,

                          ),),
                        onChanged: (value) {
                          setState(() {
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                  Border.all(width: 1.5, color: Colors.blueGrey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Google Sans',
                            color: Colors.black87),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText:
                          "Telephone 1",
                          hintStyle: TextStyle(fontSize: 18,),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            CupertinoIcons.profile_circled,

                          ),),
                        onChanged: (value) {
                          setState(() {
                            this.phone= value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                  Border.all(width: 1.5, color: Colors.blueGrey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Google Sans',
                            color: Colors.black87),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText:
                          "Telephone 2",
                          hintStyle: TextStyle(fontSize: 18,),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            CupertinoIcons.profile_circled,

                          ),),
                        onChanged: (value) {
                          setState(() {
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: InkWell(
                onTap: (){
                  _selectDate(context, "start_date");
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                    Border.all(width: 1.5, color: Colors.blueGrey),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Icon(
                          CupertinoIcons.calendar,

                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        selectedDate == null
                            ? "Date et Heure de recuperation"
                            : DateFormat('dd/MM/yyyy').format(selectedDate),
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Google Sans'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.5, color: Colors.blueGrey),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DropdownButton<dynamic>(
                    value: reglementChoose,
                    hint: Text("Mode de Reglement"),
                    underline: SizedBox(),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                      color: Colors.teal.shade900,
                    ),
                    isExpanded: true,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Google Sans',
                        color: Colors.black),
                    items: this
                        .reglement
                        .map<DropdownMenuItem<dynamic>>((dynamic value) {
                      return DropdownMenuItem<dynamic>(
                        value: value,
                        child: Text(value["label"]),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        this.reglementChoose = newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Container(
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.5, color: Colors.blueGrey),
                ),
                child: TextField(
                  maxLines: 25,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Google Sans',
                      color: Colors.black87),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Ajouter un commentaire",
                      contentPadding:
                      EdgeInsets.only(top: 15, left: 15, right: 25),
                      hintStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white.withOpacity(0),
                              border: Border.all(color: Colors.blueGrey,width: 1)
                          ),
                          child: Row(
                            children: [

                              Text("Envoyer Commande",style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Google Sans'),

                              ),
                              SizedBox(width: 7,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.black,
                              ),

                            ],
                          )
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        sendData();
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.teal
                          ),
                          child: Row(
                            children: [

                              this.loader!=true?Text("PAYER",style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Google Sans'),

                              ):
                              CircularProgressIndicator(
                                backgroundColor: Colors.amber.shade800,
                              ),

                            ],
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool loader = false;
  Future<void> sendData() async {
    if(this.phone==""){
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Entrer le numero de telephone"),
          ));
      return;
    }
    setState(() {
      this.loader = true;
    });
    PayemntApi _serviceApi = new PayemntApi();
    final response = await _serviceApi.buy(this.phone,"50");
    print(response.data);
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(" Entrer votre code secret pour confirmer le payement"),
          ));
      //refresh ui
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Echec initialisation du payement"),
          ));
    }
    setState(() {
      this.loader = false;
    });
  }
  //chose date
  DateTime selectedDate;
  _selectDate(BuildContext context, String choose) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
  }
}
