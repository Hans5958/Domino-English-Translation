from struct import *
import sys
import io
import os

if len(sys.argv) != 4:
	print("Usage: {} [pack/unpack] [input] [output]".format(sys.argv[0]))
	sys.exit(1)

if sys.argv[1] == "unpack":
	with io.open(sys.argv[2], "rb") as input_file:
		with io.open(sys.argv[3], "w", encoding="utf-8") as output_file:
			print("Unpacking {} to {}...".format(os.path.basename(sys.argv[2]), os.path.basename(sys.argv[3])))
			while True:
				target_dlg = unpack("<H", input_file.read(2))[0]
				if target_dlg == 0:
					print("Done.")
					break
				print(target_dlg, file=output_file)
				print(unpack("<H", input_file.read(2))[0], file=output_file)
				# need to do length - 1 to not copy null terminator
				print(input_file.read(unpack("<I", input_file.read(4))[0] - 1).decode("cp932"), file=output_file)
				input_file.read(1)
elif sys.argv[1] == "pack":
	with io.open(sys.argv[2], "r", encoding="utf-8") as input_file:
		with io.open(sys.argv[3], "wb") as output_file:
			print("Packing {} to {}...".format(os.path.basename(sys.argv[2]), os.path.basename(sys.argv[3])))
			input_arr = input_file.read().splitlines()
			for x in range(int(len(input_arr) / 3)): # expected to be divisible by 3
				idx = x * 3
				sjis_str = input_arr[idx + 2].encode("cp932")
				output_file.write(pack("<H", int(input_arr[idx]))) # target dlg
				output_file.write(pack("<H", int(input_arr[idx + 1]))) # window msg
				output_file.write(pack("<I", len(sjis_str) + 1)) # string len
				output_file.write(sjis_str) # string
				output_file.write(b"\x00")
			output_file.write(b"\x00\x00") # terminator
			print("Done.")
else:
	print("invalid operation!")