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
        body: viewModel.isBusy
            ? Shimmer.fromColors(
                highlightColor: Colors.grey[100],
                baseColor: Colors.grey[200],
                child: Container(
                  height: 250,
                  width: 300,
                  // height: double.infinity,
                  // width: double.infinity,
                  // width: 200,

                  color: Colors.grey[300],
                ),
              )
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final container = Container(
                      height: 250,
                      width: 300,
                      child:
                          // CachedNetworkImage(
                          //   imageUrl:
                          //       'https://loremflickr.com/320/240/music?lock=$index',
                          //   placeholder: (BuildContext context, String url) =>
                          //       Container(
                          //     width: 200,
                          //     height: 200,
                          //     color: Colors.grey[200],
                          //   ),
                          // ),
                          Cached_Image(
                        height: 250,
                        width: 300,
                        imageURL: 'https://picsum.photos/250?dage=9',
                        shape: BoxShape.circle,
                        retry: (status) {
                          print("RETRYINGGG");
                        },
                      )
                      //     CachedNetworkImage(
                      //   imageUrl: 'https://picsum.photos/250?dage=9',
                      //   // fit: BoxFit.cover,
                      //   imageBuilder: (context, imageProvider) => Container(
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //           image: imageProvider,
                      //           fit: BoxFit.cover,
                      //           colorFilter: ColorFilter.mode(
                      //               Colors.red, BlendMode.colorBurn)),
                      //     ),
                      //   ),
                      //   placeholder: (context, url) =>
                      //       // CircularProgressIndicator(),
                      //       //     Shimmer.fromColors(
                      //       //   baseColor: Colors.grey[300],
                      //       //   highlightColor: Colors.grey[100],
                      //       //   child: Container(
                      //       //     // width: 200,
                      //       //     height: 250,
                      //       //     color: Colors.grey[200],
                      //       //   ),
                      //       // ),
                      //       //   Expanded(
                      //       // child:
                      //       Expanded(
                      //           // padding: EdgeInsets.symmetric(horizontal: 15),
                      //           child: Shimmer.fromColors(
                      //     highlightColor: Colors.white,
                      //     baseColor: Colors.grey[300],
                      //     child: Container(
                      //       height: 250,
                      //       width: 300,
                      //       // height: double.infinity,
                      //       // width: double.infinity,
                      //       // width: 200,

                      //       color: Colors.grey,
                      //     ),

                      //     // period: Duration(milliseconds: time)
                      //   )),
                      //   // ),

                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                      );
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          container,
                          SizedBox(
                            height: 20,
                          ),
                          Text("facebook loader")
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 250,
              ));
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
