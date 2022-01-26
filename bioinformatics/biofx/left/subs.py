#!/usr/bin/env python3

import argparse
from tkinter import BROWSE
from typing import NamedTuple

class Args(NamedTuple):
  """ Command-line arguments """
  seq: str
  subseq: str


def get_args() -> Args:
  """ Get command-line arguments """

  parser = argparse.ArgumentParser(
    description='Find subsequences',
    formatter_class=argparse.ArgumentDefaultsHelpFormatter
  )

  parser.add_argument('seq', metavar='seq', help='Sequence')
  parser.add_argument('subseq', metavar='subseq', help='Sub-sequence')

  args = parser.parse_args()  

  return Args(args.seq, args.subseq)


def main() -> None:
  args = get_args()
  
  # Method 1
  last = 0
  found = []
  while True:
    pos = args.seq.find(args.subseq, last)
    if pos == -1:
      break
    found.append(pos + 1)
    last = pos + 1

  print(*found)

if __name__ == '__main__':
  main()


# def guess_format(filename: str) -> str:
#     """ Guess format from extension """

#     ext = re.sub('^[.]', '', os.path.splitext(filename)[1])

#     return 'fasta' if re.match('f(ast|a|n)?a$', ext) else 'fastq' if re.match(
#         'f(ast)?q$', ext) else ''


