import 'package:flutter/material.dart';
import 'package:flutter_news/common/apis/api.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/screen.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/value.dart';
import 'package:flutter_news/common/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // email的控制器
  final TextEditingController _emailController = TextEditingController();

  // 密码的控制器
  final TextEditingController _passController = TextEditingController();

  // 跳转 注册页面
  _handleNavSignUp() {
    Navigator.pushNamed(context, "/sign-up");
  }

  // 执行登录操作
  _handleSignIn() async {
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: "邮箱格式不正确");
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: "密码不能小于6位");
      return;
    }

    UserRequestEntity params = UserRequestEntity(
        email: _emailController.value.text,
        password: duSHA256(_passController.value.text));

    UserResponseEntity res = await UserApi.login(params: params);
    print(res);
  }


  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)), // 顶部系统栏 44px
      child: Column(
        //设置交叉轴方向的对齐方式 子孩子控件完全填充交叉轴方向的空间
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: duSetWidth(76),
            height: duSetHeight(76),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            child: Image.asset("assets/images/logo.png"),
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              shape: BoxShape.circle, // 指定为圆形
              boxShadow: [
                Shadows.primaryShadow,
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: duSetFontSize(16),
                height: 1),
          )
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // 邮箱输入框
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            marginTop: 0,
          ),
          // 密码输入框
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),

          // 注册,登录,横向布局
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              children: [
                // 注册
                btnFlatButtonWidget(
                  onPressed: _handleNavSignUp,
                  gbColor: AppColors.thirdElement,
                  title: "Sign up",
                ),
                Spacer(),
                // 登录
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: AppColors.primaryElement,
                  title: "Sign In",
                )
              ],
            ),
          ),

          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: FlatButton(
              onPressed: () => {},
              child: Text(
                "Fogot password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.secondaryElementText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    fontSize: duSetFontSize(16),
                    height: 1 //  设置下行高,否则字体下沉
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          //title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {},
                    width: 88,
                    iconFileName: "twitter"
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {},
                    width: 88,
                    iconFileName: "google"
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {},
                    width: 88,
                    iconFileName: "facebook"
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetWidth(20)),
      child: btnFlatButtonWidget(onPressed: _handleNavSignUp,
          width: 294,
          gbColor: AppColors.secondaryElement,
          fontColor: AppColors.primaryText,
          title: "Sign up",
          fontWeight: FontWeight.w500,
          fontSize: 16

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignUpButton()
          ],
        ),
      ),
    );
  }
}
