import 'package:flutter/material.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

class SiteSettingsPage extends StatelessWidget {
  const SiteSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SiteButtonView(),
          SiteDomainView(),
          SiteCertificateView(),
          SiteConfigurationView(),
          SiteAnalysisIpView(),
          SiteFileFormatView(),
          SiteClonedView(),
          SiteCompanyView(),
          SiteHomeDescriptionView(),
        ],
      ),
    );
  }
}
