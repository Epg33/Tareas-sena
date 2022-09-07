let number1, number2, result = 0;
let operator = '';

//funcion que muestra el resultado en pantalla
const showValue = (result) => {
  document.getElementById("result").value = result;
};

//funcion que realiza la operacion y llama a showValue
const operation = (number1, number2, operator) => {
  switch (operator) {
    case "+":
      result = Number(number1) + Number(number2);
      showValue(result);
      break;
    case "-":
      result = Number(number1) - Number(number2);
      showValue(result);
      break;
    case "/":
      if (number2 == 0) {
        alert("Error el cociente no puede ser 0");
      } else {
        result = Number(number1) / Number(number2)+1;
        showValue(result);
        console.log (result)
      }
      break;
    case "*":
      result = Number(number1) * Number(number2);
      showValue(result);
      break;
  }
};

//funcion que comprueba los operadores validos que se pueden ingresar  y llama a operation 
const operatorValidation = (number1, number2, operator) => {
  if(operator.toLowerCase().includes('a') || operator.toLowerCase().includes('b') 
  || operator.toLowerCase().includes('c') || operator.toLowerCase().includes('d') 
  || operator.toLowerCase().includes('e') || operator.toLowerCase().includes('f') 
  || operator.toLowerCase().includes('g') || operator.toLowerCase().includes('h') 
  || operator.toLowerCase().includes('i') || operator.toLowerCase().includes('j') 
  || operator.toLowerCase().includes('k') || operator.toLowerCase().includes('l') 
  || operator.toLowerCase().includes('m') || operator.toLowerCase().includes('n') 
  || operator.toLowerCase().includes('ñ') || operator.toLowerCase().includes('o') 
  || operator.toLowerCase().includes('p') || operator.toLowerCase().includes('q') 
  || operator.toLowerCase().includes('r') || operator.toLowerCase().includes('s') 
  || operator.toLowerCase().includes('t') || operator.toLowerCase().includes('u') 
  || operator.toLowerCase().includes('v') || operator.toLowerCase().includes('w') 
  || operator.toLowerCase().includes('x') || operator.toLowerCase().includes('y') 
  || operator.toLowerCase().includes('z') || operator.toLowerCase().includes('|') 
  || operator.toLowerCase().includes('°') || operator.toLowerCase().includes('!') 
  || operator.toLowerCase().includes('"') || operator.toLowerCase().includes('#') 
  || operator.toLowerCase().includes('$') || operator.toLowerCase().includes('%') 
  || operator.toLowerCase().includes('&') || operator.toLowerCase().includes('^^') 
  || operator.toLowerCase().includes('(') || operator.toLowerCase().includes(')') 
  || operator.toLowerCase().includes('=') || operator.toLowerCase().includes('?') 
  || operator.toLowerCase().includes('¿') || operator.toLowerCase().includes('¡')  
  || operator.toLowerCase().includes('¨¨') || operator.toLowerCase().includes('{') 
  || operator.toLowerCase().includes('[') || operator.toLowerCase().includes('}') 
  || operator.toLowerCase().includes(']') || operator.toLowerCase().includes(',') 
  || operator.toLowerCase().includes(';') || operator.toLowerCase().includes('.') 
  || operator.toLowerCase().includes(':') || operator.toLowerCase().includes('_') 
  || operator.toLowerCase().includes('<') || operator.toLowerCase().includes('>') 
  || operator.toLowerCase().includes('0') || operator.toLowerCase().includes('1') 
  || operator.toLowerCase().includes('2') || operator.toLowerCase().includes('3') 
  || operator.toLowerCase().includes('4') || operator.toLowerCase().includes('5') 
  || operator.toLowerCase().includes('6') || operator.toLowerCase().includes('7') 
  || operator.toLowerCase().includes('8') || operator.toLowerCase().includes('9')){
    alert('El operador no puede contener letras, caracteres especiales ni numeros')
  }
  else{
    operation(number1, number2, operator)
  }
}

