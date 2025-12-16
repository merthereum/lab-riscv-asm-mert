.data
array:
    .word  1,  2,  3,  4,  5
    .word  6,  7,  8,  9, 10
    .word 11, 12, 13, 14, 15

.text
.globl main

# t0 – base address of array
# t1 – i (0..2)
# t4 – j (0..4)
# t2 – sum
# t3,t5,t6 – temporaries
# a0,a1 – temporaries (addr/data)

main:
    la   t0, array     # t0 = &array[0][0]
    li   t1, 0         # i = 0
    li   t2, 0         # sum = 0

outer_loop:
    li   t3, 3
    bge  t1, t3, end   # if i >= 3 -> finished

    li   t4, 0         # j = 0

inner_loop:
    li   t5, 5
    bge  t4, t5, next_row  # if j >= 5 -> next row

    # linear index = i*5 + j
    # i*5 = (i<<2) + i
    slli t6, t1, 2     # t6 = i*4
    add  t6, t6, t1    # t6 = i*5
    add  t6, t6, t4    # t6 = i*5 + j

    # byte offset = (i*5 + j) * 4
    slli t6, t6, 2     # *4

    # addr = base + offset
    add  a0, t0, t6
    lw   a1, 0(a0)     # a1 = array[i][j]

    add  t2, t2, a1    # sum += a1

    addi t4, t4, 1     # j++
    j    inner_loop

next_row:
    addi t1, t1, 1     # i++
    j    outer_loop

end:
    # Expected: t2 = 120 (0x00000078)
    nop
