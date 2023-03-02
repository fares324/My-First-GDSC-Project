import 'package:flutter/material.dart';
import 'package:flutter_application_1/AnimatedList.dart';
import 'package:flutter_application_1/Login_Screen_GDSC.dart';
import 'package:flutter_application_1/RegisterScreen_GDSC.dart';
import 'package:flutter_application_1/shared/components/compnents.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  @override
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPasswordShown = true;
  bool isConfirmPasswordShown = true;


  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Stack(children: [
                  Container(
                    height: size.height / 3,
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 30,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  )
                ]),
              ),
              SizedBox(
                height: size.height / 25,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MYTextFormFiled(
                    controller: nameController,
                    type: TextInputType.name,
                    label: 'Full Name',
                    prefix: const Icon(Icons.person,color: Colors.purple,),
                    validator: (Value) {
                      if (Value!.isEmpty) {
                        return 'Name Must Not Be Empty';
                      }
                      
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MYTextFormFiled(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    label: 'Email',
                    prefix: const Icon(Icons.email,color: Colors.purple,),
                    validator: (Value) {
                      if (Value!.isEmpty) {
                        return 'Email Address Must Not Be Empty';
                      }
                       else if (emailController.text.contains('@') == false ||
                          emailController.text.contains('.')) {
                        return ' Please Enter Valid Email';
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MYTextFormFiled(
                    controller: phoneController,
                    type: TextInputType.phone,
                    label: 'Phone Number',
                    prefix: const Icon(Icons.phone,color: Colors.purple,),
                    validator: (Value) {
                      if (Value!.isEmpty) {
                        return 'Phone Number Must Not Be Empty';
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MYTextFormFiled(
                  
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: const Icon(Icons.lock ,color: Colors.purple,),
                    suffix: isPasswordShown
                        ? const Icon(Icons.visibility,
                      color: Colors.purple)
                        : const Icon(Icons.visibility_off,
                      color: Colors.purple),
                    suffixPressed: () {
                      setState(() {
                        isPasswordShown = !isPasswordShown;
                      });
                    },
                    isPasswordOnsecure: isPasswordShown,
                    onChange: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MYTextFormFiled(
                    controller: confirmPasswordController,
                    type: TextInputType.visiblePassword,
                    label: 'Confirm Password',
                    prefix: const Icon(Icons.lock,color: Colors.purple,),
                    suffix: isConfirmPasswordShown
                        ? const Icon(Icons.visibility,
                      color: Colors.purple)
                        : const Icon(Icons.visibility_off,
                      color: Colors.purple),
                    suffixPressed: () {
                      setState(() {
                        isConfirmPasswordShown = !isConfirmPasswordShown;
                      });
                    },
                    isPasswordOnsecure: isConfirmPasswordShown,
                    onChange: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      }
                      return null;
                    }),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 3.3,
                        vertical: size.height / 60)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(emailController.text);
                    print(passwordController.text);
                    print(nameController.text);
                    print(phoneController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return animatedList();
                    }));
                  }
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 3, vertical: size.height / 60),
                  side: const BorderSide(
                    color: Colors.purpleAccent,
                    width: 1,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login_Screen();
                  }));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              SizedBox(height: size.height / 10),
            ],
          ),
        ),
      ),
    );
  }
}
