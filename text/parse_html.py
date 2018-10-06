# Produces .txt files containing just text (without the markup). Can be run from
# the command line or imported into another .py file
import os
import codecs
import glob
import re

from bs4 import BeautifulSoup

def removeNonVisible(soup):
    for cur_script in soup.findAll("script"):
        cur_script.decompose()

def loadHTML(html_filepath):
    with codecs.open(html_filepath, "r", "utf-8", errors="ignore") as f:
        cur_html = (' '.join(f.readlines())).replace("\n"," ").replace("\r"," ")
    return cur_html

def html2text(html_str):
    # HTML -> text
    soup = BeautifulSoup(html_str, "lxml")
    removeNonVisible(soup)
    soup_text = soup.get_text()
    return soup_text

def loadHTMLFolder(html_location):
    all_files = os.listdir(html_location)
    html_files = [cur_file for cur_file in all_files if "htm" in cur_file]
    html_strs = []
    for cur_filename in html_files:
        cur_filepath = os.path.join(html_location, cur_filename)
        soup_text = loadHTML(cur_filepath)
        html_strs.append(soup_text)

def streamHTMLFolder(html_path):
    all_filepaths = glob.glob(os.path.join(html_path, "*.html"))
    for cur_filepath in all_filepaths:
        cur_html = loadHTML(cur_filepath)
        yield cur_filepath, cur_html

def saveText(text, output_filepath):
    with codecs.open(output_filepath, "w", "utf-8", errors="ignore") as g:
        g.write(text)

def main():
    for cur_filepath, cur_html in streamHTMLFolder("./html"):
        print("Parsing " + cur_filepath)
        cur_txt = html2text(cur_html)
        # Generate the output filename
        output_filename = os.path.basename(cur_filepath).replace(".html",".txt")
        output_filepath = os.path.join("txt", output_filename)
        # And save to .txt
        saveText(cur_txt, output_filepath)

if __name__ == "__main__":
    main()