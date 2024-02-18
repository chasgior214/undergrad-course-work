# imports and givens
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

M = 648
L_angtroms = 53.7404 # Å
dt = 1E-13 # s
m_in_g_per_mol = 20.18 # g/mol
xi_angstroms = 3.8717235034086 # Å
beta_in_eV = 0.00815679911023357 # eV
k_B = 1.38064852E-23

# convert to SI
L = L_angtroms*1E-10 # m
m_in_kg_per_mol = m_in_g_per_mol / 1000 # kg/mol
m = m_in_kg_per_mol / 6.022E23 # kg
xi = xi_angstroms*1E-10 # m
beta_joules = beta_in_eV*1.60218E-19 # J

# import data
project_data = pd.read_csv('MME 4428A: Fundamentals of Nanoengineering Science/Part 1 Coordinates.csv')

x = project_data['x [A]']*1E-10
y = project_data['y [A]']*1E-10
z = project_data['z [A]']*1E-10
vx = project_data['vx [A/ps]']*1E-10*1E12
vy = project_data['vy [A/ps]']*1E-10*1E12
vz = project_data['vz [A/ps]']*1E-10*1E12

# a) Present a 2D plot of the (𝑥, 𝑦) positions of all the atoms at this instant.
plt.scatter(x*1e10, y*1e10)
plt.xlabel('x [Å]')
plt.ylabel('y [Å]')
plt.title('Initial (x, y) Positions of the atoms')
# plt.show()

# b) What is the density of the fluid (molecules/m3)?
volume_in_meters = L**3
num_molecules = len(project_data)
density = num_molecules / volume_in_meters
print('Density of the fluid (molecules/m3):', density)

# c) Calculate the total instantaneous kinetic energy (J) of the system.
v = np.sqrt(vx**2 + vy**2 + vz**2)
KE = 1/2 * m * v**2
total_KE = KE.sum()
print('Total instantaneous kinetic energy (J):', total_KE)

# d) Based on this instantaneous kinetic energy, what is the instantaneous temperature (K) of the system?
N = num_molecules
T = total_KE * 2/(3 * N * k_B)
print('Instantaneous temperature (K):', T)

# e) Using the 𝜉 and 𝛽 parameters that you have been assigned, plot the Stark-Müller potential energy as a function of distance between the atoms. Ensure that you select the axis limits to illustrate important features of the function.
def potential_energy(r): return beta_in_eV * (((xi_angstroms / r)**5)/16 - np.exp(-r/xi_angstroms))

min_radius = 0.5*xi_angstroms
max_radius = 6*xi_angstroms
r = np.linspace(min_radius, max_radius, 100000)
fig, ax = plt.subplots()
fig.subplots_adjust(bottom=0.2)
ax.plot(r, potential_energy(r))
ax.set_xlabel('r [Å]')
ax.set_ylabel('Potential Energy [eV]')
ax.set_xlim(min_radius, max_radius)
ax.set_title('Stark-Müller potential energy as a function of distance between the atoms')
ax.axhline(y=0, color='k')
ax.set_xlim(left=0)

ax2 = plt.twiny()
ax2.set_xlim(ax.get_xlim())
ax2.set_xticks(np.linspace(0, max_radius, 13))
ax2.set_xticklabels(np.round(np.linspace(0, max_radius/xi_angstroms, 13), 3))
ax2.set_xlabel('r / ξ')
ax2.xaxis.set_ticks_position('bottom')
ax2.xaxis.set_label_position('bottom')
ax2.spines['bottom'].set_position(('axes', -0.15))

min_r = r[np.argmin(potential_energy(r))]
min_PE = potential_energy(min_r)
ax.plot(min_r, min_PE, 'ro')
ax.text(min_r + 0.4, min_PE -0.4e-3, f'({min_r:.2f} Å, {min_PE:.2e} eV)')


plt.show()

# f) Using a Lennard-Jones cut-off radius of 15 Å, calculate the total potential energy (J) in interactions between atom 𝑀 and all other atoms.
dataset_without_atom_M = project_data.drop(index=M)
x_without_atom_M = dataset_without_atom_M['x [A]']*1E-10
y_without_atom_M = dataset_without_atom_M['y [A]']*1E-10
z_without_atom_M = dataset_without_atom_M['z [A]']*1E-10

x_M = x[M]
y_M = y[M]
z_M = z[M]

cutoff_radius = 15*1E-10

dataset_atoms_within_cutoff_radius = dataset_without_atom_M[ (x_without_atom_M - x_M)**2 + (y_without_atom_M - y_M)**2 + (z_without_atom_M - z_M)**2 < cutoff_radius**2 ]
r_within_cutoff_radius = np.sqrt( (dataset_atoms_within_cutoff_radius['x [A]']*1E-10 - x_M)**2 + (dataset_atoms_within_cutoff_radius['y [A]']*1E-10 - y_M)**2 + (dataset_atoms_within_cutoff_radius['z [A]']*1E-10 - z_M)**2 )

def potential_energy(r): return beta_joules * (((xi / r)**5)/16 - np.exp(-r/xi))

potential_energy_values = potential_energy(r_within_cutoff_radius)
total_potential_energy = potential_energy_values.sum()
print('Total potential energy (J) in interactions between atom M and all other atoms:', total_potential_energy)

# g) Again using the snapshot data in the “Part 1 Coordinates” sheet and a cut-off radius of 15 Å, calculate the total potential energy of the system at this instant, ignoring the periodic boundary conditions.
total_potential_energy = 0
for i in range(num_molecules):
    for j in range(i+1, num_molecules):
        r = np.sqrt( (x[i] - x[j])**2 + (y[i] - y[j])**2 + (z[i] - z[j])**2 )
        if r < cutoff_radius:
            total_potential_energy += potential_energy(r)
print('Total potential energy (J) of the system at this instant:', total_potential_energy)

# h) Derive an expression for the Stark-Müller force exerted by one atom on another.
# analytical derivative of potential energy → do in equations in Word (or google / latexify_py)
# F = - dV/dr
# F = (β/ξ)*((5/16)*(ξ/r)**6 - exp(-r/ξ))
def force(r): return (beta_joules/xi)*((5/16)*(xi/r)**6 - np.exp(-r/xi))

# i) What is the force (N) vector on atom 𝑀 at this instant, again, using a cut-off radius of 15 Å? 
force_on_atom_M = np.array([0., 0., 0.])
for i in range(num_molecules):
    if i != M:
        r = np.sqrt( (x[i] - x[M])**2 + (y[i] - y[M])**2 + (z[i] - z[M])**2 )
        if r < cutoff_radius:
            force_on_atom_M += force(r) * np.array([x[M] - x[i], y[M] - y[i], z[M] - z[i]]) / r
print('Force (N) vector on atom M at this instant:', force_on_atom_M)

# j) Using a timestep of ∆𝑡 in a modified Verlet scheme, calculate the position (m) and velocity (m/s) of atom 𝑀 one timestep in the future. (For this part, assume that the velocity data in the “Part 1 Coordinates” sheet are actually one half timestep behind the position data. Calculate the new velocity and position one timestep in the future, though still offset one half timestep from one another). 
x_M = np.array([x[M], y[M], z[M]])
v_M = np.array([vx[M], vy[M], vz[M]])
a_M = force_on_atom_M / m
v_M += a_M*dt
x_M += v_M*dt + 1/2*a_M*dt**2

print('Velocity (m/s) of atom M one timestep in the future:', v_M)
print('Position (m) of atom M one timestep in the future:', x_M)