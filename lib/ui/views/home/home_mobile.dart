part of home_view;

class _HomeMobilePortrait extends StatelessWidget {
  final HomeViewModel viewModel;
  const _HomeMobilePortrait(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile'),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(),
    );
  }
}

class _HomeMobileLandscape extends StatelessWidget {
  final HomeViewModel viewModel;
  const _HomeMobileLandscape(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile'),
        backgroundColor: Colors.black,
      ),
      body: const Center(),
    );
  }
}
