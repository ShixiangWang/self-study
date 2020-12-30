#!/usr/bin/env python3
# 获取天气文件
import requests
from lxml import etree

def get_weather(keyword):
    url = 'https://www.tianqi.com/tianqi/search?keyword=' + keyword
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'
    }
    response = requests.get(url, headers = headers)
    tree = etree.HTML(response.text)
    try:
        city_name = tree.xpath('//dd[@class="name"]/h2/text()')[0]
    except:
        content = '没有该城市天气信息，请确认查询格式'
        return content
    week = tree.xpath('//dd[@class="week"]/text()')[0]
    now  = tree.xpath('//p[@class="now"]')[0].xpath('string(.)')
    temp = tree.xpath('//dd[@class="weather"]/span')[0].xpath('string(.)')
    shidu  = tree.xpath('//dd[@class="shidu"]/b/text()')
    kongqi = tree.xpath('//dd[@class="kongqi"]/h5/text()')[0]
    pm     = tree.xpath('//dd[@class="kongqi"]/h6/text()')[0]
    content = "【{0}】{1}天气\n当前温度：{2}\n今日天气：{3}\n{4}\n{5}\n{6}".format(city_name, week.split('\u3000')[0], now, temp, '\n'.join(shidu), kongqi, pm)

    return content

if __name__ == "__main__":
    keyword = '上海'
    content = get_weather(keyword)
    print(content)