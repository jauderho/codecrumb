#!/usr/bin/python
#
# extract urls from a file
#

import re
import sys
import urllib
from xml.dom import minidom

import HTMLParser
from BeautifulSoup import BeautifulSoup

URL = "file:///Users/codecrumb/Downloads/delicious.htm"

html = urllib.urlopen(URL).read()
soup = BeautifulSoup(html)

for link in soup.findAll("a"):
	print(link["href"])
