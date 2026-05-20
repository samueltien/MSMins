import pymol
from pymol import cmd
import numpy as np

power = 1.5#2

#load
cmd.load("data/top3.pdb", "protein")

contact_percentages = []
with open("contact_data.txt", "r") as f:
    for line in f:
        contact_percentages.append(float(line.strip()))
print(contact_percentages)


max_contact = max(contact_percentages)
contact_percentages = [c / max_contact for c in contact_percentages]
contact_percentages = [c**power for c in contact_percentages]

for i, contact in enumerate(contact_percentages):
    custom = f"c_{i}"
    color = [1, 1 - contact, 1]
    cmd.set_color(custom, color)
    cmd.color(custom, f"resid {i+1}")
