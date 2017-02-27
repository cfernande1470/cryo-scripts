grep RES_LIMIT *_gctf.log | awk 's+=$NF{print s/NR}' | tail -1
