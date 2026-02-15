import random

print("Welcome to Number Guessing Game")

secret__number = random.randint(1, 10)

while True:
    guess = int(input("Guess a number between 1 and 10:"))

    if guess == secret__number:
        print("Correct! You guessed it")

        break
    elif guess < secret__number:
        print("Too low, try again")

    else:
        print("Too high, try again")
        
