import 'package:flutter/material.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

class SiteSettingsPage extends StatelessWidget {
  const SiteSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: const [
            SiteButtonView(),
            SiteDomainView(),
            SiteCertificateView(),
            SiteConfigurationView(),
            SiteAnalysisIpView(),
            SiteFileFormatView(),
            SiteClonedView(),
            SiteCompanyView(),
            SiteHomeTitleView(),
            SiteHomeKeywordView(),
            SiteHomeDescriptionView()
          ],
        ),
      ),
    );
  }
}
