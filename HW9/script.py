'''
Script for reading in the data for Data Mining course in the University of Tartu
'''

subjects = ()

for i in range(4327):
    serial = str(i)
    while len(serial) < 4:
        serial = '0' + serial
    file_name = 'NEW\TRAIN_0' + serial +'.eml'
    f = open(file_name)
    if f:
        print("{} is getting read".format(file_name))
    if not subjects:
        subjects = list(f.readline())
    else:
        subjects.append(f.readline())
print("Done")
#print(subjects)
o = open('output.txt', 'w')
for i in range(len(subjects)):
    subjects[i] = subjects[i].replace('[spam] ','')
    o.write(subjects[i])