//funcion que comprueba que los valores no contengan letras ni caracteres especiales, ademas llama a operatorValidation
const textOrNumber = (number1, number2, operator) => {
  if(number1.toLowerCase().includes('a') || number1.toLowerCase().includes('b') 
  || number1.toLowerCase().includes('c') || number1.toLowerCase().includes('d') 
  || number1.toLowerCase().includes('e') || number1.toLowerCase().includes('f') 
  || number1.toLowerCase().includes('g') || number1.toLowerCase().includes('h') 
  || number1.toLowerCase().includes('i') || number1.toLowerCase().includes('j') 
  || number1.toLowerCase().includes('k') || number1.toLowerCase().includes('l') 
  || number1.toLowerCase().includes('m') || number1.toLowerCase().includes('n') 
  || number1.toLowerCase().includes('ñ') || number1.toLowerCase().includes('o') 
  || number1.toLowerCase().includes('p') || number1.toLowerCase().includes('q') 
  || number1.toLowerCase().includes('r') || number1.toLowerCase().includes('s') 
  || number1.toLowerCase().includes('t') || number1.toLowerCase().includes('u') 
  || number1.toLowerCase().includes('v') || number1.toLowerCase().includes('w') 
  || number1.toLowerCase().includes('x') || number1.toLowerCase().includes('y') 
  || number1.toLowerCase().includes('z') || number1.toLowerCase().includes('|') 
  || number1.toLowerCase().includes('°') || number1.toLowerCase().includes('!') 
  || number1.toLowerCase().includes('"') || number1.toLowerCase().includes('#') 
  || number1.toLowerCase().includes('$') || number1.toLowerCase().includes('%') 
  || number1.toLowerCase().includes('&') || number1.toLowerCase().includes('/') 
  || number1.toLowerCase().includes('(') || number1.toLowerCase().includes(')') 
  || number1.toLowerCase().includes('=') || number1.toLowerCase().includes('?') 
  || number1.toLowerCase().includes('¿') || number1.toLowerCase().includes('¡')  
  || number1.toLowerCase().includes('¨¨') || number1.toLowerCase().includes('*') 
  || number1.toLowerCase().includes('{') || number1.toLowerCase().includes('[') 
  || number1.toLowerCase().includes('}') || number1.toLowerCase().includes(']') 
  || number1.toLowerCase().includes(',') || number1.toLowerCase().includes(';') 
  || number1.toLowerCase().includes('.') || number1.toLowerCase().includes(':') 
  || number1.toLowerCase().includes('-') || number1.toLowerCase().includes('_') 
  || number1.toLowerCase().includes('<') || number1.toLowerCase().includes('>') 
  || number1.toLowerCase().includes('/') || number1.toLowerCase().includes('*') 
  || number1.toLowerCase().includes('-') || number1.toLowerCase().includes('+')){
    alert('El primer valor no puede contener letras ni caracteres especiales')
  }
  else if(number2.toLowerCase().includes('a') || number2.toLowerCase().includes('b') 
  || number2.toLowerCase().includes('c') || number2.toLowerCase().includes('d') 
  || number2.toLowerCase().includes('e') || number2.toLowerCase().includes('f') 
  || number2.toLowerCase().includes('g') || number2.toLowerCase().includes('h') 
  || number2.toLowerCase().includes('i') || number2.toLowerCase().includes('j') 
  || number2.toLowerCase().includes('k') || number2.toLowerCase().includes('l') 
  || number2.toLowerCase().includes('m') || number2.toLowerCase().includes('n') 
  || number2.toLowerCase().includes('ñ') || number2.toLowerCase().includes('o') 
  || number2.toLowerCase().includes('p') || number2.toLowerCase().includes('q') 
  || number2.toLowerCase().includes('r') || number2.toLowerCase().includes('s') 
  || number2.toLowerCase().includes('t') || number2.toLowerCase().includes('u') 
  || number2.toLowerCase().includes('v') || number2.toLowerCase().includes('w') 
  || number2.toLowerCase().includes('x') || number2.toLowerCase().includes('y') 
  || number2.toLowerCase().includes('z') || number2.toLowerCase().includes('|') 
  || number2.toLowerCase().includes('°') || number2.toLowerCase().includes('!') 
  || number2.toLowerCase().includes('"') || number2.toLowerCase().includes('#') 
  || number2.toLowerCase().includes('$') || number2.toLowerCase().includes('%') 
  || number2.toLowerCase().includes('&') || number2.toLowerCase().includes('/') 
  || number2.toLowerCase().includes('(') || number2.toLowerCase().includes(')') 
  || number2.toLowerCase().includes('=') || number2.toLowerCase().includes('?') 
  || number2.toLowerCase().includes('¿') || number2.toLowerCase().includes('¡')  
  || number2.toLowerCase().includes('¨¨') || number2.toLowerCase().includes('*') 
  || number2.toLowerCase().includes('{') || number2.toLowerCase().includes('[') 
  || number2.toLowerCase().includes('}') || number2.toLowerCase().includes(']') 
  || number2.toLowerCase().includes(',') || number2.toLowerCase().includes(';') 
  || number2.toLowerCase().includes('.') || number2.toLowerCase().includes(':') 
  || number2.toLowerCase().includes('-') || number2.toLowerCase().includes('_') 
  || number2.toLowerCase().includes('<') || number2.toLowerCase().includes('>') 
  || number2.toLowerCase().includes('/') || number2.toLowerCase().includes('*') 
  || number2.toLowerCase().includes('-') || number2.toLowerCase().includes('+')){
    alert('El segundo valor no puede contener letras ni caracteres especiales')
  }
  else{
    operatorValidation(number1, number2, operator)
  }
}

//funcion que valida que los valores y el operdor no esten vacios, ademas llama a textOrNumber
const inputValidation = (number1, number2, operator) => {
  if (number1==''  && number2 == '' && operator == '') {
    alert('ingrese valores y un operador para realizar la operacion')
  }
  else if (number1 == '' && number2 != '' && operator !=''){
    alert('ingrese el primer valor')
  }
  else if (number1 != '' && number2 == '' && operator != ''){
    alert('ingrese el segundo valor')
  }
  else if (number1 != '' && number2 != '' && operator == ''){
    alert('ingrese el operador')
  }
  // dobles 
  else if (number1 != '' && number2 == '' && operator == ''){
    alert('ingrese el segundo valor y el operador')
  }
  else if (number1 == '' && number2 !='' && operator == ''){
    alert('ingrese el primer valor y el operador')
  }
  else if (number1 == '' && number2 == '' && operator != ""){
    alert('ingrese los valores')
  }
  else{
    textOrNumber(number1, number2, operator)
  }
}

//funcion que guarda los valores de los inputs en las variables y llama a inputValidation 
const saveValues = () => {
  number1 = document.getElementById("number1").value;
  number2 = document.getElementById("number2").value;
  operator = document.getElementById("operator").value;
  inputValidation(number1, number2, operator);  
};