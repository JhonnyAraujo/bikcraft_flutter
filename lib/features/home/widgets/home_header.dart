import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const desktopBreakpoint = 550;
    const maxContentWidth = 1200.0;
    const horizontalPadding = 20.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth > desktopBreakpoint;

        return Container(
          color: Colors.black,
          height: isDesktop ? 96 : 126,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxContentWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: isDesktop
                    ? Row(
                        children: [
                          const _HeaderLogo(),
                          const Spacer(),
                          _HeaderMenu(isDesktop: isDesktop),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: _HeaderLogo(),
                            ),
                            const Spacer(),
                            _HeaderMenu(isDesktop: isDesktop),
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

class _HeaderLogo extends StatelessWidget {
  const _HeaderLogo();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SvgPicture.asset('assets/logos/bikcraft.svg'),
    );
  }
}

class _HeaderMenu extends StatelessWidget {
  const _HeaderMenu({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    const menuItems = ['Bicicletas', 'Seguros', 'Contato'];

    return Row(
      spacing: 10,
      children: menuItems
          .map(
            (itemName) =>
                _HeaderMenuItem(isDesktop: isDesktop, itemName: itemName),
          )
          .toList(),
    );
  }
}

class _HeaderMenuItem extends StatelessWidget {
  const _HeaderMenuItem({required this.isDesktop, required this.itemName});

  final bool isDesktop;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return isDesktop
        ? TextButton(
            onPressed: () {},
            child: Text(
              itemName,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        : FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xFF111111),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            onPressed: () {},
            child: Text(
              itemName,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          );
  }
}
