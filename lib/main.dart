import 'package:flutter/material.dart';

void main() {
  runApp(MonAppli());
}

class MonAppli extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      home: PageAccueil(),
    );
  }
}

class PageAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Magazine Infos"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/magazineInfo.jpg'),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            PartieTitre(),
            PartieTexte(),
            PartieIcone(),
            PartieRubrique(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tu as cliqué dessus')),
          );
        },
        child: const Text("Click"),
      ),
    );
  }
}

class PartieTitre extends StatelessWidget {
  const PartieTitre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Magazine Infos",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            "Votre source d'information numérique",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class PartieTexte extends StatelessWidget {
  const PartieTexte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: const Text(
        "Magazine Infos est votre destination numérique pour rester informé des dernières actualités, "
        "découvrir des articles de fond sur des sujets variés, et explorer les tendances du moment. "
        "Notre équipe de journalistes passionnés vous propose un contenu de qualité, accessible "
        "partout et à tout moment. Rejoignez notre communauté de lecteurs curieux et engagés.",
        style: TextStyle(
          fontSize: 14,
          height: 1.5,
          color: Colors.black54,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class PartieIcone extends StatelessWidget {
  const PartieIcone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: const Column(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.pink,
                  size: 30,
                ),
                SizedBox(height: 5),
                Text(
                  "TEL",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: const Column(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.pink,
                  size: 30,
                ),
                SizedBox(height: 5),
                Text(
                  "MAIL",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: const Column(
              children: [
                Icon(
                  Icons.share,
                  color: Colors.pink,
                  size: 30,
                ),
                SizedBox(height: 5),
                Text(
                  "PARTAGE",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/presse.jpg',
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/mode.jpg',
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}