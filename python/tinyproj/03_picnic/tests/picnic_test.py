""" Tests """

import os
from subprocess import getoutput, getstatusoutput

PRG = './picnic.py'


# --------------------------------------------------
def test_exists():
    """ Program exists """

    assert os.path.isfile(PRG)


# --------------------------------------------------
def test_usage():
    """ Usage """

    for flag in ['-h', '--help']:
        retval, out = getstatusoutput(f'{PRG} {flag}')
        assert retval == 0
        assert out.lower().startswith('usage')

# --------------------------------------------------
def test_one():
    """One item"""

    out = getoutput(f'{PRG} chips')
    assert out.strip() == 'You are bringing chips.'

