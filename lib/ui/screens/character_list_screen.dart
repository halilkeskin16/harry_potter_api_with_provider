import 'package:flutter/material.dart';
import 'package:harry_potter_api/data/providers/characte_provider.dart';
import 'package:harry_potter_api/ui/widgets/character_grid_card.dart';
import 'package:harry_potter_api/ui/widgets/character_list_card.dart';
import 'package:provider/provider.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharacterProvider>().fetchCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CharacterProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.errorMessage != null && provider.errorMessage!.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(provider.errorMessage! , style: const TextStyle(color: Colors.red))),
        );
      }
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        print('Screen width: ${constraints.maxWidth}, isMobile: $isMobile');
        return isMobile
            ? _buildMobileLayout(provider)
            : _buildDesktopLayout(provider , constraints.maxWidth);
      },
    );
  }

  Widget _buildMobileLayout(CharacterProvider provider) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harry Potter Characters') , centerTitle: true,),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.characters.isEmpty
              ? const Center(child: Text('No characters found'))
              : RefreshIndicator(
                  onRefresh: () async {
                    await provider.fetchCharacters();
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: provider.characters.length,
                    itemBuilder: (context, index) {
                      final character = provider.characters[index];
                      return CharacterCard(character: character);
                    },
                  ),
                ),
    );
  }

  Widget _buildDesktopLayout(CharacterProvider provider , double screenWidth) {
    int gridCount = screenWidth < 800 ? 3 : screenWidth < 1200 ? 4 : 5;
    return Scaffold(
      appBar: AppBar(title: const Text('Harry Potter Characters') , centerTitle: true,),
      body: Center(
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final character = provider.characters[index];
            return CharacterGridCard(character: character);
          },
          itemCount: provider.characters.length,
        ),
      ),
    );
  }
}
