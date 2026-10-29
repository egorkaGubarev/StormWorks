import json
import matplotlib
import matplotlib.pyplot as plt
import numpy as np


name = 'data.json'
plots = 4

font = 20
tick_width_factor = 8
linewidth = 4

with open(name) as file:
    data = json.load(file)

ticks = len(data['dist'])
x_lim = (0, ticks)
matplotlib.rcParams['axes.linewidth'] = linewidth
fig, ax = plt.subplots(plots, 1, layout='constrained')
tick_width = font / tick_width_factor
'''
ax[0].plot(np.array(data['target_pitch']) * 360, color='green', linewidth=linewidth, label='target')
ax[0].plot(np.array(data['pitch']) * 360, color='black', linewidth=linewidth, label='torpedo')
ax[0].set_ylabel('Pitch, deg', fontsize=font)
ax[0].legend(frameon=False, prop={'size': font})

ax[1].plot(x_lim, (0, 0), color='blue', linewidth=linewidth, label='surface')
ax[1].plot(data['target_alt'], color='green', linewidth=linewidth, label='target')
ax[1].plot(data['altitude'], color='black', linewidth=linewidth, label='torpedo')
ax[1].set_ylabel('Altitude, m', fontsize=font)
ax[1].legend(frameon=False)

ax[2].plot(data['pitch_correction'], color='black', linewidth=linewidth)
ax[2].set_ylabel('Pitch correction', fontsize=font)
'''
ax[3].plot(data['dist'], color='black', linewidth=linewidth, label='distance')
# ax[3].plot(data['delta_x'], color='red', linewidth=linewidth, linestyle='--', label='delta x')
# ax[3].plot(data['delta_y'], color='blue', linewidth=linewidth, linestyle='--', label='delta y')
ax[3].set_ylabel('Distance, m', fontsize=font)
ax[3].legend(frameon=False)

for plot in range(plots):
    ax[plot].set_xlabel('t, ticks', fontsize=font)
    ax[plot].set_xlim(x_lim)
    ax[plot].tick_params(length=font, width=tick_width, labelsize=font)

plt.show()
