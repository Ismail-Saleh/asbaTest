part of '../pages.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key, this.ress}) : super(key: key);
  final Results? ress;

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Widget detail() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 26, right: 26),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FaIcon(FontAwesomeIcons.phone),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextStyles(
                        value: widget.ress?.phone,
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    ),
                    TextStyles(
                      value: "Number - ${widget.ress?.location!.country}",
                      color: Colors.grey,
                    )
                  ],
                ),
                Spacer(),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.phone,
                      color: Colors.green[200],
                      size: 15,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.chat,
                      size: 15,
                      color: Colors.green[200],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FaIcon(FontAwesomeIcons.google),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextStyles(
                        value: widget.ress?.email,
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    ),
                    TextStyles(
                      value: "Email Account",
                      color: Colors.grey,
                    )
                  ],
                ),
                Spacer(),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.mail,
                      color: Colors.green[200],
                      size: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget callLog() {
    return Container(
        margin: EdgeInsets.only(top: 15, left: 26, right: 26),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: FaIcon(FontAwesomeIcons.phone),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextStyles(
                              value: widget.ress?.phone,
                              size: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                          TextStyles(
                            value: "Number - ${widget.ress?.location!.country}",
                            color: Colors.grey,
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.green[600],
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Center(
                            child: TextStyles(
                          value: "30 Min Ago",
                          size: 8,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 26,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
                size: 26,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: primaryColor,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ImgStyle(
                          url: widget.ress?.picture!.large,
                          radius: 100,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: TextStyles(
                          color: Colors.white,
                          value:
                              "${widget.ress?.name!.title}. ${widget.ress?.name!.first} ${widget.ress?.name!.last}",
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: TextStyles(
                          color: Colors.white,
                          value:
                              "${widget.ress?.location!.city}, ${widget.ress?.location!.country}",
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(90)),
              ),
              padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
              child: TabBar(
                unselectedLabelColor: Colors.yellow,
                labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                tabs: [
                  FittedBox(
                    child: Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "Call Log",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: TabBarView(
                children: [detail(), callLog()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
