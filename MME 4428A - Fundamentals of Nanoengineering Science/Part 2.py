# imports and givens
import numpy as np
import matplotlib.pyplot as plt
import random

sigma_angstroms = 3.15379434 # Å
epsilon_eV = 0.261306558 # eV
T_Kelvin = 274.7490418 # K

# convert to SI
sigma = sigma_angstroms*1E-10 # m
epsilon_Jules = epsilon_eV*1.60218E-19 # J

# simulation

def potential_energy(r): return 4*epsilon_Jules*((sigma/r)**12 - (sigma/r)**6)
positions = []
PEs = []
K_b_T = 1.381E-23*T_Kelvin
position_B = 10E-10

for i in range(100000):
    PE = potential_energy(position_B)
    proposed_position_B = position_B + (random.random()-0.5)*1E-10
    proposed_potential_energy = potential_energy(proposed_position_B)
    if proposed_potential_energy < PE:
        position_B = proposed_position_B
    else:
        if random.random() < np.exp(-(proposed_potential_energy-PE)/K_b_T):
            position_B = proposed_position_B
    positions.append(position_B)
    PEs.append(PE)

# # run the simulation 1000 times, and make a histogram of the average position of atom B and the average potential energy of the system
# avg_positions = []
# avg_PEs = []
# for i in range(1000):
#     positions = []
#     PEs = []
#     position_B = 10E-10
#     for i in range(100000):
#         PE = potential_energy(position_B)
#         proposed_position_B = position_B + (random.random()-0.5)*1E-10
#         proposed_potential_energy = potential_energy(proposed_position_B)
#         if proposed_potential_energy < PE:
#             position_B = proposed_position_B
#         else:
#             if random.random() < np.exp(-(proposed_potential_energy-PE)/K_b_T):
#                 position_B = proposed_position_B
#         positions.append(position_B)
#         PEs.append(PE)
#     avg_positions.append(np.array(positions).mean())
#     avg_PEs.append(np.array(PEs).mean())

# plt.hist(np.array(avg_positions)*1E10)
# plt.xlabel('Average position (Å)')
# plt.ylabel('Frequency')
# plt.title('Histogram of the average position of atom B')
# plt.show()

# plt.hist(avg_PEs)
# plt.xlabel('Average potential energy (J)')
# plt.ylabel('Frequency')
# plt.title('Histogram of the average potential energy of the system')
# plt.show()

# k) Using a 0.1 Å bin size, plot a histogram of the position of Atom B. Discuss the results.
plt.hist(np.array(positions) * 1E10, bins=np.arange(0, 20, 0.1))
plt.xlabel('Position (Å)')
plt.ylabel('Frequency')
plt.title('Histogram of the position of Atom B')
plt.show()

# m) Based on your simulation results, calculate the average distance (m) between the two atoms, 〈𝑥〉.
distances = np.abs(np.array(positions))
avg_distance = distances.mean()
print('Average distance (m) between the two atoms:', avg_distance)

# n) Based on your simulation results, calculate the average potential energy (J) of interaction between the atoms, 〈𝐸〉. Discuss the reliability of this calculation and how that can be assessed.
avg_PE = np.array(PEs).mean()
print('Average potential energy (J) of interaction between the atoms:', avg_PE)

# the reliability of this calculation can be assessed several ways, including:
# 1. by running the simulation multiple times and comparing the results
#       → note that having run it a couple of hundred times, the atom occasionally spends most of the simulation hanging out in wells further from the global minimum
# 2. by running the simulation for more steps
# 3. by running the simulation with different step sizes
# 4. combinations of the above
# 5. by comparing the results to the equipartition theorem
# 6. using a different energy model than Lennard-Jones
# 7. comparing the results to experimental data

# p) Compare your calculated average potential energy to the predictions of equipartition theorem and discuss the results.
avg_KE_equipartition = 1/2*1.381E-23*T_Kelvin
print('Average kinetic energy (J) of the atoms (equipartition):', avg_KE_equipartition)

# q) If the system temperature were slowly lowered to 0 K, what would be the average potential energy (J) of interaction between the atoms, 〈𝐸〉, and average distance (m) between the two atoms, 〈𝑥〉?
r_0k = sigma * (2**(1/6))
E_0k = potential_energy(r_0k)

print('Average distance (m) between the two atoms at 0 K:', r_0k)
print('Average potential energy (J) of interaction between the atoms at 0 K:', E_0k)