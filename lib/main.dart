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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveImage(),
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

class ResponsiveImage extends StatelessWidget {
  const ResponsiveImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calcul de la hauteur responsive
    double imageHeight = screenHeight * 0.25; // 25% de la hauteur de l'écran
    if (screenWidth < 600) {
      imageHeight = screenHeight * 0.2; // 20% sur mobile
    } else if (screenWidth > 1200) {
      imageHeight = screenHeight * 0.3; // 30% sur desktop
    }
    
    return Image(
      image: AssetImage('assets/images/magazineInfo.jpg'),
      height: imageHeight,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class PartieTitre extends StatelessWidget {
  const PartieTitre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive padding et font sizes
    double padding = screenWidth < 600 ? 16.0 : screenWidth < 1200 ? 24.0 : 32.0;
    double titleSize = screenWidth < 600 ? 20.0 : screenWidth < 1200 ? 24.0 : 28.0;
    double subtitleSize = screenWidth < 600 ? 14.0 : screenWidth < 1200 ? 16.0 : 18.0;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Magazine Infos",
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            "Votre source d'information numérique",
            style: TextStyle(
              fontSize: subtitleSize,
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
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive padding et font size
    double horizontalPadding = screenWidth < 600 ? 16.0 : screenWidth < 1200 ? 24.0 : 32.0;
    double fontSize = screenWidth < 600 ? 14.0 : screenWidth < 1200 ? 15.0 : 16.0;
    double maxWidth = screenWidth > 1200 ? 800.0 : double.infinity;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10.0),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Text(
            "Magazine Infos est votre destination numérique pour rester informé des dernières actualités, "
            "découvrir des articles de fond sur des sujets variés, et explorer les tendances du moment. "
            "Notre équipe de journalistes passionnés vous propose un contenu de qualité, accessible "
            "partout et à tout moment. Rejoignez notre communauté de lecteurs curieux et engagés.",
            style: TextStyle(
              fontSize: fontSize,
              height: 1.5,
              color: Colors.black54,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

class PartieIcone extends StatelessWidget {
  const PartieIcone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive icon sizes et text size
    double iconSize = screenWidth < 600 ? 28.0 : screenWidth < 1200 ? 32.0 : 36.0;
    double textSize = screenWidth < 600 ? 11.0 : screenWidth < 1200 ? 12.0 : 14.0;
    double spacing = screenWidth < 600 ? 4.0 : 6.0;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? 16.0 : 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconColumn(Icons.phone, "TEL", iconSize, textSize, spacing),
          _buildIconColumn(Icons.email, "MAIL", iconSize, textSize, spacing),
          _buildIconColumn(Icons.share, "PARTAGE", iconSize, textSize, spacing),
        ],
      ),
    );
  }
  
  Widget _buildIconColumn(IconData icon, String label, double iconSize, double textSize, double spacing) {
    return Flexible(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.pink,
            size: iconSize,
          ),
          SizedBox(height: spacing),
          Text(
            label,
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
            textAlign: TextAlign.center,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive padding et image height
    double horizontalPadding = screenWidth < 600 ? 16.0 : screenWidth < 1200 ? 24.0 : 32.0;
    double imageHeight = screenWidth < 600 ? 100.0 : screenWidth < 1200 ? 120.0 : 140.0;
    double spacing = screenWidth < 600 ? 8.0 : 12.0;
    double borderRadius = screenWidth < 600 ? 8.0 : 12.0;
    
    // Layout responsive : vertical sur mobile, horizontal sur tablet/desktop
    if (screenWidth < 600) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.asset(
                'assets/images/presse.jpg',
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: spacing),
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.asset(
                'assets/images/mode.jpg',
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    }
    
    // Layout horizontal pour tablet et desktop
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.asset(
                'assets/images/presse.jpg',
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: spacing),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.asset(
                'assets/images/mode.jpg',
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}