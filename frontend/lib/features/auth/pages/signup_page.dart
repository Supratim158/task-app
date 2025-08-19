import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/login_page.dart';

class SignupPage extends StatefulWidget {

  static route() => MaterialPageRoute(builder: (context) => SignupPage());

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void signUpUser(){
    if(formKey.currentState!.validate()){
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign Up.",style:  TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),),

              const SizedBox(height: 50,),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.black54),
                ),
                validator: (value){
                  if(value==null || value.trim().isEmpty){
                    return "Name field is Requires !!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15,),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black54),
                ),
                validator: (value){
                  if(value==null || value.trim().isEmpty || !value.trim().contains("@")){
                    return "Enter a valid Email !!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15,),

              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black54),
                ),
                validator: (value){
                  if(value==null || value.trim().isEmpty || value.trim().length < 5){
                    return "Password must be more than 5 characters!!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25,),

              ElevatedButton(
                  onPressed: signUpUser,
                  child: const Text("SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  )),
              const SizedBox(height: 7,),

              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(LoginPage.route());
                },
                child: RichText(
                      text:
                      TextSpan(
                          text: "Already have an account !!  ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children:const [

                          TextSpan(text: "Sign In",
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                          ),
                        ],

                      ),
                  ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
