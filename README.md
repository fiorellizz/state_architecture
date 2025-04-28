# Exemplo de Padrão de Projeto: State (Flutter)

Este projeto demonstra o **Padrão de Projeto Comportamental - State** usando Flutter.

O **Padrão State** permite que um objeto altere seu comportamento quando seu estado interno muda, parecendo que o objeto mudou sua classe.

---

## 🎯 Objetivo

Criar uma interface onde uma luz (representada por um ícone) pode ser alternada entre ligada e desligada, mudando seu comportamento e aparência de acordo com o estado atual.

---

## 🛠️ Estrutura do Projeto

- `LightState` (Interface): Define os métodos que todos os estados concretos devem implementar (`icon`, `color` e `toggle`).
- `LightOnState` e `LightOffState` (Estados Concretos): Implementam o comportamento para luz ligada e desligada.
- `LightSwitchContext` (Contexto): Armazena o estado atual e permite alternar entre os estados.
- `StatePatternScreen` (Tela Flutter): Interface que exibe o estado atual da luz e permite alternar via botão.
- `main.dart`: Inicializa a aplicação.

---

## 📸 Tela

- Ícone representando uma lâmpada (acesa ou apagada).
- Botão \"Alternar Luz\" que muda o estado e atualiza a interface.

---

## 🚀 Como Rodar

1. Clone este repositório ou copie os arquivos.
2. Garanta que você tenha o Flutter instalado ([Guia de Instalação Flutter](https://docs.flutter.dev/get-started/install)).
3. Execute o projeto:

```bash
flutter run
```