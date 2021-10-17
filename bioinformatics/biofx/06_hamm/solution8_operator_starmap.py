#!/usr/bin/env python3
"""
Author : zhouliuyi <zhouliuyi@localhost>
Date   : 2021-09-20
Purpose: Rock the Casbah
"""

import argparse
import operator
from itertools import zip_longest, starmap
from typing import NamedTuple


class Args(NamedTuple):
    """ Command-line arguments """
    seq1: str
    seq2: str


# --------------------------------------------------
def get_args() -> Args:
    """ Get command-line arguments """

    parser = argparse.ArgumentParser(
        description='Rock the Casbah',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    parser.add_argument('seq1',
                        metavar='str',
                        help='Sequence 1')
    parser.add_argument('seq2',
                        metavar='str',
                        help='Sequence 2')

    args = parser.parse_args()

    return Args(args.seq1, args.seq2)


# --------------------------------------------------
def main() -> None:
    """ Make a jazz noise here """

    args = get_args()
    print(hamming(args.seq1, args.seq2))


# -------------------------------------------------
def hamming(seq1: str, seq2: str) -> int:
    """ Calculate Hamming distance """

    return sum(starmap(operator.ne, zip_longest(seq1, seq2)))


# --------------------------------------------------
if __name__ == '__main__':
    main()
