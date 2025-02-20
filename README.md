# 🖩 **Assembly Language Calculator**

## **📖 About the Project**
This project is an **educational assembly language calculator** that performs basic arithmetic operations:  
➕ Addition  
➖ Subtraction  
✖️ Multiplication  
➗ Division (with division-by-zero error handling)  

The program runs in a loop, continuously asking the user for input until they enter `-666` to exit.  
At the end of execution, it displays the **total number of operations performed** during the session.

---

## **⚠️ Disclaimer**
This program is strictly for **educational purposes only**.  
❌ **It should not be used in real-world financial or production systems.**  
❌ **It does not handle advanced floating-point arithmetic.**  
✅ **The purpose of this code is to demonstrate assembly programming concepts like loops, conditionals, function calls, and user input handling.**  

---

## **🛠 Features**
✅ **Basic Arithmetic Operations** (Add, Subtract, Multiply, Divide)  
✅ **Looping Mechanism** (Continuous calculations until user exits)  
✅ **Input Validation** (Handles invalid input and division by zero)  
✅ **Session Summary** (Displays total operations performed upon exit)  
✅ **Exit Condition** (`-666` to quit the program)  

---

## **📜 How the Code Works**
1. The program prompts the user to enter **two integers**.  
2. If the user enters `-666` for either integer, the program **exits** and displays a summary.  
3. The user selects an **operation**:  
   - `1` → Addition  
   - `2` → Subtraction  
   - `3` → Multiplication  
   - `4` → Division  
4. The program checks the input and performs the selected operation.  
5. If division by zero is attempted, the program **displays an error** and **asks for new inputs**.  
6. The **operation count** is incremented for each valid operation.  
7. The program **loops** back to allow another calculation.  

---

## **⚙️ Compilation & Execution**
To compile and run the assembly calculator, use the following commands in your **Linux terminal**:

```bash
# Assemble the .asm file into an object file
nasm -f elf32 calculatorfinal.asm -o calculator.o

# Link the object file and create an executable
gcc -m32 calculator.o -o calculator -nostartfiles 

# Run the calculator
./calculator
```

---

## **📝 Example Usage**
```
Enter integer 1: 10
Enter integer 2: 5
Choose operation - 1:Add, 2:Subtract, 3:Multiply, 4:Divide, -666:Exit: 1
Result: 15

Enter integer 1: 8
Enter integer 2: 2
Choose operation - 1:Add, 2:Subtract, 3:Multiply, 4:Divide, -666:Exit: 4
Result: 4

Enter integer 1: 7
Enter integer 2: 0
Choose operation - 1:Add, 2:Subtract, 3:Multiply, 4:Divide, -666:Exit: 4
Division by zero error. Please try again.

Enter integer 1: -666
Total operations performed: 2
```

---

## **💡 Key Assembly Concepts Used**
This project demonstrates key **assembly language** concepts, including:
- **System Calls** (`scanf`, `printf`)
- **Registers Usage** (`eax`, `ebx`, `esp`)
- **Conditional Branching** (`cmp`, `je`, `jmp`)
- **Looping Constructs** (`jmp input_loop`)
- **Arithmetic Operations** (`add`, `sub`, `imul`, `div`)
- **Error Handling** (Division by Zero Prevention)
- **Exit Mechanism** (`int 0x80` for program termination)

---

### License
This script is released under the **MIT License**, which allows modification, distribution, and use with minimal restrictions.