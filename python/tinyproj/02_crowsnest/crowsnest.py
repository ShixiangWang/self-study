#!/usr/bin/env python3
"""
Author : wsx <wsx@localhost>
Date   : 2022-01-19
Purpose: Rock the Casbah
"""

import argparse
from typing import NamedTuple, TextIO


class Args(NamedTuple):
    """ Command-line arguments """
    word: str


# --------------------------------------------------
def get_args() -> Args:
    """ Get command-line arguments """

    parser = argparse.ArgumentParser(
        description='Crow\'s Nest -- choose the correct article',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    parser.add_argument('word', help='A word')

    args = parser.parse_args()

    return Args(args.word)


# --------------------------------------------------
def main() -> None:
    """ Make a jazz noise here """

    args = get_args()
    word = args.word

    article = 'an' if word[0].lower() in 'aeiou' else 'a'

    print(f'Ahoy, Captain, {article} {word} off the larboard bow!')


# --------------------------------------------------
if __name__ == '__main__':
    main()
