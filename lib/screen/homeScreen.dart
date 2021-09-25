part of '../pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool scrollVisibility = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PeopleProvider>(context, listen: false).getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Consumer<PeopleProvider>(
          builder: (context, value, child) {
            return Stack(
              children: <Widget>[
                // IntroScreen(),
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 100,
                        child: Container(
                          margin: EdgeInsets.only(top: 70, left: 15),
                          child: TextStyles(
                            value: "My Contact",
                            size: 23,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SliverAppBar(
                      toolbarHeight: 80,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      actions: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(15, 18, 0, 14),
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6),
                                          child: Icon(Icons.search),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        filled: true,
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText: "Search...",
                                        fillColor: Colors.white70),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(15, 20, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: TextStyles(
                                        value: "Recent",
                                        size: 18,
                                        weight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 140,
                                      child: ListView.builder(
                                        itemCount:
                                            value.peopleList.results!.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var result = value.peopleList.results;

                                          return Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: ImgStyle(
                                                        url: result?[index]
                                                            .picture!
                                                            .medium,
                                                        radius: 100,
                                                        height: 80,
                                                        width: 80,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 80,
                                                      child: TextStyles(
                                                        isRecent: true,
                                                        value:
                                                            "${result?[index].name!.first} ${result?[index].name!.last}",
                                                        size: 14,
                                                        weight: FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 1.5),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(100),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextStyles(
                                            value: "Friends (200)",
                                            size: 14,
                                            weight: FontWeight.bold,
                                          ),
                                          TextStyles(
                                            value: "Show All",
                                            size: 14,
                                            weight: FontWeight.bold,
                                          )
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                      itemCount:
                                          value.peopleList.results!.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var result = value.peopleList.results;
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileDetail(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 15),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  child: ImgStyle(
                                                    url: result?[index]
                                                        .picture!
                                                        .medium,
                                                    radius: 100,
                                                    height: 60,
                                                    width: 60,
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextStyles(
                                                        value:
                                                            "${result?[index].name!.first} ${result?[index].name!.last}",
                                                        size: 16,
                                                        weight: FontWeight.bold,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 8.0),
                                                        child: Container(
                                                          child: TextStyles(
                                                            value:
                                                                result?[index]
                                                                    .email,
                                                            size: 13,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .instagram,
                                                        size: 17,
                                                        color:
                                                            Colors.green[600],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 8.0),
                                                        child: TextStyles(
                                                          value:
                                                              "@${result?[index].nat!.toLowerCase()}",
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
