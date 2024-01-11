import sys, getopt

def main(argv):
    inputfile = ''
    outputfile = ''
    count = 0
    
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
        
    except:
        print("Unhandled option\n")
        print("try for help: " + f'{sys.argv[0]} -h')
        sys.exit()
        
    for opt, arg in opts:
        if opt == '-h':
            print("python3 "+ f'{sys.argv[0]} -i <inputfile> -o <outputfile>' + "\n" + "-h this help")
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
            
    with open(inputfile, 'r') as file:
        assembly_code = file.read()
    lines = assembly_code.split('\n')
    unique_instructions = set()
    for line in lines[5:]:
        line = line.strip()
        if line and not line.startswith('#'):
            parts = line.split()
            if len(parts) >= 3:
                instruction = parts[2]
                unique_instructions.add(instruction)
                count += 1
    file.close()

    if outputfile != "":
        with open(outputfile, 'w') as file:
            file.write(f"Total Number of instructions    : {count}" + "\n")
            file.write(f"Number of different instructions: {len(unique_instructions)}" + "\n")
            file.write(f"List of unique instructions:" + "\n")
            for instruction in unique_instructions:
                file.write(instruction + "\n")
        file.close()
    else:
        print(f"Total Number of instructions    : {count}")
        print(f"Number of different instructions: {len(unique_instructions)}")
        print("List of unique instructions:")
        for instruction in unique_instructions:
            print(instruction, end='\t')
        print('\n')

if __name__ == "__main__":
   main(sys.argv[1:])
