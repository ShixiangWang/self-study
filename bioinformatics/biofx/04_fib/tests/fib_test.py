""" Tests for fib.py """

import os
import platform
import random
import re
from subprocess import getstatusoutput

PRG = './fib.py'
RUN = f'python {PRG}' if platform.system() == 'Windows' else PRG


# ----------------------------------------------
def test_exists() -> None:
    """ Program exists """

    assert os.path.isfile(PRG)


# ------------------------------------------------
def test_usage() -> None:
    """ Usage """
    
    for arg in ['-h', '--help']:
        rv, out = getstatusoutput(f'{RUN} {arg}')
        assert rv == 0
        assert out.lower().startswith('usage:')


        
