<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .calculator {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .display {
            width: 100%;
            height: 50px;
            margin-bottom: 20px;
            font-size: 1.5em;
            text-align: right;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f9f9f9;
        }
        .buttons {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        button {
            font-size: 1.2em;
            padding: 15px;
            border: none;
            border-radius: 5px;
            background: #6200ea;
            color: #fff;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background: #3700b3;
        }
        button:active {
            background: #1c0070;
        }
    </style>
</head>
<body>
    <div class="calculator">
        <input type="text" class="display" id="display" disabled>
        <div class="buttons">
            <button onclick="appendValue('7')">7</button>
            <button onclick="appendValue('8')">8</button>
            <button onclick="appendValue('9')">9</button>
            <button onclick="setOperation('/')">/</button>

            <button onclick="appendValue('4')">4</button>
            <button onclick="appendValue('5')">5</button>
            <button onclick="appendValue('6')">6</button>
            <button onclick="setOperation('*')">x</button>

            <button onclick="appendValue('1')">1</button>
            <button onclick="appendValue('2')">2</button>
            <button onclick="appendValue('3')">3</button>
            <button onclick="setOperation('-')">-</button>

            <button onclick="clearDisplay()">C</button>
            <button onclick="appendValue('0')">0</button>
            <button onclick="calculateResult()">=</button>
            <button onclick="setOperation('+')">+</button>
        </div>
    </div>

    <script>
        let firstOperand = null;
        let operation = null;
        let shouldResetDisplay = false;

        function appendValue(value) {
            const display = document.getElementById('display');
            if (shouldResetDisplay) {
                display.value = '';
                shouldResetDisplay = false;
            }
            display.value += value;
        }

        function setOperation(op) {
            const display = document.getElementById('display');
            if (firstOperand === null) {
                firstOperand = parseFloat(display.value);
            } else if (operation) {
                const result = calculate(parseFloat(display.value));
                display.value = result;
                firstOperand = result;
            }
            operation = op;
            shouldResetDisplay = true;
        }

        function calculate(secondOperand) {
            switch (operation) {
                case '+':
                    return firstOperand + secondOperand;
                case '-':
                    return firstOperand - secondOperand;
                case '*':
                    return firstOperand * secondOperand;
                case '/':
                    return secondOperand !== 0 ? firstOperand / secondOperand : 'Erro';
                default:
                    return secondOperand;
            }
        }

        function calculateResult() {
            const display = document.getElementById('display');
            if (operation && firstOperand !== null) {
                display.value = calculate(parseFloat(display.value));
                firstOperand = null;
                operation = null;
                shouldResetDisplay = true;
            }
        }

        function clearDisplay() {
            const display = document.getElementById('display');
            display.value = '';
            firstOperand = null;
            operation = null;
        }
    </script>
</body>
</html>
