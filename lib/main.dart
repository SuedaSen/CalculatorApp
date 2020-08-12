import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Dinamik değil. Durumsuz. Ekran ilk oluşturulduğunda bir kez çalışan ve orada sabit bir şekilde kalan widget’lar için tasarlanmış. Text widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'VBT Hesap Makinesi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Dinamik. Stateful ise değişken halinde olabilecek widget’ler için kullanılır. Sayı arttırma vs.
  MyHomePage({Key key, this.title})
      : super(key: key); //Bu otomatik gelen bir şeydi

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Text Field; Kullanıcının klavyesiyle metin girmesini sağlar.
//Fonksiyondaki text değişikliklerini her seferinde çağırmak için
//TextEditingController kullanılır veya onChanged()'ı desteklemek için TextField veya TextFormField kullanılır
//final myController = TextEditingController()
//TextField(
//  controller: myController,
//);
  double answer = 0;
  double firstNum = 0; //Başlangıç değeri atamak gerek
  double secondNum = 0; //Başlangıç değeri atamak gerek
  final TextEditingController firstText = new TextEditingController();
  final TextEditingController secondText = new TextEditingController();

  additionProcess() {
    setState(() {
      //bir bileşenin state nesnesine bir güncelleme planlar. State değiştiğinde, bileşen yeniden render ederek karşılık verir.
      firstNum = double.parse(firstText.text);
      secondNum = double.parse(secondText.text);
      answer = firstNum + secondNum;
    });
  }

  multiplicationProcess() {
    setState(() {
      //bir bileşenin state nesnesine bir güncelleme planlar. State değiştiğinde, bileşen yeniden render ederek karşılık verir.
      firstNum = double.parse(firstText.text);
      secondNum = double.parse(secondText.text);
      answer = firstNum * secondNum;
    });
  }

  subtractionProcess() {
    setState(() {
      //bir bileşenin state nesnesine bir güncelleme planlar. State değiştiğinde, bileşen yeniden render ederek karşılık verir.
      firstNum = double.parse(firstText.text);
      secondNum = double.parse(secondText.text);
      answer = firstNum - secondNum;
    });
  }

  divisionProcess() {
    setState(() {
      //bir bileşenin state nesnesine bir güncelleme planlar. State değiştiğinde, bileşen yeniden render ederek karşılık verir.
      firstNum = double.parse(firstText.text);
      secondNum = double.parse(secondText.text);
      answer = firstNum / secondNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar, Bottomnavigationbar, Drawer gibi bir çok özelliği içinde barındırır.
      appBar: AppBar(
        //Appbar içinde bulundurduğu actions, leading ve bottom parametleriyle kişiseleştirebilir
        title: Text("VBT Hesap Makinesi"),
        brightness: Brightness.dark,
      ),
      body: Container(
        //Yaygın kullanımda Conteiner Center, Padding, Column, Row , veya Scaffold widget’larının içinde tanımlanır.
        padding: EdgeInsets.all(30.0), //Ortalamak için kullanılıyor
        child: Column(
            //Column Widget’ı, Container’dan farklı olarak, children: parametresine sahiptir. Children parametresi bir Widget listesi (<Widget>[ , , , ]) alır. Bu da kolon içerisine birden fazla Widget eklenebileceği anlamına gelmektedir. Eklenen her Widget, üst üste ekleniyor gibi sonuç verir.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Bu İşlemin Sonucu, $answer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              TextField(
                decoration: InputDecoration(
                  labelText: "İlk sayıyı girebilir misin",
                ),
                keyboardType: TextInputType.number,
                controller: firstText,
              ),

              TextField(
                decoration: InputDecoration(
                  labelText: "İkinci sayıyı girebilir misin",
                ),
                keyboardType: TextInputType.number,
                controller: secondText,
              ),
//***************************BUTON KISMI******************************************** */
              RaisedButton(
                //Arkası gölgeli efektli buton
                color: Colors.green,
                highlightColor: Colors.white,
                elevation: 10,
                child: Text(
                  "Toplama İşlemi (+)",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  print("Toplama İşlemi (+)");
                  additionProcess();
                },
              ),

              RaisedButton(
                //Arkası gölgeli efektli buton
                color: Colors.red,
                highlightColor: Colors.white,
                elevation: 10,
                child: Text(
                  "Çıkarma İşlemi (-)",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  print("Çıkarma İşlemi (-)");
                  subtractionProcess();
                },
              ),

              RaisedButton(
                //Arkası gölgeli efektli buton
                color: Colors.blue,
                highlightColor: Colors.white,
                elevation: 10,
                child: Text(
                  "Çarpma İşlemi (*)",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  print("Çarpma İşlemi (*)");
                  multiplicationProcess();
                },
              ),

              RaisedButton(
                //Arkası gölgeli efektli buton
                color: Colors.yellow,
                highlightColor: Colors.white,
                elevation: 10,
                child: Text(
                  "Bölme İşlemi (/)",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  print("Bölme İşlemi (/)");
                  divisionProcess();
                },
              ),
            ]),
      ),
    );
  }
}
