#!/usr/bin/env python3
#
#  ██████╗  █████╗ ██╗  ██╗██████╗    ███╗   ██╗███████╗████████╗
# ██╔════╝ ██╔══██╗██║  ██║██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
# ██║  ███╗███████║███████║██║  ██║   ██╔██╗ ██║█████╗     ██║
# ██║   ██║██╔══██║██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║
# ╚██████╔╝██║  ██║██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝
#   ____  ___  _   _ ____
#  / ___|/ _ \| | | |  _ \   minions/minions.py
# | |  _| |_| | |_| | | | |
# | |_| |  _  |  _  | |_| |  Gustavo Huarcaya
#  \____|_| |_|_| |_|____/   https://gahd.net
#
# Python minions main menu
#

import os
import sys

from python.isocalendar import today_isocalendar, custom_isocalendar
from python.util import SEPARATOR, menu_header

__filename = os.path.basename(__file__).upper()

header = menu_header(__filename)

menu = dict([
    ("1", "Today Isocalendar"),
    ("2", "Custom Isocalendar"),
    ("0", "Exit"),
])

menu_options = tuple(set(tuple(menu.keys()) + ("q",)))


def clear():
    """Clear console"""
    os.system("clear")


def display_header():
    """Show menu header"""
    clear()
    for i in header:
        print(i)


def display_menu():
    """Display menu"""
    for k, v in menu.items():
        print(f" [{k}] {v}")
    print(SEPARATOR)


def ask_option():
    """Ask the user which minion he wants to use"""
    valid_option = False
    while(not valid_option):
        user_input = input("Select an option: ")
        valid_option = user_input in menu_options
    return user_input


def ask_continue():
    """Ask the user if he wants to continue using another minion"""
    user_input = input("Press [1] to return to the main menu, [0] to exit: ")

    if user_input == "1":
        minions()
    elif user_input == "0" or user_input.lower() == "q":
        sys.exit()
    else:
        ask_continue()


def principal():
    opt = ask_option()

    if opt == "1":
        clear()
        iso_calendar = today_isocalendar()
        print(os.system("cal -1"))
        print(f"Week: \t\t{iso_calendar['week']}")
        print(f"Weekday: \t{iso_calendar['weekday']}")

        print()
        ask_continue()
    elif opt == "2":
        clear()
        year = input("Year: ")
        month = input("Month (from Jan = 1 to Dec = 12): ")
        day = input("Day of the month: ")
        clear()
        print((os.system(f"cal {day} {month} {year}")))
        iso_calendar = custom_isocalendar(int(year), int(month), int(day))
        print(f"Week: \t\t{iso_calendar['week']}")
        print(f"Weekday: \t{iso_calendar['weekday']}")
    elif opt == "0" or "q":
        clear()
        sys.exit()


def minions():
    display_header()
    display_menu()
    principal()


if __name__ == "__main__":
    minions()
