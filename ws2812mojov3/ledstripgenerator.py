NUMLEDS = 120
#An LED has a tuple with (G,R,B) for 0 <= G,R,B < 256
ledlist = []



for i in range(NUMLEDS):
    ledlist.append((50,50,50))

def ledlistunpacking(ledlist):
    returnable = []
    for i in ledlist[::-1]:
        emptystring = ""
        emptystring += "{0:b}".format(i[0])
        emptystring += "{0:b}".format(i[1])
        emptystring += "{0:b}".format(i[2])
        returnable.append(emptystring)
    return returnable


returnedlist = ledlistunpacking(ledlist)

for i in range(len(returnedlist)):
    print(str(i) + " : datareg[23:0]=24'b" + str(returnedlist[i])+";")