#!/usr/bin/env python3
#
#  ██████╗  █████╗ ██╗  ██╗██████╗    ███╗   ██╗███████╗████████╗
# ██╔════╝ ██╔══██╗██║  ██║██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
# ██║  ███╗███████║███████║██║  ██║   ██╔██╗ ██║█████╗     ██║
# ██║   ██║██╔══██║██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║
# ╚██████╔╝██║  ██║██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝
#   ____  ___  _   _ ____
#  / ___|/ _ \| | | |  _ \   minions/python/isocalendar.py
# | |  _| |_| | |_| | | | |
# | |_| |  _  |  _  | |_| |  Gustavo Huarcaya
#  \____|_| |_|_| |_|____/   https://gahd.net
#
# Isocalendar
#

import os

from datetime import date


def today_isocalendar():
    """Today isocalendar"""
    today = date.today()
    iso_calendar = today.isocalendar()
    year, week, weekday = iso_calendar
    return {"date": today, "year": year, "week": week, "weekday": weekday}


def custom_isocalendar(year: int, month: int, day: int):
    """Custom isocalendar"""
    custom_date = date(year, month, day)
    iso_calendar = custom_date.isocalendar()
    year, week, weekday = iso_calendar
    return {
        "date": custom_date,
        "year": year,
        "week": week,
        "weekday": weekday
    }


if __name__ == "__main__":
    iso_calendar = today_isocalendar()
    print(os.system("cal -1"))
    print(f"Week: \t\t{iso_calendar['week']}")
    print(f"Weekday: \t{iso_calendar['weekday']}")
