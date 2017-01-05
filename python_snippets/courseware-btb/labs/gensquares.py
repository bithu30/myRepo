def gen_squares(max_base):
    for n in range(max_base):
        yield n ** 2
MAX=100000000000
for square in gen_squares(MAX):
    print(square)