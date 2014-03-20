'''
Self-organizing map implementation
Language: Python
Data Mining
University of Tartu
'''
import random
import math
import numpy as np
import copy

global num_elem_som 
global max_val
global min_val
global num_iterations
global inf
global learning_rate

learning_rate = 0.05
num_iterations = 10
num_elem_som = 30
max_val = 100
min_val = 0
inf = float("inf")
def init():
    print("initializing:\n")
    # let's create a new SOM:
    som = {}
    for i in range(num_elem_som):
        # each node in SOM has 
        som[i] = ()
        som[i] = create_random_weigths(3)
        print(som[i])
    return(som)

def find_winner(som, input_vector):
    print('finding a winner:\n')
    distance = 0
    min_distance = inf
    winner_node_ind = -1
    for i in range(len(som)):
        # Let's calculate the distance to every node in the SOM
        distance = np.linalg.norm(np.array(som[i])-np.array(input_vector))
        #print(distance)
        if distance < min_distance:
            min_distance = distance
            winner_node_ind = i
    return(winner_node_ind)

def distance_restraint(closest_dist, curr_node):
    coefficient = 1.0
    curr_dist = np.linalg.norm(np.array(curr_node)-np.array(input_vector))
    if curr_dist < closest_dist:
        print("ERROR, curr_dist {} < closest_dist {}".format(curr_dist,closest_dist))
    else:
        coefficient = float(closest_dist)/curr_dist
    print(coefficient)
    return(coefficient)
    
def update_nodes(som, winner_ind, input_vector):
    print('updating nodes:\n')
    closest_dist = np.linalg.norm(np.array(som[winner_ind])-np.array(input_vector))
    print("closest dist = {}".format(closest_dist))
    for i in range(len(som)):
        som[i] = (np.array(som[i]) + distance_restraint(closest_dist, som[i])*(np.array(som[winner_ind]) - np.array(input_vector))).tolist()
        print(som[i])
    return(som)
    
def create_random_weigths(dim):
    resulting_vector = [0 for x in range(dim)]
    for i in range(dim):
        resulting_vector[i] = random.randint(min_val,max_val)
    return(resulting_vector)
    

input_vector = (4,53,6)
print("input data - {}".format(input_vector))

som = init()

winner_ind = find_winner(som, input_vector)
print("here is a winner {}, for {}, with the distance {}".format(som[winner_ind], input_vector, np.linalg.norm(np.array(som[winner_ind])-np.array(input_vector))))
som2 = copy.copy(som)
som2 = update_nodes(som2, winner_ind, input_vector)

print("after one iteration of SOM:")
for i in range(len(som)):
    print("{} vs {}".format(som[i], som2[i]))