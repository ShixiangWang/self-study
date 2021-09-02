#!/usr/bin/env python3
"""
Author : zhouliuyi <zhouliuyi@localhost>
Date   : 2021-08-30
Purpose: Calculate Fibonacci
"""

import argparse
from typing import Callable, NamedTuple
from functools import lru_cache


class Args(NamedTuple):
    """ Command-line arguments """
    generations: int
    litter: int


# --------------------------------------------------
def get_args() -> Args:
    """ Get command-line arguments """

    parser = argparse.ArgumentParser(
        description='Calculate Fibonacci',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    parser.add_argument('gen',
                        metavar="generation",
                        type=int,
                        help='Number of generations')

    parser.add_argument('litter',
                        metavar='litter',
                        type=int,
                        help='Size of litter per generation')

    args = parser.parse_args()

    if not 1 <= args.gen <= 40:
        parser.error(f'generations "{args.gen} must be between 1 and 40')

    if not 1 <= args.litter <= 5:
        parser.error(f'litter "{args.litter}" must be between 1 and 5')
    return Args(generations=args.gen, litter=args.litter)


# --------------------------------------------------
def main() -> None:
    """ Make a jazz noise here """

    args = get_args()

    # method 1
    def fib(n: int) -> int:
        return 1 if n in (1, 2) else fib(n - 2) * args.litter + fib(n - 1)

    print(fib(args.generations))

    # method 2
    fib2 = memoize(fib)
    print(fib2(args.generations))

    # method 3
    @memoize
    def fib3(n: int) -> int:
        return 1 if n in (1, 2) else fib(n - 2) * args.litter + fib(n - 1)

    print(fib3(args.generations))

    # method 4 builtin support
    @lru_cache()
    def fib4(n: int) -> int:
        return 1 if n in (1, 2) else fib(n - 2) * args.litter + fib(n - 1)

    print(fib4(args.generations))


# -------------------------------------------
def memoize(f: Callable) -> Callable:
    """ Memoize a function """

    cache = {}

    def memo(x):
        if x not in cache:
            cache[x] = f(x)
        return cache[x]

    return memo


# --------------------------------------------------
if __name__ == '__main__':
    main()
