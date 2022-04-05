#!/usr/bin/env python3
"""
Author : wsx <wsx@localhost>
Date   : 2022-04-05
Purpose: Lookup tables
"""

import argparse
from typing import NamedTuple, TextIO

# --------------------------------------------------
def get_args():
    """ Get command-line arguments """

    parser = argparse.ArgumentParser(
        description='Gashlycrumb',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    parser.add_argument('letter',
                        metavar='letter',
                        help='Letter(s)',
                        nargs="+",
                        type=str)

    parser.add_argument('-f',
                        '--file',
                        help='Input file',
                        metavar='FILE',
                        type=argparse.FileType('r'),
                        default='gashlycrumb.txt')

    args = parser.parse_args()

    return args


# --------------------------------------------------
def main() -> None:
    """ Make a jazz noise here """

    args = get_args()
    
    lookup = {}
    for line in args.file:
        lookup[line[0].upper()] = line.rstrip()

    for letter in args.letter:
        if letter.upper() in lookup:
            print(lookup[letter.upper()])
        else:
            print(f"I do not know '{letter}'")

# --------------------------------------------------
if __name__ == '__main__':
    main()
