import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  final biodata = <String, String>{};
  MainApp({super.key}){
    biodata['name'] = 'Khrisna Kiwkiw';
    biodata['email'] = 'khrisnaad@gmail.com';
    biodata['phone'] = '087731554145';
    biodata['lokasi'] = 'https://www.google.co.id/maps/place/Universitas+Dian+Nuswantoro/@-6.9826264,110.4066259,17z/data=!3m1!4b1!4m6!3m5!1s0x2e708b4ec52229d7:0xc791d6abc9236c7!8m2!3d-6.9826317!4d110.4092008!16s%2Fg%2F121kq4bb?entry=ttu';
    biodata['image'] = 'RADEN-299.jpg';
    biodata['hobby'] = 'Bermain futsal';
    biodata['addr'] = 'Perum Mega Bukit Mas';
    biodata['desc'] = '''Restoran murah meriah UDINUS''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Restoran Khrisna", 
      home: Scaffold(
        appBar:AppBar(title: const Text("Restoran Khrisna")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            teksKotak(Colors.black, biodata['name'] ?? '' ),
                Image(image: AssetImage('assets/${biodata["image"] ?? '' }')),
                
                SizedBox(height: 10),

                Row(children: [
                  btnContact(Icons.alternate_email, Colors.red[900]
                   "mail to:${biodata['email']}"), 
                  btnContact(Icons.mark_as_unread_rounded, Colors.blueAccent[600]
                   "https://wa.me/${biodata['phone']}"),
                  btnContact(Icons.location_city, Colors.deepPurple,
                   "tel: ${biodata['phone']}"),
              ],
            ),
            SizedBox(height: 10),
            textAttribute("Hobby", biodata['hobby'] ?? ''),
            textAttribute("Alamat", biodata['addr'] ?? ''),
            SizedBox(height: 10),
            teksKotak(Colors.black38, 'Deskripsi'),
            SizedBox(height: 10),
            Text(biodata['desc'] ?? '',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center ,
            )
        ],)
       ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            width:double.infinity,
            decoration: BoxDecoration(color: bgColor),
            child: Text(
              teks,
              style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20,
              color: Colors.white),
              ),
              );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
            children: [
              Container(
                width: 80,
                child: Text("-$judul",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Text(":", style: TextStyle(fontSize: 18)),
              Text(teks, style: TextStyle(fontSize: 18)),
            ],
          );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
                  child: ElevatedButton(
                    onPressed: (){
                      launch(Uri);
                    },
                  child: Icon(icon),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: color, 
                  foregroundColor: Colors.white,
                  ),
                                ),
                );
  }

  void launch(String uri) async{
    if(!await launchUrl(Uri.parse(uri))){
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
