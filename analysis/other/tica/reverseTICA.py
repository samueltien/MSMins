import numpy as np
import os

N = np.load('feat/0.npy')
L = np.load('ttrajs/0.npy')

print(f"N shape: {N.shape}")
print(f"L shape: {L.shape}")

M = np.linalg.pinv(N) @ L

print(f"Computed M shape: {M.shape}")

output_path = 'M.npy'
np.save(output_path, M)
print(f"M saved to {output_path}")
