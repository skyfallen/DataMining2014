#load datafrom the url
data_url = url("https://courses.cs.ut.ee/MTAT.03.183/2014_spring/uploads/Main/titanic.txt")
titanic = read.table(data_url, sep =',', header = TRUE)

tt = table(titanic$Survived, titanic$Sex)

#P(Female|Survived)

344/(344+367)
#P(Male|Survied)
367/(344+367)

#P(Survived|Male)
367/(1364+367)

#P(Y|X)/P(Y)
conf =367/(1364+367)
all =(126+1364+344+367)
p_y = 1364+367/all
conf/p_y

p_xy = 367/all

p_x = (344+367)/all
p_y
p_xy/(p_x*p_y)


#generting values for three tables

fff =  round(runif(4000, min = 0, max = 1000),0)
zz = as.data.frame(matrix(fff,ncol=4))

noise = matrix(round(rweibull(4000, shape = 1)), ncol =4)
new = zz+noise

names(new) = c("f00","f01","f10","f11")
