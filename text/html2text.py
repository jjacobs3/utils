# Standardized function for converting an html doc to a text file
from bs4 import BeautifulSoup

def removeNonVisible(soup):
    for cur_script in soup.findAll("script"):
        cur_script.decompose()

def html2text(html_str):
    # HTML string -> text string
    cur_soup = BeautifulSoup(html_str, "lxml")
    removeNonVisible(cur_soup)
    soup_text = cur_soup.get_text()
    return soup_text