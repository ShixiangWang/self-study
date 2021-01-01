#!/usr/bin/env python3
# coding: utf-8
# link: <https://github.com/wnma3mz/wechat_articles_spider/blob/master/test/test_ArticlesAPI.py>
import os
#from pprint import pprint
from wechatarticles import ArticlesAPI
#from wechatarticles import tools
import time

if __name__ == '__main__':
    # 利用公众号获取链接，并获取阅读点赞
    official_cookie = "noticeLoginFlag=1; appmsglist_action_3096023558=card; ua_id=RePRDIRftjAGHy05AAAAAPW8bcHRMthDqfy8JsxaD5s=; pgv_pvi=3371495424; mm_lang=zh_CN; RK=aDQFD3PSHw; ptcz=a25baff92fd9f4d477b82a2f52e0ed89499dea814692035f0fa6892f49539f06; pgv_pvid=5039482995; ts_uid=355394036; wxuin=06215516851375; pac_uid=0_332b077ce648d; bizuin=3096023558; rand_info=CAESINRc8e1uLZRe+5G8nPoAERKpLvj1j8f/UonkQaHbni3s; slave_bizuin=3096023558; data_bizuin=3096023558; data_ticket=lWRDTMExqSRA8+IrNAPk1igwbRqJKTZmrdPWYP4QI2FrhcLCOaRuKTyAU+3h2UNl; slave_sid=dVhQZVc1UzV1VlhxRURQbGNTUjNTcmdaX1NLN0tYWnJBcVRTR1lLVnRZbzJrRWtxQ3RqVkZfNk5CazE4bGk2UnFEWFBoU2hXYmJrS0g4RXJyU2dibzVZR0l1Y3I4Y0xhMkRNenpYb1NEV2JiSEhMTkNaQVBMVHdTSk5FdzJBcDF2bktUNTVpRzJ5b1FkVzdy; slave_user=gh_3eda3022de6f; xid=7dd534da57d8742e457f0184b3653a99; openid2ticket_oBpKJuOeKfl3mR9jt2SpXLjvUpNU=blouVLdsHDLgB0apRAxCy+fiquFe25ddoCJLoPm0PYA=; rewardsn=; wxtokenkey=777"
    token = "491491793"
    appmsg_token = "1094_3Fj7Awoexk3%2BW%2FVj1D1sUNrMk72MD4HjIxoEc2HC3_TJEuJ0QBielAk9w6CHIDmTxApjVtOnlOQZGjfK"
    wechat_cookie = "devicetype=iMacMacBookPro163OSXOSX10.16build(20C69); lang=zh_CN; pass_ticket=gDYLxunJEIAhOBkjQo/ImGl6EeTuxkF+L4pnPrUHMfDLhcVrgfn5ZeNu7wx/SpU8; rewardsn=; version=12050010; wap_sid2=CMG0nK0IEooBeV9ISG1SeTFXTFdOUWVPcHFlbGFkUklfemJuX01CUjRRb1pzek5kMjh6QkJPVHV4aklhT3FHaGltT0JtdFhNaE5fS3hTTTFnU2o0REtrWFM5RDhmYTRZbFdTZ1I0dWZqaFRsZ21ScGF4X2hxYTJGc0U3bXFtazUtbm1TdW5hUWM5LXZTTVNBQUF+MNyhu/8FOA1AAQ==; wxtokenkey=777; wxuin=2242320961"

    nickname = "优雅R"

    # 手动输入所有参数
    test = ArticlesAPI(official_cookie=official_cookie,
                       token=token,
                       appmsg_token=appmsg_token,
                       wechat_cookie=wechat_cookie)


    def loop_query(obj, nickname, begin, count, limits=None):
        if limits is None:
            limits = 100
        try:    
            data = obj.complete_info(nickname=nickname, begin=begin, count=count)
        except Exception as e:
            print("-----")
            print(e)
            print("-----")
            if limits == 0:
                print("爬取已完成或者出现了其他错误。")
                os.Exit(0)
            print("delay %d seconds" % time_delay)
            limits = limits - 1
            print("time limits: %d" % limits)
            time.sleep(time_delay)
            return loop_query(obj, nickname, begin, count, limits = limits)
        return data

    # 自定义爬取，每次爬取5篇以上
    start = 0
    count = 10 # 不是每次得到的都一样
    time_delay = 60 * 3

    for i in range(100):
        if i != 0:
            start += len(data)
        print("===============")
        print("Query round: " + str(i))
        print("Start set to: %d" % start)
        print()
        data = loop_query(test, nickname, start, count)
        with open('out.csv', 'a') as f:
            for j in range(len(data)):
                print("Writing wechat post: " + data[j]['title'])
                f.write(data[j]['title'] + ',' + data[j]['link'] + '\n')
    
    #pprint(data)
    # 自定义从某部分开始爬取，持续爬取，直至爬取失败为止，一次性最多爬取40篇（功能未测试，欢迎尝试）
    # datas = test.continue_info(nickname=nickname, begin=0)
    #tools.save_json("test.json", data)