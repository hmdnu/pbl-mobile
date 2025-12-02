import 'package:client/widgets/custom_button.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
>>>>>>> df6ceec9b4f93741fd5df84e66e67a5cdc93410e

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscureText = true;

<<<<<<< HEAD
  @override
  void initState() {
    super.initState();
    _emailController.text = 'admin@email.com';
    _passwordController.text = '123';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
=======
  Future<void> handleLogin(BuildContext context) async {
    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }

    final values = _formKey.currentState!.value;
    final email = values["email"];
    final password = values["password"];

    final login = await AuthService.instance.login(context, email, password);

    if (!context.mounted) return;

    if (!login["success"]) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email Atau Password Salah")));
      return;
    }

    if (login["isAdmin"]) {
      context.go("/admin");
    } else {
      context.go("/home");
    }
>>>>>>> df6ceec9b4f93741fd5df84e66e67a5cdc93410e
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              'Masuk',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              'Isi email dan password yang sesuai!',
              style: TextStyle(color: Color.fromRGBO(108, 114, 120, 1)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HRIS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                header(),

                // Email
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(color: Color.fromRGBO(108, 114, 120, 1)),
                  ),
                ),
                const SizedBox(height: 5),
                FormBuilderTextField(
                  name: "email",
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: "Email harus diisi",
                    ),
                    FormBuilderValidators.email(errorText: "Email harus valid"),
                  ]),
                ),
                const SizedBox(height: 20),
                // Password
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(color: Color.fromRGBO(108, 114, 120, 1)),
                  ),
                ),
                const SizedBox(height: 5),
                FormBuilderTextField(
                  name: "password",
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => _obscureText = !_obscureText);
                      },
                    ),
                  ),
<<<<<<< HEAD
                ],
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Lupa Password",
                    style: TextStyle(color: Color.fromRGBO(29, 97, 231, 1)),
=======
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: "Password harus diisi",
                    ),
                  ]),
                ),

                const SizedBox(height: 5),

                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => context.push("/forgot-password"),
                    child: const Text(
                      "Lupa Password",
                      style: TextStyle(color: Color.fromRGBO(29, 97, 231, 1)),
                    ),
>>>>>>> df6ceec9b4f93741fd5df84e66e67a5cdc93410e
                  ),
                ),

<<<<<<< HEAD
              SizedBox(height: 20),
              // button
              CustomButton(
                backgroundColor: const Color.fromRGBO(29, 97, 231, 1),
                child: Text("Masuk"),
                onPressed: () {},
              ),
            ],
=======
                const SizedBox(height: 20),

                // Button
                CustomButton(
                  backgroundColor: const Color.fromRGBO(29, 97, 231, 1),
                  onPressed: () => handleLogin(context),
                  child: const Text("Masuk"),
                ),
              ],
            ),
>>>>>>> df6ceec9b4f93741fd5df84e66e67a5cdc93410e
          ),
        ),
      ),
    );
  }
}
