```
[pid   140] semtimedop(262150, [{0, 1, 0}], 1, NULL) = -1 EINVAL (Invalid argument)

# ipcs -s

------ Semaphore Arrays --------
key        semid      owner      perms      nsems
0x41090e0f 0          cgimage    666        1
0x41090fd9 32769      cgimage    666        1
0x41090de3 163842     root       666        1
0x41090420 294915     root       666        1
0x41090dd3 131076     root       666        1
0x41090dde 229381     cgimage    666        1
```


