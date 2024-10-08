// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:consulta_cep/service/viacep_service.dart';
import 'package:flutter/material.dart';

class TelaConsulta extends StatefulWidget {
  const TelaConsulta({super.key});

  @override
  State<TelaConsulta> createState() => _TelaConsultaState();
}

class _TelaConsultaState extends State<TelaConsulta> {
  final TextEditingController _cepController = TextEditingController();
  String _resultadoCep = '';
  String _resultadoLog = '';
  String _resultadoBairro = '';
  String _resultadoLoc = '';
  String _resultadoUf = '';

  String _resultadoErro = '';

  void _buscarCep() async {
    final cep = _cepController.text;
    final resultado = await consultaCep(cep);

    final resultadoCep = resultado?['cep'];
    final resultadoLog = resultado?['logradouro'];
    final resultadoBairro = resultado?['bairro'];
    final resultadoLoc = resultado?['localidade'];
    final resultadoUf = resultado?['uf'];

    setState(() {
      if (resultado != null) {
        _resultadoCep = resultadoCep ?? '';
        _resultadoLog = resultadoLog ?? '';
        _resultadoBairro = resultadoBairro ?? '';
        _resultadoLoc = resultadoLoc ?? '';
        _resultadoUf = resultadoUf ?? '';
        _resultadoErro = '';
      } else {
        _resultadoErro = 'CEP não encontrado ou inválido!';
        _resultadoCep = '';
        _resultadoLog = '';
        _resultadoBairro = '';
        _resultadoLoc = '';
        _resultadoUf = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthTela = MediaQuery.of(context).size.width;
    // final heightTela = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 162, 0, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Busca CEP',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                child: TextFormField(
                  controller: _cepController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: 'Informe o CEP',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 162, 0, 255),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 162, 0, 255),
                        width: 2,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 162, 0, 255),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: _buscarCep,
                child: Container(
                  width: widthTela * 0.8,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Color.fromARGB(255, 162, 0, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Consultar CEP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_resultadoErro.isNotEmpty)
                Text(
                  _resultadoErro,
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 20),
              if (_resultadoCep.isNotEmpty ||
                  _resultadoBairro.isNotEmpty ||
                  _resultadoLoc.isNotEmpty ||
                  _resultadoLog.isNotEmpty ||
                  _resultadoUf.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(10),
                  width: widthTela * 0.9,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 199, 131, 238),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(5, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      if (_resultadoCep.isNotEmpty)
                        Row(
                          children: [
                            const Text(
                              'CEP:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _resultadoCep,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      if (_resultadoLog.isNotEmpty)
                        Row(
                          children: [
                            const Text(
                              'Logradouro:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _resultadoLog,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      if (_resultadoBairro.isNotEmpty)
                        Row(
                          children: [
                            const Text(
                              'Bairro:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _resultadoBairro,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      if (_resultadoLoc.isNotEmpty)
                        Row(
                          children: [
                            const Text(
                              'Cidade:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _resultadoLoc,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      if (_resultadoUf.isNotEmpty)
                        Row(
                          children: [
                            const Text(
                              'Estado:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _resultadoUf,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
