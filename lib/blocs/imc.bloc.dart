import 'package:flutter_masked_text/flutter_masked_text.dart';

class ImcBloc {
  var heightCtrl = new MaskedTextController(mask: '000');
  var weightCtrl = new MaskedTextController(mask: '000');
  var result = "Preencha os dados para calcular seu IMC";

  calculate() {
    double w = double.parse(weightCtrl.text);
    double h = double.parse(heightCtrl.text) / 100;
    double imc = w / (h * h);

    weightCtrl.text = "";
    heightCtrl.text = "";

    if (imc < 18.6) {
      double min = h * h * 18.6;
      double max = h * h * 24.9;
      result =
          "Abaixo do Peso\n Peso ideal entre ${min.toStringAsPrecision(4)} e ${max.toStringAsPrecision(4)}";
    } else if (imc >= 18.6 && imc <= 24.9) {
      result = "Peso Ideal (${imc.toStringAsPrecision(2)}";
    } else if (imc <= 29.9) {
      double min = h * h * 24.9;
      double max = h * h * 29.9;
      result =
          "Levemente acima do peso\n Peso ideal entre ${min.toStringAsPrecision(4)} e ${max.toStringAsPrecision(4)}";
    } else if (imc <= 34.9) {
      double min = h * h * 29.9;
      double max = h * h * 34.9;
      result =
          "Obesidade Grau I\n Peso ideal entre ${min.toStringAsPrecision(4)} e ${max.toStringAsPrecision(4)}";
    } else if (imc <= 39.9) {
      double min = h * h * 34.9;
      double max = h * h * 39.9;
      result =
          "Obesidade Grau II\n Peso ideal entre ${min.toStringAsPrecision(4)} e ${max.toStringAsPrecision(4)}";
    } else if (imc >= 39.9) {
      double max = h * h * 40;
      result =
          "Obesidade Grau III\n Peso ideal abaixo de ${max.toStringAsPrecision(4)}";
    }
  }
}
