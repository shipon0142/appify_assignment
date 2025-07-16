import 'package:auto_route/auto_route.dart';
import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/core/local_cache/cache_utils.dart';
import 'package:code_base/core/utility/constants/custom_spacing.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/presentation/manager/login/login_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_router.gr.dart';
import '../../../../core/utility/constants/color_manager.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var loginBloc = injector<LoginBloc>();

  @override
  void initState() {

    loginBloc.stream.listen((state) async {
      if (state is LoginSuccess) {
        final cache = await CacheUtils.getInstance();
        cache.saveToken(state.response);
        AutoRouter.of(context).push(DashboardRoute());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF023D45),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20,20,20,MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16,
                    ),
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'E',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Z',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 40,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'ezycourse',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'The Best Online Learning Platform',
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white.withOpacity(0.1),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white.withOpacity(0.1),
                    filled: true),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    loginBloc.add(GetLogin(payload: LoginRequestParams(email: _emailController.text,password: _passwordController.text)));
                  },
                  child: const Text("Log In"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
