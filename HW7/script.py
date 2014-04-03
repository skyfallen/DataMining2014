# Organizing data for DM HW 7
import scipy.misc
from pylab import *
import random
import operator
import matplotlib.pyplot
import copy
import math
import numpy as np
global file_width
global file_length
global file_title
global number_of_colors
global reference
global som
global alpha

def cluster(som, rows,clusters, alpha):
    print('start clustering')
    dict = copy.deepcopy(rows)
    i = 1
    Xrange =  range(0,len(dict)-1) 
    shuffle(Xrange)
    print(Xrange)
    for point_ind in Xrange:
        print('stage {}'.format(i))
        i = i + 1
        point = map(int,dict[point_ind])
        print('sum {}'.format(np.sum(np.array(point))))
        feed_som(som, point)
        #if i == 3:
        #    return
    clustering(clusters, rows, som)
    
def clustering(clusters, rows, som):
    for i in range(len(rows)):
        point = map(int,rows[i])
        if len(point) > 0:
            cluster = int(find_bmu(som, point))
        print(cluster)
        if not clusters[cluster]:
            clusters[cluster] = list()
            clusters[cluster].append(i)
        else:
            clusters[cluster].append(i)
    print(clusters)
        
def feed_som(som, point):
    #print('feeding som')
    
    # Best Matching Node
    bmu = find_bmu(som, point)
    print('best matching node {}'.format(bmu))
    
    # updating weights
    update_weights(som, bmu, point)

def theta(bmu, curr):
    if curr == bmu:
        return 1
    else: 
        if abs(curr - bmu) <= 1:
            return 0.5
    return 0
    
def update_weights(som, bmu, point):
    #print('updating nodes:\n')
 
    for i in range(len(som)):
        if theta(bmu, i) > 0:
            #print('updating')
            som[i] = (np.array(som[i]) + theta(bmu,i)*alpha*(np.array(point) - np.array(som[bmu]))).tolist()
 
    
def find_bmu(som, point):
    print('finding bmu:')
    distance = 0
    min_distance = inf
    bmu_ind = -1
    for i in range(len(som)):
        # Let's calculate the distance to every node in the SOM
        distance = np.linalg.norm(np.array(som[i])-np.array(point))
        #print('node {} has distance {}'.format(i,distance))
        if distance < min_distance:
            min_distance = distance
            bmu_ind = i
    #print(min_distance)
    #print(bmu_ind)
    #print(som[bmu_ind])
    return(bmu_ind)
    
def randomly_init_som(som,n,m):
    print('randomly initializing som with {} rows and {} columns'.format(n,m))
    for row in range(n):
        som[row] = [random.randint(0,255) for i in xrange(m)]       
    #print_dict(som)

def randomly_shuffled_rows(som,rows,n,m):
    Xrange =  range(0,len(rows)-1) 
    shuffle(Xrange)
    print(Xrange)
    i = 0
    for row in Xrange:
        #som[i] = (rows[row])
        som[i] = copy.deepcopy((rows[row]))
        random.shuffle(som[i])
        som[i] = map(int, (som[i]))
        #print_list(som[i])
        i = i + 1
        
    #return som

    
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
        
def print_clusters(clusters):
    print('printing file')
    out_file = open('exp1.txt', 'w')
    
    for i in range(len(clusters)):
        if len(clusters[i]) > 0:
            for j in range(len(clusters[i])):
                out_file.write('rev' + str(clusters[i][j]))
            #out_file.write('\n')
            #print_list(rows[row_numbers[i]], out_file)
            #if i == 77:
            #    print(rows[row_numbers[i]])
                out_file.write('\n')
    
def print_file(row_numbers, file_name):
    print('printing file')
    out_file = open(file_name, 'w')
    
    for i in range(len(row_numbers)):
        out_file.write('rev' + str(i))
        #out_file.write('\n')
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
    #print(sorted_ref)
    for i in range(len(sorted_ref)):
        out_file.write('rev' + str(i))
        out_file.write('\n')
    
def print_dict(dict):
    for i in range(len(dict)):
        output = 'rev{} '.format(i)
        for j in range(5):
            output = output + str(dict[i][j]) + ' '
        print(output)
        
def print_list(list):
    output = ''
    for i in range(100):
        output = output + str(list[i]) + ' '
    print(output)
    
random.seed(3)
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

#print_file(row_numbers, output_file)
#print_reference('reference.txt')
#print_dict(rows)
#Creating SOM

som = {}
#randomly_init_som(som,len(rows),len(rows[1]))
randomly_shuffled_rows(som, rows,len(rows),len(rows[1]))
#print_dict(som)
alpha = 0.1
clusters = {}
for i in range(len(rows)):
    clusters[i] = []
cluster(som, rows, clusters, alpha)

print_clusters(clusters)
