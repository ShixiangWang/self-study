#!/usr/bin/env python3
"""
Author : wsx <wsx@localhost>
Date   : 2022-02-16
Purpose: Jump the Five
"""

import argparse
from typing import NamedTuple


class Args(NamedTuple):
    """ Command-line arguments """
    text: str

# --------------------------------------------------
def get_args() -> Args:
    """ Get command-line arguments """

    parser = argparse.ArgumentParser(
        description='Jump the Five',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    parser.add_argument('text',
                        metavar='str',
                        help='Input text')

    args = parser.parse_args()

    return Args(args.text)


# --------------------------------------------------
def main() -> None:
    """ Make a jazz noise here """

    args = get_args()

    jumper = {'1': '9', '2': '8', '3': '7', '4': '6', '5': '0', '6': '4', '7': '3', '8': '2', '9': '1', '0': '5'}

    for char in args.text:
        print(jumper.get(char, char), end='') 
    print()


# --------------------------------------------------
if __name__ == '__main__':
    main()
