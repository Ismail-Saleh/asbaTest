part of 'pages.dart';

Color primaryColor = Color(0xFFFDF8F0);
Color accentColor = Color(0xFF1A237E);
Color tittleColor = Color(0xFF1A237E);

//------------------------------------------------------------------------------------------ TEXT STLYES
class TextStyles extends StatelessWidget {
  TextStyles(
      {Key? key,
      this.color = Colors.black,
      this.size = 12,
      this.value,
      this.weight})
      : super(key: key);

  final String? value;
  final Color color;
  final FontWeight? weight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      value!,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    );
  }
}

class ImgStyle extends StatelessWidget {
  const ImgStyle({
    Key? key,
    this.url,
    this.radius,
    this.height,
    this.width,
  }) : super(key: key);

  final String? url;
  final double? radius, width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(radius!),
        ),
        child: CachedNetworkImage(
          imageUrl: url!,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
