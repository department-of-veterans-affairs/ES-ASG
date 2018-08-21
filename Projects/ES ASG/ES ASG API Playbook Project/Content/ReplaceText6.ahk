FileRead, aTOC, C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\TOC.txt

StringReplace, aTOC,aTOC,",, All

FileRead, aIndex, C:\GitHub\ES-ASG\docs\Index.html

aNewIndex:=RegExReplace(aIndex,"s)<!-- Index Start -->.*<!-- Index Stop -->",aTOC, aCount)

aFile:=FileOpen("C:\GitHub\ES-ASG\docs\Index.html", "w")
aFile.Write(aNewIndex)
aFile.Close()

FileRead, aHome, C:\GitHub\ES-ASG.wiki\Home.md

aNewHome:=RegExReplace(aHome,"s)<!-- Index Start -->.*<!-- Index Stop -->",aTOC, aCount)

aFile:=FileOpen("C:\GitHub\ES-ASG.wiki\Home.md", "w")
aFile.Write(aNewHome)
aFile.Close()

