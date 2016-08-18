<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Calculadora</title>
</head>

<%! private int valor1;
    private int valor2;
    private Double result;
    private String operation;
    private String num1;
    private String num2;

    public boolean validateFields(String num1, String num2){
      if((num1 != null && !num1.equals(""))  && (num2 != null && !num2.equals("")))
        return true;
      return false;
    }

    private Double doOperation(int valor1, int valor2, String operation) {

      if (operation.equals("soma"))
        return new Double(valor1 + valor2).doubleValue();
      else if (operation.equals("subtracao"))
        return new Double(valor1 - valor2).doubleValue();
      else if (operation.equals("multiplicacao"))
        return new Double(valor1 * valor2).doubleValue();
      else if (operation.equals("divisao"))
        return new Double(valor1 / valor2).doubleValue();
      else
        return Math.sqrt(valor1);
    }

%>

<body>
  <h1>Calculadora</h1>

  <form action="index.jsp" method="GET">
    <div>
      <label for="val1">Valor 1</label>
      <input name="val1" type="text" /><br />
    </div>
    <div>
      <label for="val2">Valor 2</label>
      <input name="val2" type="text" /><br />
    </div>
    <div>
      <label for="operacao">Escolha a Operação</label>
      <select name="operacao">
        <option value="soma">Soma</option>
        <option value="subtracao">Subtração</option>
        <option value="multiplicacao">Multiplicação</option>
        <option value="divisao">Divisão</option>
        <option value="raiz">Raiz Quadrada</option>
      </select>
    </div>
    <p><input type="submit" value="Efetuar Cálculo">
  </form>

<%
  num1 = request.getParameter("val1");
  num2 = request.getParameter("val2");
  operation = request.getParameter("operacao");

  if(validateFields(num1, num2)){
    valor1 = Integer.parseInt(num1);
    valor2 = Integer.parseInt(num2);

    result = doOperation(valor1, valor2, operation);

%>
  <div>
    <h3>O Resultado da <%= operation %> de <%= num1 %> e <%= num2 %> é <%= result %>></h3>
  </div>
<% }
%>

</body>
</html>
