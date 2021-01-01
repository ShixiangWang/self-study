#!/usr/bin/env python3
# coding: utf-8
import json
import os
import random
import time
from pprint import pprint

import pandas as pd
from wechatarticles import ArticlesInfo
from wechatarticles.utils import get_history_urls
# 快速获取大量文章urls（利用历史文章获取链接）

def save_xlsx(fj, lst):
    df = pd.DataFrame(lst,
                      columns=['url', 'title', 'date', 'read_num', 'like_num'])
    df.to_excel(fj + '.xlsx', encoding='utf-8')


def demo(lst):
    # 抓取示例，供参考，不保证有效
    fj = '优雅R'
    item_lst = []
    for i, line in enumerate(lst, 0):
        print("index:", i)
        # item = json.loads('{' + line + '}', strict=False)
        item = line
        timestamp = item["comm_msg_info"]["datetime"]
        ymd = time.localtime(timestamp)
        date = '{}-{}-{}'.format(ymd.tm_year, ymd.tm_mon, ymd.tm_mday)

        infos = item['app_msg_ext_info']
        url_title_lst = [[infos['content_url'], infos['title']]]
        if 'multi_app_msg_item_list' in infos.keys():
            url_title_lst += [[info['content_url'], info['title']]
                              for info in infos['multi_app_msg_item_list']]

        for url, title in url_title_lst:
            try:
                if not verify_url(url):
                    continue
                # 获取文章阅读数在看点赞数
                read_num, like_num, old_like_num = test.read_like_nums(url)
                print(read_num, like_num)
                item_lst.append([url, title, date, read_num, like_num])
                time.sleep(random.randint(5, 10))
            except Exception as e:
                print(e)
                flag = 1
                break
            finally:
                save_xlsx(fj, item_lst)

        if flag == 1:
            break

    save_xlsx(fj, item_lst)


if __name__ == '__main__':
    # 需要抓取公众号的__biz参数
    biz = 'MzA5NjAyMzU1OA=='
    # 个人微信号登陆后获取的uin
    uin = 'MjI0MjMyMDk2MQ=='
    # 个人微信号登陆后获取的key，隔段时间更新
    key = 'cb455b773ffdb51212cc8d71e5b940c8219bdda4f250bc032f92e77a028ebaedb0d17879d873c76f33486f70263529ac96b8100fec7ca46dd0a012f8a85a17f9e5c293ca0ed2afad55774b337b015eda2a7df3c1655ff4d5437d14a8ea21af35c3ee2b6e711bfed4f9e72c5cfdbde24b2c168d063ab6f283c3f79a845e10179a'

    lst = get_history_urls(biz,
                           uin,
                           key,
                           lst=[],
                           start_timestamp=0,
                           count=0,
                           endcount=10)
    print("抓取到的文章链接")
    print(lst)

    # 个人微信号登陆后获取的token
    appmsg_token = "1094_3Fj7Awoexk3%2BW%2FVj1D1sUNrMk72MD4HjIxoEc2HC3_TJEuJ0QBielAk9w6CHIDmTxApjVtOnlOQZGjfK"
    # 个人微信号登陆后获取的cookie
    cookie = "devicetype=iMacMacBookPro163OSXOSX10.16build(20C69); lang=zh_CN; pass_ticket=gDYLxunJEIAhOBkjQo/ImGl6EeTuxkF+L4pnPrUHMfDLhcVrgfn5ZeNu7wx/SpU8; rewardsn=; version=12050010; wap_sid2=CMG0nK0IEooBeV9ISG1SeTFXTFdOUWVPcHFlbGFkUklfemJuX01CUjRRb1pzek5kMjh6QkJPVHV4aklhT3FHaGltT0JtdFhNaE5fS3hTTTFnU2o0REtrWFM5RDhmYTRZbFdTZ1I0dWZqaFRsZ21ScGF4X2hxYTJGc0U3bXFtazUtbm1TdW5hUWM5LXZTTVNBQUF+MNyhu/8FOA1AAQ==; wxtokenkey=777; wxuin=2242320961"
    # 获取点赞数、阅读数、评论信息
    test = ArticlesInfo(appmsg_token, cookie)

    # url：微信文章链接
    read_num, like_num, old_like_num = test.read_like_nums(url)
    item = test.comments(url)
    print("阅读：{}; 在看: {}; 点赞: {}".format(read_num, like_num, old_like_num))
    print("评论信息")
    pprint(item)