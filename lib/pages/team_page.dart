import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/profile_card.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.go('/home'),
                  icon: const Icon(Icons.arrow_back_outlined, size: 32),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 16),
              child: const Text(
                'Qual o intuito do Find Out?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: 300,
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: const Text(
                    'A ideia do aplicativo é ser uma rede social de viagens, onde os usuários consigam compartilhar suas experiências, recomendar lugares e acompanhar outras pessoas.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 16),
              child: const Text(
                'Quem somos nós?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                children: const [
                  ProfileCard(
                    nameCard: 'Letícia Baldin',
                    imageCard: AssetImage(
                      'assets/images/let_image.png',
                    ),
                    raCard: 'Desenvolvedora',
                  ),
                  ProfileCard(
                    nameCard: 'Victor Vasconcelos',
                    imageCard: AssetImage(
                      'assets/images/victor_image.png',
                    ),
                    raCard: 'Gerente de projeto',
                  ),
                  ProfileCard(
                    nameCard: 'Bruno César',
                    imageCard: AssetImage(
                      'assets/images/bruno_image.png',
                    ),
                    raCard: 'Desenvolvedor',
                  ),
                  ProfileCard(
                    nameCard: 'Débora Ferreira',
                    imageCard: AssetImage(
                      'assets/images/debora_image.png',
                    ),
                    raCard: 'UX/UI Designer',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
