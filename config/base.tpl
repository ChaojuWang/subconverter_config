
{% if request.target == "clash" or request.target == "clashr" %}

port: {{ global.clash.http_port }}
socks-port: {{ global.clash.socks_port }}
allow-lan: {{ global.clash.allow_lan }}
mode: Rule
log-level: {{ global.clash.log_level }}
external-controller: :9090
{% if exists("request.clash.dns") %}
{% if request.clash.dns == "1" %}
dns:
  enabled: true
  listen: 1053
{% endif %}
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = warning
http-listen = 0.0.0.0:8888
socks5-listen = 0.0.0.0:8889
external-controller-access = lhie1@0.0.0.0:6170
internet-test-url = http://www.qualcomm.cn/generate_204
proxy-test-url = http://www.qualcomm.cn/generate_204
test-timeout = 3
ipv6 = true
show-error-page-for-reject = true
bypass-system = true
#DNS设置或根据自己网络情况进行相应设置
dns-server = system, 1.1.1.1, 8.8.8.8, 119.29.29.29, 119.28.28.28, 182.254.116.116
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
exclude-simple-hostnames = true
use-default-policy-if-wifi-not-primary = false
allow-wifi-access = true
enhanced-mode-by-rule = false
network-framework = true
#接管google系智能硬件产品
hijack-dns = 8.8.8.8:53, 8.8.4.4:53
#主机支持
always-real-ip = *.srv.nintendo.net, *.stun.playstation.net, xbox.*.microsoft.com, *.xboxlive.com

[Replica]
hide-apple-request=1
hide-crashlytics-request=1
hide-udp=0
keyword-filter-type=(null)
keyword-filter=(null)

[Proxy]
AWS PCSS = ss, ec2-52-63-208-169.ap-southeast-2.compute.amazonaws.com, 8388, encrypt-method=chacha20-ietf-poly1305, password=wcj1997220, udp-relay=true

[Rule]
DOMAIN-SUFFIX,umeng.com,REJECT

[URL Rewrite]
^https?://(www.)?g.cn https://www.google.com 302
^https?://(www.)?google.cn https://www.google.com 302
^https?://coupon.m.jd.com/ https://coupon.m.jd.com/ 302
^https?://h5.m.jd.com/ https://h5.m.jd.com/ 302
^https?://item.m.jd.com/ https://item.m.jd.com/ 302
^https?://m.jd.com/ https://m.jd.com/ 302
^https?://newcz.m.jd.com/ https://newcz.m.jd.com/ 302
^https?://p.m.jd.com/ https://p.m.jd.com/ 302
^https?://so.m.jd.com/ https://so.m.jd.com/ 302
^https?://union.click.jd.com/jda? http://union.click.jd.com/jda?adblock= header
^https?://union.click.jd.com/sem.php? http://union.click.jd.com/sem.php?adblock= header
^https?://www.jd.com/ https://www.jd.com/ 302
^https?://m.taobao.com/ https://m.taobao.com/ 302
^https?://.+.(m.)?wikipedia.org/wiki http://www.wikiwand.com/en 302
^https?://zh.(m.)?wikipedia.org/(zh-hans|zh-sg|zh-cn|zh(?=/)) http://www.wikiwand.com/zh 302
^https?://zh.(m.)?wikipedia.org/zh-[a-zA-Z]{2,} http://www.wikiwand.com/zh-hant 302
^https://nomo.dafork.com/api/v3/iap/ios_product_list https://files.catbox.moe/fgmkpy.json 302
^https?://cfg.m.ttkvod.com/mobile/ttk_mobile_1.8.txt http://ogtre5vp0.bkt.clouddn.com/Static/TXT/ttk_mobile_1.8.txt header
^https?://cnzz.com/ http://ogtre5vp0.bkt.clouddn.com/background.png? header
^https?://m.qu.la/stylewap/js/wap.js http://ogtre5vp0.bkt.clouddn.com/qu_la_wap.js 302
^https?://m.yhd.com/1/\? http://m.yhd.com/1/?adbock= 302
^https?://n.mark.letv.com/m3u8api/ http://burpsuite.applinzi.com/Interface header
^https?://sqimg.qq.com/ http://sqimg.qq.com/ 302
^https?://static.m.ttkvod.com/static_cahce/index/index.txt http://ogtre5vp0.bkt.clouddn.com/Static/TXT/index.txt header
^https?://www.iqshw.com/d/js/m http://burpsuite.applinzi.com/Interface header
^https?://www.iqshw.com/d/js/m http://rewrite.websocket.site:10/Other/Static/JS/Package.js? header

