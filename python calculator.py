print("Simple Calculator")

a = float(input("Enter first number: "))
b = float(input("Enter second number: "))

print("Choose operation:")
print("1) +")
print("2) -")
print("3) *")
print("4) /")

choice = input("Enter 1/2/3/4: ")

if choice == "1":
    print("Answer =", a + b)
elif choice == "2":
    print("Answer =", a - b)
elif choice == "3":
    print("Answer =", a * b)
elif choice == "4":
    if b == 0:
        print("Cannot divide by zero")
    else:
        print("Answer =", a / b)
else:
    print("Invalid choice")

