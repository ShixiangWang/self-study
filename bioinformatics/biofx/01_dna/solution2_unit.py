#!/usr/bin/env python3
""" Tetranucleotide frequency """

import argparse
import os
from typing import NamedTuple, Tuple

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

    print('{} {} {} {}'.format(*count(args.dna)))

#-----------------------------------------------------
def count(dna: str) -> Tuple[int, int, int, int]:
    ''' Count bases in DNA '''
    count_a, count_c, count_g, count_t = 0, 0, 0, 0
    for base in dna:
        if base == 'A':
            count_a += 1
        elif base == 'C':
            count_c += 1
        elif base == 'G':
            count_g += 1
        elif base == 'T':
            count_t += 1

    return (count_a, count_c, count_g, count_t)

#-----------------------------------------------------
def test_count() -> None:
    ''' Test count '''

    assert count('') == (0, 0, 0, 0)
    assert count('123XYZ') == (0, 0, 0, 0)
    assert count('A') == (1, 0, 0, 0)
    assert count('C') == (0, 1, 0, 0)
    assert count('G') == (0, 0, 1, 0)
    assert count('T') == (0, 0, 0, 1)
    assert count('ACCGGGTTTT') == (1, 2, 3, 4)

#--------------------------------------------------------
if __name__ == '__main__':
    main()

