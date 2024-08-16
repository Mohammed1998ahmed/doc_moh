import 'package:doctor/component/conset/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
  
Text text(
        {required String title,
        double? fontSize,
        FontWeight? fontWeight,
        Color? color,
        TextOverflow? overflow,
        bool? softWrap,
        int? maxLines,
        TextAlign? textAlign}) =>
    Text(
      title,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: fontSize ?? 18,
          fontFamily: 'Caveat',
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.red),
    );

TextFormField deTextFromFaild(
    {void Function(String)? onChanged,
    String? Function(String?)? validator,
    TextEditingController? controller,
    InputBorder? border,
    TextInputType? keyboardType,
    TextStyle? hintStyle,
    bool ispassword = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? hintText}) {
  return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      obscureText: ispassword,
      decoration: InputDecoration(
        border: border,
        hintStyle: hintStyle,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ));
}

MaterialButton dfmaterialButton(
    {GlobalKey<FormState>? KeyTextFaild,
    required void Function()? onPressed,
    Color? color,
    required String title}) {
  return MaterialButton(
    color: Colors.blue,
    onPressed: onPressed,
    child: text(
      title: title,
      color: color ?? Colors.white,
    ),
  );
}

class ComToken {
  String? Token;
  void setToken(String token) {
    Token = token;
  }

  String? getToken() {
    return Token;
  }
}

Widget ContainerWidget({
  AlignmentGeometry? alignment,
  EdgeInsetsGeometry? padding,
  Color? color,
  BorderRadiusGeometry? borderRadius,
  double? width,
  double? height,
  Widget? child,
}) {
  return Container(
    height: height,
    width: width,
    child: child,
    alignment: alignment,
    color: color,
    padding: padding,
    decoration: BoxDecoration(borderRadius: borderRadius, color: color),
  );
}

Widget ButtonStaic(
    {Function()? onTap,
    double? widthContainer,
    double? heightContainer,
    double? radius,
    List<Color>? colors,
    AlignmentGeometry? beginGrident,
    AlignmentGeometry? endGrident,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    Color? colorText,
    TextAlign? textAlign,
    required BuildContext context,
    List<BoxShadow>? boxShadow}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: widthContainer ?? MediaQuery.of(context).size.width * 0.80,
      height: heightContainer ?? MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 15.0),
        gradient: LinearGradient(
          colors: colors ?? [Color0, Color0],
          begin: beginGrident ?? Alignment.topLeft,
          end: endGrident ?? Alignment.bottomRight,
        ),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Color0.withOpacity(0.5),
                spreadRadius: 2.0,
                blurRadius: 10.0,
                offset: Offset(-1, 6),
              ),
            ],
      ),
      child: Center(
        child: text(
          title: title,
          color: colorText ?? Color3,
          fontSize: fontSize ?? 16.0,
          fontWeight: fontWeight ?? FontWeight.w700,
        ),
      ),
    ),
  );
}

SpinKitWave SpinkitWave() {
  return SpinKitWave(
    size: 60,
    itemCount: 15,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Color0 : Color4,
        ),
      );
    },
  );
}

Widget TextFieldWidght(
    {double? widthC,
    double? heightC,
    Color? colorBorder,
    double? widthBorder,
    double? radius,
    required BuildContext context,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Color? colorhint,
    String? messageForm,
    String? hintText,
    Widget? suffixIcon,
    bool obscureText = false}) {
//////////////////////
  ///
  ///
  ///

  return Container(
    width: widthC ?? MediaQuery.of(context).size.width * 0.90,
    height: heightC ?? MediaQuery.of(context).size.height * 0.080,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      border: Border.all(
        color: colorBorder ?? Color0,
        width: widthBorder ?? 1.0,
      ),
      borderRadius: BorderRadius.circular(radius ?? 15.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return messageForm;
          }
          return null;
        },
        obscureText: obscureText,
        keyboardType: keyboardType ?? TextInputType.number,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontFamily: 'Caveat',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colorhint ?? Color5,
          ),
          hintText: hintText ?? "050 3140232",
        ),
      ),
    ),
  );
}

///////////////////
////TextField
///
///
///
///homeGesdedector
Widget HomeGesdector(
    {Function()? onTap,
    double? radiusCirleAvatar,
    required IconData? icon,
    required String title}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
            radius: radiusCirleAvatar ?? 20,
            backgroundColor: Colors.transparent,
            child: Icon(
              icon,
              size: 30,
              color: Color3,
            )),
        text(
            title: title,
            color: Color3,
            fontSize: 13,
            fontWeight: FontWeight.w400)
      ],
    ),
  );
}

Widget ListCirclePerson({
  required String title,
  Function()? onTap,
  required int indexImage,
  String? ImageNetWork,
  required BuildContext context,
  double? redius,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Center(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // CircleAvatar(
              //   radius: 33,
              //   backgroundColor: Color0,
              // ),
              // CircleAvatar(
              //   radius: 31,
              //   backgroundColor: Colors.white,
              // ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.17,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(redius ?? 15.0)),
                // radius: 28,
                clipBehavior: Clip.antiAlias,
                // backgroundColor: Colors.transparent,
                child: Image.network(
                  ImageNetWork ?? 'assets/images/main/right-arrow.png',
                  fit: BoxFit.cover,
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: text(
                    title: title,
                    color: Color3,
                    fontSize: 14,
                    // textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),

        ////////////////////////////
      ],
    ),
  );
}

Widget ButtonMenu({
  required BuildContext context,
  Function()? onTap,
  Function()? onTapArrow,
  required String data,
  String? image,
}) {
  return Center(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .90,
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(color: Color1, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .03,
            ),
            image == null
                ? Container(
                    width: 35,
                  )
                : Container(
                    width: 35,
                    child: Image.asset(
                      'assets/images/main/${image.toString()}.png',
                      // fit: BoxFit.cover,
                      width: 35,
                      height: 35,
                    ),
                  ),
            SizedBox(width: 8.0),
            text(title: data),
            Spacer(),
            GestureDetector(
              onTap: onTapArrow,
              child: Container(
                width: 35,
                child: Image.asset(
                  'assets/images/main/right-arrow.png',
                  // fit: BoxFit.cover,
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .03,
            ),
          ],
        ),
      ),
    ),
  );
}

class ShimerWidght extends StatelessWidget {
  const ShimerWidght(
      {super.key, required this.width, required this.height, this.reduis});
  final double width, height;
  final double? reduis;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color0.withOpacity(0.7),
      period: Duration(seconds: 1),
      highlightColor: Colors.yellow.withOpacity(0.1),
      child: Container(
        width: this.width,
        height: this.height,
        decoration: BoxDecoration(
            color: Color0, borderRadius: BorderRadius.circular(reduis ?? 15.0)),
      ),
    );
  }
}
