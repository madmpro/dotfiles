#!/usr/bin/python3

#from google import google
from googlesearch import search
# from clint.textui import colored
#from termcolor import colored
import colors

site = raw_input("Insert domain:")
# attacks
dir_listing = "site:"+site+" intitle:index.of"
conf_exposed = "site:"+site+" ext:xml | ext:conf | ext:cnf | ext:reg | ext:inf | ext:rdp | ext:cfg | ext:txt | ext:ora | ext:ini"
db_exposed = "site:"+site+" ext:sql | ext:dbf | ext:mdb"
log_exposed = "site:"+site+" ext:log"
bk_exposed = "site:"+site+" ext:bkf | ext:bkp | ext:bak | ext:old | ext:backup"
login_page = "site:"+site+" inurl:login"
sql_error = 'site:'+site+' intext:"sql syntax near" | intext:"syntax error has occurred" | intext:"incorrect syntax near" | intext:"unexpected end of SQL command" | intext:"Warning: mysql_connect()" | intext:"Warning: mysql_query()" | intext:"Warning: pg_connect()"'
doc_exposed = 'site:'+site+' ext:doc | ext:docx | ext:odt | ext:pdf | ext:rtf | ext:sxw | ext:psw | ext:ppt | ext:pptx | ext:pps | ext:csv'
php_info = 'site:'+site+' ext:php intitle:phpinfo "published by the PHP Group"'
# results number
result_number = '30'

def menu():
    print ("")
    print (colored.yellow("##########################"))
    print (colored.yellow("##### Google Hacking #####"))
    print (colored.yellow("##########################"))
    print ("")
    print (colored.blue("Menu"))
    print ("0 - Exit")
    print ("1 - Search for Directoruy Listings")
    print ("2 - Search for exposed conf files")
    print ("3 - Search for exposed db files")
    print ("4 - Search for exposed log files")
    print ("5 - Search for exposed backup files")
    print ("6 - Search for login pages")
    print ("7 - Search for sql error")
    print ("8 - Search for exposed doc files")
    print ("9 - Search for php_info")
    print ("")

while True:
    menu()
    choosenMenu = int(raw_input("Please select an option: "))
    if choosenMenu == 0:
        print (colored.red("Bye bye"))
        break;
    elif choosenMenu == 1:
        for url in search(dir_listing, stop=20):
            print(url)
    elif choosenMenu == 2:
    	for url in search(conf_exposed, stop=20):
            print(url)
    elif choosenMenu == 3:
        for url in search(db_exposed, stop=20):
            print(url)
    elif choosenMenu == 4:
        for url in search(log_exposed, stop=20):
            print(url)
    elif choosenMenu == 5:
        for url in search(bk_exposed, stop=20):
            print(url)
    elif choosenMenu == 6:
    	for url in search(login_page, stop=20):
            print(url)
    elif choosenMenu == 7:
        for url in search(sql_error, stop=20):
            print(url)
    elif choosenMenu == 8:
        for url in search(doc_exposed, stop=20):
            print(url)
    elif choosenMenu == 9:
        for url in search(php_info, stop=20):
            print(url)
    else:
        print (colored.red("Option not recognized"))
