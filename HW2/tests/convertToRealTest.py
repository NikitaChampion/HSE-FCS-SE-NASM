r = open('test_1.1.txt','r')
n = r.read(3)
w = open('real_test_1.1.txt','w')
w.write(n + '\n' + '\n'.join(r.read().split(' ')))