[MITM]
skip-server-cert-verify = true
hostname = *.360buyimg.com, *.chelaile.net.cn, *.cnbetacdn.com, *.didistatic.com, *.doubanio.com, *.google-analytics.com, *.iydsj.com, *.k.sohu.com, *.kfc.com, *.kingsoft-office-service.com, *.meituan.net, *.ofo.com, *.pixiv.net, *.pstatp.com, *.uve.weibo.com, *.wikipedia.org, *.wikiwand.com, *.ydstatic.com, *.youdao.com, *.youtube.com, *.zhuishushenqi.com, *.zymk.cn, 101.201.62.22, 113.105.222.132, 113.96.109.*, 118.178.214.118, 119.18.193.135, 121.14.89.216, 121.9.212.178, 123.59.31.1, 14.21.76.30, 153.3.236.81, 180.101.212.22, 183.232.237.194, 183.232.246.225, 183.60.159.227, 218.11.3.70, 59.151.53.6, 59.37.96.220, 789.kakamobi.cn, a.apicloud.com, a.applovin.com, a.qiumibao.com, a.sfansclub.com, a.wkanx.com, aarkissltrial.secure2.footprint.net, acs.m.taobao.com, act.vip.iqiyi.com, activity2.api.ofo.com, adm.10jqka.com.cn, adproxy.autohome.com.cn, adse.ximalaya.com, afd.baidu.com, api*.musical.ly, api*.tiktokv.com, api.abema.io, api.app.vhall.com, api.bilibili.com, api.chelaile.net.cn, api.daydaycook.com.cn, api.douban.com, api.feng.com, api.fengshows.com, api.gotokeep.com, api.huomao.com, api.intsig.net, api.jr.mi.com, api.jxedt.com, api.k.sohu.com, api.kkmh.com, api.laifeng.com, api.live.bilibili.com, api.m.mi.com, api.mddcloud.com.cn, api.mgzf.com, api.psy-1.com, api.rr.tv, api.smzdm.com, api.tv.sohu.com, api.wallstreetcn.com, api.weibo.cn, api.xiachufang.com, api.zhihu.com, api.zhuishushenqi.com, api5.futunn.com, api-mifit.huami.com, api-mifit-cn.huami.com, api-release.wuta-cam.com, app.10086.cn, app.58.com, app.api.ke.com, app.bilibili.com, app.m.zj.chinamobile.com, app.mixcapp.com, app.variflight.com, app.wy.guahao.com, app2.autoimg.cn, appsdk.soku.com, atrace.chelaile.net.cn, b.zhuishushenqi.com, c.m.163.com, cap.caocaokeji.cn, capi.douyucdn.cn, capi.mwee.cn, cdn.kuaidi100.com, cdn.moji.com, channel.beitaichufang.com, classbox2.kechenggezi.com, client.mail.163.com, cms.daydaycook.com.cn, connect.facebook.net, consumer.fcbox.com, creatives.ftimg.net, creditcard.ecitic.com, d.1qianbao.com, daoyu.sdo.com, dapis.mting.info, dl.app.gtja.com, dongfeng.alicdn.com, dsp-impr2.youdao.com, dspsdk.abreader.com, e.dangdang.com, erebor.douban.com, fdfs.xmcdn.com, fm.fenqile.com, frodo.douban.com, fuss10.elemecdn.com, g1.163.com, gateway.shouqiev.com, gorgon.youdao.com, gw.alicdn.com, gw-passenger.01zhuanche.com, hm.xiaomi.com, hui.sohu.com, huichuan.sm.cn, i.weread.qq.com, i.ys7.com, i1.hoopchina.com.cn, iapi.bishijie.com, iface.iqiyi.com, iface2.iqiyi.com, img*.doubanio.com, img.jiemian.com, img.zuoyebang.cc, img01.10101111cdn.com, img1.126.net, img1.doubanio.com, img3.doubanio.com, impservice.dictapp.youdao.com, impservice.youdao.com, interface.music.163.com, ios.prod.ftl.netflix.com, ios.wps.cn, kano.guahao.cn, lives.l.qq.com, m*.amap.com, m.aty.sohu.com, m.client.10010.com, m.creditcard.ecitic.com, m.ibuscloud.com, m.yap.yahoo.com, m5.amap.com, ma.ofo.com, mage.if.qidian.com, mapi.appvipshop.com, mapi.mafengwo.cn, mapi.weibo.com, mbl.56.com, media.qyer.com, mi.gdt.qq.com, mimg.127.net, mmg.aty.sohu.com, mmgr.gtimg.com, mob.mddcloud.com.cn, mobile-api2011.elong.com, mp.weixin.qq.com, mrobot.pcauto.com.cn, mrobot.pconline.com.cn, ms.jr.jd.com, msspjh.emarbox.com, newsso.map.qq.com, nex.163.com, nnapp.cloudbae.cn, open.qyer.com, p.kuaidi100.com, p1.music.126.net, pic.k.sohu.com, pic1.chelaile.net.cn, pic1cdn.cmbchina.com, pic2.zhimg.com, portal-xunyou.qingcdn.com, pss.txffp.com, r.inews.qq.com, render.alipay.com, resource.cmbchina.com, res-release.wuta-cam.com, ress.dxpmedia.com, richmanapi.jxedt.com, rm.aarki.net, rtbapi.douyucdn.cn, service.4gtv.tv, slapi.oray.net, smkmp.96225.com, snailsleep.net, sp.kaola.com, ssl.kohsocialapp.qq.com, sso.ifanr.com, static.api.m.panda.tv, static.vuevideo.net, static1.keepcdn.com, staticlive.douyucdn.cn, storage.wax.weibo.com, support.you.163.com, supportda.ofo.com, thor.weidian.com, ups.youku.com, wapwenku.baidu.com, wenku.baidu.com, www.dandanzan.com, www.facebook.com, www.flyertea.com, www.ft.com, www.oschina.net, www.zhihu.com, youtubei.googleapis.com, zhidao.baidu.com, wapside.189.cn:9001, *.acfun.cn, *.bilibili.com, music.163.com, *.m.163.com, tieba.baidu.com, *.v2ex.com, *.rrys2019.com, ios.zmzapi.com, api.m.jd.com
ca-passphrase = DlerCloud
ca-p12 = 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

