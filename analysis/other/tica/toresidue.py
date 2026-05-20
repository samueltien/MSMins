import numpy as np

data = np.load('M.npy')
trans = data.T

#print(trans.shape)
#print(trans[0])


residue_ends = [21, 51]
chain_starts = [0] + residue_ends[:-1]  # [0, 21]

cnt = 0
contr = []
for i in range(residue_ends[-1]):
    if i in chain_starts:
        contr.append(np.sum(np.abs(trans[1][cnt:cnt+2])))
        cnt += 2
    else:
        contr.append(np.sum(np.abs(trans[1][cnt:cnt+4])))
        cnt += 4
print(contr)
#print(np.sum(np.abs(trans[0][0:2])))

with open('contr.txt', 'w') as f:
    for value in contr:
        f.write(f"{value}\n")


