import numpy
from ase.units import GPa
from ase.eos import EquationOfState

# Read data
volumes,energies = numpy.loadtxt('vol_etot.dat', unpack=True)

# Fit EOS
eos = EquationOfState(volumes,energies, eos='birchmurnaghan')

# There are several other choices for eos, see doc at:
# https://wiki.fysik.dtu.dk/ase/ase/eos.html
# set eos to e.g. birchmurnaghan, sjeos (ASE default), p3

v0,e0,B = eos.fit()

print ()
print ("Equation of state:")
print ("-------------------")
print ("E0: %2.6f eV" % (e0))
print ("V0: %2.6f A^3" % (v0))
print ("B: %2.6f GPa" % (B/GPa))
print ()
