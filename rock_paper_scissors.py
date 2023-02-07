#!/usr/bin/env python3

# 1 - import this module so that we can generate a random number for the computer's choice
import random

# 2 - create these variable to store the number of wins for each outcome - can mention data model here to be used in Swift app
user_wins = 0
computer_wins = 0
draws = 0


options = ["rock", "paper", "scissors"]

# 3 - this while loop is True which means it will continuously run
while True:
	# 4 - ask for the user input or 'Q' to quit. Then lowercase the user's entry so that case is not a concern
	user_input = input("Type 'Rock', 'Paper', 'Scissors', or 'Q' to quit the game: ").lower()
	# 5 - break out of the while loop to quit the game.
	if user_input == "q":
		break
	
	
	#if user_input not in ["rock", "paper", "scissors"]:
	if user_input not in options:
		continue
	
	random_number = random.randint(0, 2)
	# rock: 0 , paper: 1, scissors 2
	
	computer_pick = options[random_number]
	print("Computer picked:", computer_pick + ".")
	
	if user_input == computer_pick:
		print("It's a draw.")
		draws += 1
		
	elif user_input == "rock" and computer_pick == "scissors":
		print("Rock crushes scissors.")
		print("You won!")
		user_wins += 1
		
	elif user_input == "paper" and computer_pick == "rock":
		print("You won!")
		user_wins += 1
		
	elif user_input == "scissors" and computer_pick == "paper":
		print("You won!")
		user_wins += 1
		
	else:
		print("You lost. :(")
		computer_wins += 1
		
	#if random_number == 0:
		#computer_pick = "rock"
		#print("Computer picked:", computer_pick + ".")
		
	#elif random_number == 1:
		#computer_pick = "paper"
		#print("Computer picked:", computer_pick + ".")
		
	#elif random_number == 2:
		#computer_pick = "scissors"
		#print("Computer picked:", computer_pick + ".")
	

print("You won", user_wins, "times.")
print(f"The computer won {computer_wins} times.")
print(f"There were {draws} draws.")

# 4 - Output for player to thank them for playing the game.
print("Thanks for playing. Goodbye!")