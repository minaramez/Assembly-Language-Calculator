section .data
    input_prompt1 db "Enter integer 1: ", 0
    input_prompt2 db "Enter integer 2: ", 0
    operation_prompt db "Choose operation - 1:Add, 2:Subtract, 3:Multiply, 4:Divide, -666:Exit: ", 0
    invalid_input_msg db "Invalid input, please try again.", 10, 0
    div_zero_msg db "Division by zero error. Please try again.", 10, 0
    result_msg db "Result: %d", 10, 0
    summary_msg db "Total operations performed: %d", 10, 0
    scan_format db "%d", 0
    op_format db "%d", 0

section .bss
    num1 resb 4
    num2 resb 4
    operation resb 4
    total_operations resd 1

section .text
    extern printf
    extern scanf
    global _start

_start:
    xor eax, eax                ; zeroing out eax reg
    mov [total_operations], eax ; initializing the variable total_operations to 0

input_loop:
    push input_prompt1          ; prompt for integer 1
    call printf
    add esp, 4

    push num1                   ; reading integer 1
    push scan_format
    call scanf
    add esp, 8

    mov eax, [num1]             ;checking if -666 was entered to exit
    cmp eax, -666
    je exit_program

    push input_prompt2          ; prompt for integer 2
    call printf
    add esp, 4

    push num2                   ; read integer 2
    push scan_format
    call scanf
    add esp, 8

    mov eax, [num2]             ;checking if -666 was entered to exit
    cmp eax, -666
    je exit_program

    push operation_prompt       ;prompt for operation add sub mul div
    call printf
    add esp, 4
    
    push operation              ;read operation choice
    push op_format
    call scanf
    add esp, 8
    
    ;perform operation
    mov eax, [num1]             ;put first int in eax, and second in ebx 
    mov ebx, [num2]
    cmp dword [operation], 1    ;comparing the chosen operation. if 1, then go to addition
    je addition
    cmp dword [operation], 2    ;comparing the chosen operation. if 2, then go to subtraction
    je subtraction
    cmp dword [operation], 3    ;comparing the chosen operation. if 3, then go to multiplication
    je multiplication
    cmp dword [operation], 4    ;comparing the chosen operation. if 4, then go to division
    je division
    jmp invalid_input           ; otherwise, go to invalid input.

addition:                       ; add ebx to  eax
    add eax, ebx
    jmp display_result          ;go to display result

subtraction:
    sub eax, ebx                ; add ebx to  eax
    jmp display_result          ;go to display result     

multiplication:
    imul eax, ebx               ; add ebx to  eax
    jmp display_result          ;go to display result

division:
    cmp ebx, 0                  ;comapare the second digit with 0
    je div_zero_error           ;if 0, go to dvision error
    cdq
    div ebx                     ;divide value in eax with value in ebx
    jmp display_result          ;go to display result

div_zero_error:                 ;if the divison operation jz to here, prints the div by 0 message
    push div_zero_msg
    call printf
    add esp, 4
    jmp input_loop              ; goes back to user input prompts

display_result:                 ; operation that prints the result for all operations
    push eax
    push result_msg
    call printf
    add esp, 8

    inc byte [total_operations]      ; increments the total opeartions by 1 if operation was successful
    jmp input_loop              ; goes back to user input loop

invalid_input:                  ; function that prints invalid input message
    push invalid_input_msg
    call printf
    add esp, 4
    jmp input_loop              ; goes back to user input loop

exit_program:
    push dword [total_operations]   ; this operation prints the total operations performed
    push summary_msg
    call printf
    add esp, 8

    ; exit function below 
    mov eax, 1  
    xor ebx, ebx
    int 0x80
