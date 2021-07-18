#!/usr/bin/python
#
# extract urls from a file
#

import sys, re, urllib, HTMLParser
from BeautifulSoup import BeautifulSoup
from xml.dom import minidom

URL = "file:///Users/codecrumb/Downloads/delicious.htm"

html = urllib.request.urlopen(URL).read()
soup = BeautifulSoup(html)

for link in soup.findAll("a"):
	print(link["href"])
