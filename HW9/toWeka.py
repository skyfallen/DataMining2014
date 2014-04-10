m = open('output.txt').readlines()
v = map(lambda x: '[SPAM]' in x, m)
m = map(lambda x: x.replace('[SPAM]  ','').replace("'",'').strip(), m)
f = open("my_mails.arff", "w")
print >> f, "@relation 'mailbox'"
print >> f, "@attribute text string"
print >> f, "@attribute class {0,1}"
print >> f, "@data"
for (s,c) in zip(m,v):
    print >>f, "'%s',%d" % (s,c)
f.close()