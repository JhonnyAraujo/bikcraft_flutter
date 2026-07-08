import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    const desktopBreakpoint = 650;
    const maxContentWidth = 1200.0;
    const horizontalPadding = 20.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth > desktopBreakpoint;
        final List<Color> gradientColors = isDesktop
            ? const [Colors.black, Colors.black, Colors.white, Colors.white]
            : [
                Color(0xFF111111),
                Color(0xFF111111),
                Colors.white,
                Colors.white,
              ];

        return Container(
          height: isDesktop ? 800 : 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
              stops: [0.0, 0.85, 0.85, 1.0],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxContentWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: isDesktop
                    ? Row(
                        spacing: 10,
                        children: [
                          Expanded(child: _HeroContent(isDesktop: isDesktop)),
                          _HeroImage(isDesktop: isDesktop),
                        ],
                      )
                    : Column(
                        spacing: 20,
                        children: [
                          _HeroContent(isDesktop: isDesktop),
                          _HeroImage(isDesktop: isDesktop),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// CONTAINER DA IMAGEM

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

// CONTAINER DO CONTEÚDO

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final config = isDesktop
        ? const _HeroLayoutConfig(
            titleFontSize: 64,
            descriptionFontSize: 24,
            buttonFontSize: 18,
            buttonPadding: 44,
            titleDescriptionSpacing: 32,
            descriptionButtonSpacing: 20,
          )
        : const _HeroLayoutConfig(
            titleFontSize: 32,
            descriptionFontSize: 18,
            buttonFontSize: 16,
            buttonPadding: 30,
            titleDescriptionSpacing: 16,
            descriptionButtonSpacing: 10,
          );

    return Column(
      mainAxisAlignment: isDesktop
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          'Bicicletas feitas sob medida.',
          style: TextStyle(
            fontSize: config.titleFontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        SizedBox(height: config.titleDescriptionSpacing),
        Text(
          'Bicicletas elétricas de alta precisão e qualidade, feitas sob medida para o cliente. Explore o mundo na sua velocidade com a Bikcraft.',
          overflow: TextOverflow.visible,
          softWrap: true,
          style: TextStyle(
            fontSize: config.descriptionFontSize,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: config.descriptionButtonSpacing),
        FilledButton(
          style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: config.buttonPadding,
              vertical: (config.buttonPadding / 2),
            ),
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: () {},
          child: Text(
            'ESCOLHA A SUA',
            style: TextStyle(
              fontSize: config.buttonFontSize,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroLayoutConfig {
  const _HeroLayoutConfig({
    required this.titleFontSize,
    required this.descriptionFontSize,
    required this.buttonFontSize,
    required this.buttonPadding,
    required this.titleDescriptionSpacing,
    required this.descriptionButtonSpacing,
  });

  final double titleFontSize;
  final double descriptionFontSize;
  final double buttonFontSize;
  final double buttonPadding;
  final double titleDescriptionSpacing;
  final double descriptionButtonSpacing;
}
