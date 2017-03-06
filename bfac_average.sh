grep B_FACTOR *_gctf.log | awk 's+=$NF{print s/NR}' | tail -1
