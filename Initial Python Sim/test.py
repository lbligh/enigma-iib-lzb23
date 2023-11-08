test = ["AC", "QR", "BD"]
test_nums = [[ord(x) - ord("A") for x in i] for i in test]
letter_in = 1

for i in test_nums:
    if letter_in in i:
        letter_out = i[(not i.index(letter_in)) * 1]
        break


print(letter_out)
