import 'package:flutter/material.dart';

// --- Interface de Estado ---
abstract class LightState {
  /// Ícone representando o estado
  IconData get icon;

  /// Cor representando o estado
  Color get color;

  /// Alterna para o próximo estado
  LightState toggle();
}

// --- Estados Concretos ---
// Essas classes representam estados específicos da luz: acesa (LightOnState) e apagada (LightOffState).
// Cada estado define como a luz deve se comportar (ícone, cor e próxima transição).

class LightOnState implements LightState {
  @override
  IconData get icon => Icons.lightbulb; // Ícone que representa a luz acesa.

  @override
  Color get color => Colors.amber; // Cor amarela para indicar luz ligada.

  @override
  LightState toggle() => LightOffState();
// Quando chamado, muda o estado atual para LightOffState (luz apagada).
}

class LightOffState implements LightState {
  @override
  IconData get icon =>
      Icons.lightbulb_outline; // Ícone que representa a luz apagada.

  @override
  Color get color => Colors.grey; // Cor cinza para indicar luz desligada.

  @override
  LightState toggle() => LightOnState();
// Quando chamado, muda o estado atual para LightOnState (luz ligada).
}

// --- Contexto ---
// A classe LightSwitchContext é responsável por controlar qual é o estado atual da luz.
// Ela mantém uma referência interna para o estado (acesa ou apagada)
// e delega as ações (como alternar entre estados) para o próprio estado atual.

class LightSwitchContext {
  LightState _state; // Estado atual da luz (ligada ou desligada).

  LightSwitchContext() : _state = LightOffState();
  // Inicialmente, a luz começa desligada.

  LightState get state => _state;
  // Permite acessar o estado atual para consultar ícone e cor.

  void toggle() {
    _state = _state.toggle();
    // Muda o estado atual chamando o método toggle() do próprio estado.
    // Cada estado sabe qual será o próximo estado a ser adotado.
  }
}

// --- Tela Flutter ---

class StatePatternScreen extends StatefulWidget {
  @override
  _StatePatternScreenState createState() => _StatePatternScreenState();
}

class _StatePatternScreenState extends State<StatePatternScreen> {
  final LightSwitchContext _contexto = LightSwitchContext();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demonstração do Padrão State'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _contexto.state.icon,
              size: 100,
              color: _contexto.state.color,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _contexto.toggle();
                });
              },
              child: Text(
                _contexto.state is LightOnState ? "Desligar" : "Ligar",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
