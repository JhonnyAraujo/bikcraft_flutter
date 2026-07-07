import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth > 700;

        return Container(
          height: 800,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.black, Colors.white, Colors.white],
              stops: [0.0, 0.85, 0.85, 1.0],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Flexible(
                  child: isDesktop
                      ? Row(
                          spacing: 10,
                          children: [
                            _HeroContent(isDesktop: isDesktop),
                            _HeroImage(isDesktop: isDesktop),
                          ],
                        )
                      : Column(
                          children: [
                            _HeroContent(isDesktop: isDesktop),
                            _HeroImage(isDesktop: isDesktop),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// HERO IMAGE

class _HeroImage extends StatelessWidget {
  const _HeroImage({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final String pathImageResponsive = isDesktop
        ? 'assets/images/introducao.jpg'
        : 'assets/images/nimbus.jpg';

    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(
          pathImageResponsive,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// HERO CONTENT

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final double fontSizeTitle = isDesktop ? 64 : 32;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bicicletas feitas sob medida.',
            style: TextStyle(
              fontSize: fontSizeTitle,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          SizedBox(height: 32),
          Text(
            'Bicicletas elétricas de alta precisão e qualidade, feitas sob medida para o cliente. Explore o mundo na sua velocidade com a Bikcraft.',
            overflow: TextOverflow.visible,
            softWrap: true,
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 204,
            height: 56,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () {},
              child: Text(
                'ESCOLHA A SUA',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