[Script]
cron "15 0 8,12,18 * * *" debug=1,script-path=Scripts/weather_pro_hourly.js
cron "30 0 8 * * *" debug=1,script-path=Scripts/weather_pro_daily.js
cron "0 0 8-20 * * *" debug=1,script-path=Scripts/weather_pro.js
http-request https:\/\/api\.m\.jd\.com\/client\.action.*functionId=signBean(Index|GroupStageIndex) max-size=0,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js
cron "5 2,3 * * *" script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js,script-update-interval=0
// http-request ^https?:\/\/(www\.)?rrys2019\.com\/?.? script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/zimuzu/zimuzu.cookie.js
// http-request ^http:\/\/ios.zmzapi.com\/index.php.*a=(mobile_)?login script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/zimuzu/zimuzu.cookie.js
cron "25 0,5,10 2 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/zimuzu/zimuzu.js,script-update-interval=0
// http-request ^https:\/\/www\.v2ex\.com\/mission\/daily script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/v2ex/v2ex.cookie.js
cron "20 0,5,10 2 * * *" debug=1,script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/v2ex/v2ex.js,script-update-interval=0
// http-request ^https?:\/\/tieba\.baidu\.com\/?.? script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/tieba/tieba.cookie.js
cron "10 0-7 2 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/tieba/tieba.js,script-update-interval=0
http-request ^https:\/\/c\.m\.163\.com\/uc\/api\/sign\/v2\/commit script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/neteasenews/neteasenews.cookie.js,requires-body=true
cron "20 0,5,10 2 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/neteasenews/neteasenews.js,script-update-interval=0
// http-request ^https?:\/\/music\.163\.com\/?.? script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/neteasemusic/neteasemusic.cookie.js
cron "20 0,5,10 2 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/neteasemusic/neteasemusic.js,script-update-interval=0
// http-request ^https:\/\/(www|live)\.bilibili\.com\/?.? script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.cookie.js,script-update-interval=0
cron "15 0,5,10 2 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.js,script-update-interval=0
// http-request ^https:\/\/api\-new\.app\.acfun\.cn\/rest\/app\/user\/personalInfo script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/acfun/acfun.cookie.js
cron "15 0,5,10 2 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/acfun/acfun.js,script-update-interval=0
http-request ^https:\/\/wapside.189.cn:9001\/api\/home\/homeInfo script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10000/10000.cookie.js
http-response ^https:\/\/wapside.189.cn:9001\/api\/home\/homeInfo script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10000/10000.cookie.js,requires-body=true
cron "15 0,5,10 2 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10000/10000.js,script-update-interval=0
http-response ^https?://m?api\.weibo\.c(n|om)/2/(statuses/(unread|extend|positives/get|(friends|video)(/|_)timeline)|stories/(video_stream|home_list)|(groups|fangle)/timeline|profile/statuses|comments/build_comments|photo/recommend_list|service/picfeed|searchall|cardlist|page|\!/photos/pic_recommend_status) requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/wb_ad.js
http-response ^https?://(sdk|wb)app\.uve\.weibo\.com(/interface/sdk/sdkad.php|/wbapplua/wbpullad.lua) requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/wb_launch.js
http-request ^https://mp\.weixin\.qq\.com/mp/getappmsgad script-path=https://Choler.github.io/Surge/Script/WeChat.js
http-request ^https://[\s\S]*\.googlevideo\.com/.*&(oad|ctier) script-path=https://Choler.github.io/Surge/Script/YouTube.js
http-response ^https://[\s\S]*\/aweme/v1/(feed|aweme/post|follow/feed)/ requires-body=1,max-size=-1,script-path=https://Choler.github.io/Surge/Script/Aweme.js
http-response ^https?://[a-z]*\.snssdk\.com/bds/feed/stream/ requires-body=1,max-size=-1,script-path=https://Choler.github.io/Surge/Script/Super.js
http-response ^https?://[\s\S]*\.snssdk\.com/api/news/feed/v88/ requires-body=1,max-size=-1,script-path=https://Choler.github.io/Surge/Script/Toutiao.js
http-request ^https://sp\.kaola\.com/api/openad$ script-path=https://Choler.github.io/Surge/Script/Kaola.js
http-response https://r\.inews\.qq.com\/get(QQNewsUnreadList|RecommendList) requires-body=1,max-size=-1,script-path=https://Choler.github.io/Surge/Script/QQNews.js
http-response ^https://api\.rr\.tv/v3plus/index/(channel|todayChoice)$ requires-body=1,max-size=-1,script-path=https://Choler.github.io/Surge/Script/RRad.js
http-response ^https://api.zhihu.com/moments\?(action|feed_type) requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20feed.js
http-response ^https://api.zhihu.com/topstory/recommend requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20recommend.js
http-response ^https://api.zhihu.com/v4/questions requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20answer.js
http-response ^https://api.zhihu.com/people/ requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20people.js
http-response ^https://app.bilibili.com/x/v2/space\?access_key requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20space.js
http-response ^https://app.bilibili.com/x/resource/show/tab\?access_key requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20tab.js
http-response ^https://app.bilibili.com/x/v2/feed/index\?access_key requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20feed.js
http-response ^https://app.bilibili.com/x/v2/account/mine\?access_key requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20account.js
http-response ^https://app.bilibili.com/x/v2/view\?access_key requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20view%20relate.js
http-response ^https://api.live.bilibili.com/xlive/app-room/v1/index/getInfoByRoom\?access_key requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20live.js
http-response ^https://api.bilibili.com/pgc/view/app/season requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/UnblockBangumi/master/surge/surge%20bilibili%20season.js
http-response ^https://api.bilibili.com/pgc/player/api/playurl requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/onewayticket255/UnblockBangumi/master/surge/surge%20bilibili%20playurl.js
http-request ^https?://ios\.prod\.ftl\.netflix\.com/iosui/user/.+path=%5B%22videos%22%2C%\d+%22%2C%22summary%22%5D script-path=https://raw.githubusercontent.com/yichahucha/surge/master/nf_rating.js
http-response ^https?://ios\.prod\.ftl\.netflix\.com/iosui/user/.+path=%5B%22videos%22%2C%\d+%22%2C%22summary%22%5D requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/nf_rating.js
http-response ^https?://api\.m\.jd\.com/client\.action\?functionId=(wareBusiness|serverConfig) requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/jd_price.js
http-response ^https://trade-acs.m.taobao.com/gw/mtop.taobao.detail.getdetail requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/tb_price.js

http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/Surge/iQIYI-DailyBonus/iQIYI_GetCookie.js

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]

[filter_remote]

[rewrite_remote]

[server_local]

[filter_local]

[rewrite_local]

[mitm]

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}