#!/usr/bin/env python3
#inspired in https://www.practicepython.org/exercise/2014/03/26/08-rock-paper-scissors.html
import sys
import re


def selection(player):
    print("Player ", player,", select:", sep='')
    print("1: Rock")
    print("2: Paper")
    print("3: Scissors")
    move = input("Select your move: ")
    return move


#0 = draw, 1 = player 1 win, 2 = player 2 win
def rules(x, y):
    x = int(x)
    y = int(y)
    if x == y: return 0
    elif x == 1 and y == 3: return 1
    elif x == 2 and y == 1: return 1
    elif x == 3 and y == 2: return 1
    else: return 2


def anotherGame():
    for retries in range(3):
        flag = input("Do you want to play another game? (Yy/Nn): ")
        if re.match("^[YyNn]{1}$", flag):
            if flag == 'Y' or flag == 'y':
                return True
            else: return False
        elif retries == 2: 
            print("Bye")
            return False


def game():
    while True:
        p1 = selection(1)
        p2 = selection(2)
        winner = rules(p1, p2)
        if winner is 0: print("Draw")
        else: print("Player ", winner, " wins", sep='')
        if anotherGame() is False: break
game()