#!/usr/bin/env python3
""" Tetranucleotide frequency """

import argparse
import os
from typing import NamedTuple
from collections import Counter

class Args(NamedTuple):
    """ Command-line arguments """
    dna: str

# ----------------------------------------------
def get_args() -> Args:
    """ Get command-line arguments """

    parser = argparse.ArgumentParser(
        description='Tetranucleotide frequency',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    parser.add_argument('dna', metavar='DNA', help='Input DNA sequency')

    args = parser.parse_args()

    if os.path.isfile(args.dna):
        with open(args.dna, 'r', encoding='utf-8') as f:
            args.dna = f.read()

    return Args(args.dna)

#---------------------------------------------------
def main() -> None:
    ''' Make a jazz noise here'''

    args = get_args()
    counts = Counter(args.dna)

    print('{} {} {} {}'.format(counts.get('A'),
        counts.get('C'), counts.get('G'), counts.get('T')))

#--------------------------------------------------------
if __name__ == '__main__':
    main()

