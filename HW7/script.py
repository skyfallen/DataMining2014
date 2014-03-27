# Organizing data for DM HW 7
import scipy.misc
from pylab import *
import random
import operator
import matplotlib.pyplot
global file_width
global file_length
global file_title
global number_of_colors
global reference
def shufle_rows():
    print('start shuffling')

# Reads in the old file
def read_old_file(file_name):
    global file_width
    global file_length
    global file_title
    global number_of_colors

    print('start reading from {} file'.format(file_name))
    in_file = open(file_name, 'r')
    
    file_title = in_file.readline()
    print(file_title)
    
    file_width,file_length = (in_file.readline()).split(' ')
    print('file {} is {}x{}'.format(file_name, file_width, file_length))
    
    number_of_colors = in_file.readline()
    print('number of colors is {}'.format(number_of_colors))
    
    rows = {}
    i = 0
    rows[i] = ()
    for line in in_file:
        #print(line)
        numbers = line.split(' ')
        del numbers[-1]
        #print(numbers)
        if len(numbers) == 24:
            if not rows[i]:
                rows[i] = list(numbers)
            else:
                rows[i] = rows[i] + numbers
        else:
            rows[i] = rows[i] + numbers
            i = i + 1
            rows[i] = ()
    return rows
            
    
def print_list(list, file):
    for i in range(len(list)):
        file.write(' {}'.format(list[i]))
    
def print_file(row_numbers, file_name):
    print('printing file')
    out_file = open(file_name, 'w')
    
    for i in range(len(row_numbers)):
        out_file.write('rev' + str(i))
        out_file.write('\n')
        print_list(rows[row_numbers[i]], out_file)
        if i == 77:
            print(rows[row_numbers[i]])
        out_file.write('\n')
        #reference[i] = row_numbers[i]
    
def print_reference(file_name):
    global reference
    print(reference)
    print('printing reference')
    out_file = open(file_name, 'w')
    
    sorted_ref = sorted(reference.iteritems(), key=operator.itemgetter(1))
    print(sorted_ref)
    for i in range(len(sorted_ref)):
        out_file.write('rev' + str(i))
        out_file.write('\n')
    
random.seed(2)
file_name = 'M.txt'
output_file = 'res.txt'
rows = read_old_file(file_name)
row_numbers = list(range(len(rows)))
#print(row_numbers)
random.shuffle(row_numbers)
#print(row_numbers)

reference = {}
for i in range(len(row_numbers)):
    reference[i] = row_numbers[i]
#print(reference)

print_file(row_numbers, output_file)
print_reference('reference.txt')
