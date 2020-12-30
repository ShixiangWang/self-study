#!/usr/bin/env python3
# 获取笑话文件
import requests
from lxml import etree
from random import randint

def get_joke():
    url = "http://www.qiushibaike.com/text/"
    r = requests.get(url)
    tree = etree.HTML(r.text)
    contenlist  = tree.xpath('//div[@class="content"]/span')
    
    jokes = []

    for content in contenlist:
        content = content.xpath('string(.)')
        jokes.append(content)

    joke = jokes[randint(1, len(jokes))].strip()
    return joke


if __name__ == "__main__":
    content = get_joke()
    print(content)
