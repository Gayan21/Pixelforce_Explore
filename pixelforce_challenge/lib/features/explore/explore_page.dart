import 'package:flutter/material.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text.dart';
import '../../core/api/api_client.dart';
import '../../core/models/trip_model.dart';
import '../../core/models/living_style_model.dart';
import '../../core/models/experience_model.dart';
import 'widgets/trip_card.dart';
import 'widgets/living_style_card.dart';
import 'widgets/experience_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<List<TripModel>> tripsFuture;
  late Future<List<LivingStyleModel>> livingFuture;
  late Future<List<ExperienceModel>> expFuture;

  @override
  void initState() {
    super.initState();
    tripsFuture = ApiClient.fetchTrips();
    livingFuture = ApiClient.fetchLivingStyles();
    expFuture = ApiClient.fetchExperiences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            _buildStatusAndSearch(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _sectionHeader('Find your next trip', actionLabel: 'See all'),
                    const SizedBox(height: 12),
                    FutureBuilder<List<TripModel>>(
                      future: tripsFuture,
                      builder: (context, snap) {
                        if (snap.connectionState != ConnectionState.done) {
                          return SizedBox(height:230, child: Center(child: CircularProgressIndicator()));
                        }
                        if (snap.hasError) {
                          return SizedBox(height:230, child: Center(child: Text('Error loading trips')));
                        }
                        final trips = snap.data ?? [];
                        return SizedBox(
                          height:230,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: trips.length,
                            separatorBuilder: (_,__)=> const SizedBox(width:20),
                            itemBuilder: (_,i)=> TripCard(trip: trips[i]),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 36),
                    _sectionHeader('Explore by living style'),
                    const SizedBox(height: 12),
                    FutureBuilder<List<LivingStyleModel>>(
                      future: livingFuture,
                      builder: (context, snap) {
                        if (snap.connectionState != ConnectionState.done) {
                          return SizedBox(height:210, child: Center(child: CircularProgressIndicator()));
                        }
                        if (snap.hasError) {
                          return SizedBox(height:210, child: Center(child: Text('Error loading')));
                        }
                        final list = snap.data ?? [];
                        return SizedBox(
                          height:210,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            separatorBuilder: (_,__)=> const SizedBox(width:20),
                            itemBuilder: (_,i)=> LivingStyleCard(style: list[i]),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 36),
                    _sectionHeader('Want to discover other experiences'),
                    const SizedBox(height: 12),
                    FutureBuilder<List<ExperienceModel>>(
                      future: expFuture,
                      builder: (context, snap) {
                        if (snap.connectionState != ConnectionState.done) {
                          return SizedBox(height:160, child: Center(child: CircularProgressIndicator()));
                        }
                        if (snap.hasError) {
                          return SizedBox(height:160, child: Center(child: Text('Error loading')));
                        }
                        final list = snap.data ?? [];
                        return SizedBox(
                          height:160,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            separatorBuilder: (_,__)=> const SizedBox(width:20),
                            itemBuilder: (_,i)=> ExperienceCard(exp: list[i]),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _buildStatusAndSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.searchBg,
              borderRadius: BorderRadius.circular(72),
              border: Border.all(color: AppColors.searchBorder, width: 0.8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.search, color: AppColors.blueDark),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    'Search address, city, location',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.navGray,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                Icon(Icons.settings, color: AppColors.blueDark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, {String? actionLabel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppText.title18),
        if (actionLabel != null)
          ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              colors: [AppColors.gradientStart, AppColors.gradientEnd],
            ).createShader(rect),
            child: Text(
              actionLabel,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
            ),
          ),
      ],
    );
  }

  Widget _bottomNav() {
    const gradient = LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd]);

    Widget item(IconData icon, String label, bool active) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          active ? ShaderMask(shaderCallback: (r) => gradient.createShader(r), child: Icon(icon, size: 26, color: Colors.white)) : Icon(icon, size: 26, color: AppColors.navGray),
          const SizedBox(height: 6),
          active
              ? ShaderMask(shaderCallback: (r) => gradient.createShader(r), child: Text(label, style: AppText.navLabel.copyWith(color: Colors.white)))
              : Text(label, style: AppText.navLabel),
        ],
      );
    }

    return Container(
      height: 84,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, spreadRadius: -4)],
      ),
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          item(Icons.home_outlined, 'Home', false),
          item(Icons.explore, 'Explore', true),
          item(Icons.chat_bubble_outline, 'Chat', false),
          item(Icons.favorite_border, 'Saved', false),
          item(Icons.person_outline, 'Profile', false),
        ],
      ),
    );
  }
}