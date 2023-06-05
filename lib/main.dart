import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(title: 'Login'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Mail"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su mail';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Contraseña"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (emailController.text == "jtorres@gmail.com" && passwordController.text == "1234utn") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage(
                                  name: "Juan Torres",
                                )),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Credenciales invalidas')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Por favor complete el formulario')),
                        );
                      }
                    },
                    child: const Text('Ingresar'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(title: 'Registro'),
                        ),
                      );
                    },
                    child: const Text('Registrarse'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.name});

  final String name;

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  // Variable para almacenar el valor seleccionado del RadioButton
  int? _radioValue;
  String? _selectedImage;

  // Variables para almacenar el estado de los CheckBox
  bool _checkbox1Value = false;
  bool _checkbox2Value = false;
  bool _checkbox3Value = false;
  bool _checkbox4Value = false;
  bool _checkbox5Value = false;

  // Controlador para el campo de texto libre
  TextEditingController _textFieldController = TextEditingController();

  void _setImageBasedOnRadioValue(int? value) {
    setState(() {
      switch (value) {
        case 1:
          _selectedImage = 'assets/images/logoandroid.png';
          break;
        case 2:
          _selectedImage = 'assets/images/logoios.png';
          break;
        default:
          _selectedImage = null;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          child:Column(
                children: [
                  Text("Bienvenido: "+widget.name),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Android'),
                          leading: Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: (value) {
                              setState(() {
                                _radioValue = value as int?;
                              });
                              _setImageBasedOnRadioValue(value as int?);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                      child: ListTile(
                        title: const Text('Ios'),
                        leading: Radio(
                          value: 2,
                          groupValue: _radioValue,
                          onChanged: (value) {
                            setState(() {
                              _radioValue = value as int?;
                            });
                            _setImageBasedOnRadioValue(value as int?);
                          },
                        ),
                      ),
                      )
                    ],
                  ),
                  if (_selectedImage != null)
                    Image.asset(
                      _selectedImage!,
                      width: 100,
                      height: 100,
                    ),
                  CheckboxListTile(
                    title: const Text('Programación'),
                    value: _checkbox1Value,
                    onChanged: (value) {
                      setState(() {
                        _checkbox1Value = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Redes'),
                    value: _checkbox2Value,
                    onChanged: (value) {
                      setState(() {
                        _checkbox2Value = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Seguridad'),
                    value: _checkbox3Value,
                    onChanged: (value) {
                      setState(() {
                        _checkbox3Value = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Hardware'),
                    value: _checkbox4Value,
                    onChanged: (value) {
                      setState(() {
                        _checkbox4Value = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Otra'),
                    value: _checkbox5Value,
                    onChanged: (value) {
                      setState(() {
                        _checkbox5Value = value!;
                      });
                    },
                  ),
                  if (_checkbox5Value) // Mostrar el campo de texto solo si el CheckBox 4 está seleccionado
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _textFieldController,
                        decoration: const InputDecoration(
                          labelText: 'Texto libre',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Volver"),
                    ),
                  ),
                ],
              )));
  }
}

class Register extends StatefulWidget {
  const Register({Key? key, required this.title});

  final String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Mail"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su mail';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Nombre y Apellido"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su Nombre y Apellido';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Contraseña"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: repasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Repetir Contraseña"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor repita su contraseña';
                      }
                      if (value != passwordController.text){
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Aquí puedes implementar la lógica de registro
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Registro exitoso')),
                          );
                          Navigator.pop(context); // Volver a la pantalla de inicio de sesión
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Por favor complete el formulario')),
                          );
                        }
                      },
                      child: const Text('Registrarse'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




