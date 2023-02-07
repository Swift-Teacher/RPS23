#!/usr/bin/env python3

# 1 - import this module so that we can generate a random number for the computer's choice
import random

# 2 - create these variable to store the number of wins for each outcome - can mention data model here to be used in Swift app
user_wins = 0
computer_wins = 0
draws = 0

# 9 - create a list to store the three user choices and store in the options variable. By nature of a list being an indexed collection, "rock" is automatically assigned an integer value of 0, "paper" is assigned 1, and "scissors" is assigned 2.
options = ["rock", "paper", "scissors"]

# 3 - this while loop is True which means it will continuously run
while True:
	# 4 - ask for the user input or 'Q' to quit. Then lowercase the user's entry so that case is not a concern
	user_input = input("Type 'Rock', 'Paper', 'Scissors', or 'Q' to quit the game: ").lower()
	# 5 - break out of the while loop to quit the game.
	if user_input == "q":
		break
	
	# 7 - line 24 is the original line to check for user input not being rock, paper, or scissors then we use the keyword continue to return to the top of the while loop and ask the user to enter rock paper or scissors. We will eventually comment out or delete line 24.
    # 10 - comment out line 24
	#if user_input not in ["rock", "paper", "scissors"]:
    # 11 - reimplement checking users choice to ensure the user did not enter something other than rock, paper, or scissors using the user_input variable rather than the list directly.
	if user_input not in options:
		continue
	
    # 8 - create a random integer between 0 and 2 and store the value in the random_number variable.
    # assign integer values by order in list - rock: 0 , paper: 1, scissors 2
	random_number = random.randint(0, 2)
	
	# 12 - create the computer's choice by getting the index value in the options list that is equal to the random number generated in line 31 and assigning it to the computer_pick variable.
	computer_pick = options[random_number]
    # 13 - display the computer's randomly generated pick to the user.
	print("Computer picked:", computer_pick + ".")
	
    # 14 - compare the user_input and computer_pick string values. If they are the same, display that the game is a draw and increment the draws variable by one.
	if user_input == computer_pick:
		print("It's a draw.")
		draws += 1
    
    # We only need to make determine when the user wins because we only have a Boolean state remaining to determine: user_wins or computer wins. If the user did not win, then that means the computer won.
    # 15 - compare the user_input and computer_pick string values.
	elif user_input == "rock" and computer_pick == "scissors":
        # 16 - display the game rule, display that the user won, and increment the user_wins variable by one.
		print("Rock crushes scissors.")
		print("You won!")
		user_wins += 1
    
    # 17 - compare the user_input and computer_pick string values.
	elif user_input == "paper" and computer_pick == "rock":
        # 18 - display the game rule, display that the user won, and increment the user_wins variable by one.
		print("You won!")
		user_wins += 1
	
    # 17 - compare the user_input and computer_pick string values.
	elif user_input == "scissors" and computer_pick == "paper":
        # 20 - display the game rule, display that the user won, and increment the user_wins variable by one.
		print("You won!")
		user_wins += 1
	
    # 21 - the comparisons above did not happen, so the computer won.
	else:
        # 22 - display that the computer won, and increment the computer_wins variable by one.
		print("You lost. :(")
		computer_wins += 1
		
# 23 - When the user quits the game, display the number of user wins, computer wins, and draws. This can be done as a concatenated string as done in line 70 or as a formatted string as done in lines 71 and 72.
print("You won", user_wins, "times.")
print(f"The computer won {computer_wins} times.")
print(f"There were {draws} draws.")

# 6 - Output for player to thank them for playing the game.
print("Thanks for playing. Goodbye!")


# Can include this as an alternative way to assign random_number to a specific pick which is similar to how it will be handled in Swift.
    #if random_number == 0:
        #computer_pick = "rock"
        #print("Computer picked:", computer_pick + ".")
        
    #elif random_number == 1:
        #computer_pick = "paper"
        #print("Computer picked:", computer_pick + ".")
        
    #elif random_number == 2:
        #computer_pick = "scissors"
        #print("Computer picked:", computer_pick + ".")
