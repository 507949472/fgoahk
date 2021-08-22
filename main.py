# coding:utf-8
import tkinter as tk
import tkinter.messagebox

window = tk.Tk()
window.title("fgo_ahk脚本编辑器")
window.geometry('700x1000')
tishi = tk.Label(window, text="请将本编辑器放入脚本根目录", bg="red", width=30, height=2).pack()

cycle = tk.StringVar()
cyclew = tk.Label(window, text="刷本次数：", bg="green", width=15, height=2).place(x=10, y=50, anchor="nw")
cyclex = tk.Entry(window, textvariable=cycle).place(x=130, y=60, anchor="nw")

overap = tk.StringVar()
overap.set(0)
overapw = tk.Label(window, text="是否清空体力：", bg="green", width=15, height=2).place(x=10, y=100, anchor="nw")
overapx1 = tk.Radiobutton(window, text='是', variable=overap, value=1).place(x=130, y=110, anchor="nw")
overapx2 = tk.Radiobutton(window, text='否', variable=overap, value=0).place(x=180, y=110, anchor="nw")

capple = tk.StringVar()
capple.set(0)
sapple = tk.StringVar()
sapple.set(0)
gapple = tk.StringVar()
gapple.set(0)
kapple = tk.StringVar()
kapple.set(0)
applew = tk.Label(window, text="是否吃苹果：", bg="green", width=15, height=2).place(x=10, y=150, anchor="nw")
applex1 = tk.Checkbutton(window, text='铜苹果', variable=capple, onvalue=1, offvalue=0).place(x=130, y=160, anchor="nw")
applex2 = tk.Checkbutton(window, text='银苹果', variable=sapple, onvalue=1, offvalue=0).place(x=190, y=160, anchor="nw")
applex3 = tk.Checkbutton(window, text='金苹果', variable=gapple, onvalue=1, offvalue=0).place(x=250, y=160, anchor="nw")
applex4 = tk.Checkbutton(window, text='圣晶石', variable=kapple, onvalue=1, offvalue=0).place(x=310, y=160, anchor="nw")

passby = tk.StringVar()
passby.set(0)
passbyw = tk.Label(window, text="助战来源：", bg="green", width=15, height=2).place(x=10, y=200, anchor="nw")
passbyx1 = tk.Radiobutton(window, text='好友', variable=passby, value=1).place(x=130, y=210, anchor="nw")
passbyx2 = tk.Radiobutton(window, text='不限', variable=passby, value=0).place(x=180, y=210, anchor="nw")

supser = tk.StringVar()
supser.set(0)
supserw = tk.Label(window, text="从者选择：", bg="green", width=15, height=2).place(x=10, y=250, anchor="nw")
supserx1 = tk.Radiobutton(window, text='任意', variable=supser, value=0).place(x=130, y=260, anchor="nw")
supserx2 = tk.Radiobutton(window, text='CBA', variable=supser, value=1).place(x=180, y=260, anchor="nw")
supserx3 = tk.Radiobutton(window, text='孔明', variable=supser, value=2).place(x=230, y=260, anchor="nw")
supserx4 = tk.Radiobutton(window, text='术呆', variable=supser, value=3).place(x=280, y=260, anchor="nw")
supserx5 = tk.Radiobutton(window, text='花嫁', variable=supser, value=4).place(x=330, y=260, anchor="nw")
supserx6 = tk.Radiobutton(window, text='狐狸', variable=supser, value=5).place(x=380, y=260, anchor="nw")
supserx7 = tk.Radiobutton(window, text='仇凛', variable=supser, value=6).place(x=430, y=260, anchor="nw")
supserx8 = tk.Radiobutton(window, text='狂娜', variable=supser, value=7).place(x=480, y=260, anchor="nw")
supserx9 = tk.Radiobutton(window, text='梅林', variable=supser, value=8).place(x=530, y=260, anchor="nw")

# 以下内容仅从者选择不为任意时有效
tishi2 = tk.Label(window, text="技能和宝具等级仅在从者选择不为“任意”时生效", bg="red", width=50, height=2).place(x=180, y=300, anchor="nw")

ssk1 = tk.StringVar()
ssk2 = tk.StringVar()
ssk3 = tk.StringVar()
ssk1.set(0)
ssk2.set(0)
ssk3.set(0)
sskw = tk.Label(window, text="技能等级：", bg="green", width=15, height=2).place(x=10, y=350, anchor="nw")
sskx1 = tk.Checkbutton(window, text='1技能满', variable=ssk1, onvalue=1, offvalue=0).place(x=130, y=360, anchor="nw")
sskx2 = tk.Checkbutton(window, text='2技能满', variable=ssk2, onvalue=1, offvalue=0).place(x=200, y=360, anchor="nw")
sskx3 = tk.Checkbutton(window, text='3技能满', variable=ssk3, onvalue=1, offvalue=0).place(x=270, y=360, anchor="nw")

tishi3 = tk.Label(window, text="宝具等级仅在助战来源为好友且从者选择不为“任意”时生效", bg="red", width=50, height=2).place(x=180, y=400,
                                                                                                  anchor="nw")

noblel = tk.StringVar()
noblel.set(0)
noblelw = tk.Label(window, text="宝具等级：", bg="green", width=15, height=2).place(x=10, y=450, anchor="nw")
noblelx0 = tk.Radiobutton(window, text='任意', variable=noblel, value=0).place(x=130, y=460, anchor="nw")
noblelx1 = tk.Radiobutton(window, text='1', variable=noblel, value=1).place(x=180, y=460, anchor="nw")
noblelx2 = tk.Radiobutton(window, text='2', variable=noblel, value=2).place(x=230, y=460, anchor="nw")
noblelx3 = tk.Radiobutton(window, text='3', variable=noblel, value=3).place(x=280, y=460, anchor="nw")
noblelx4 = tk.Radiobutton(window, text='4', variable=noblel, value=4).place(x=330, y=460, anchor="nw")
noblelx5 = tk.Radiobutton(window, text='5', variable=noblel, value=5).place(x=380, y=460, anchor="nw")

scraft = tk.StringVar()
scraft.set(0)
scraftw = tk.Label(window, text="宝具等级：", bg="green", width=15, height=2).place(x=10, y=500, anchor="nw")
scraftx0 = tk.Radiobutton(window, text='任意', variable=scraft, value=0).place(x=130, y=510, anchor="nw")
scraftx1 = tk.Radiobutton(window, text='下午茶', variable=scraft, value=1).place(x=200, y=510, anchor="nw")
scraftx2 = tk.Radiobutton(window, text='贝拉丽莎', variable=scraft, value=2).place(x=270, y=510, anchor="nw")
scraftx3 = tk.Radiobutton(window, text='秉持风雅', variable=scraft, value=3).place(x=340, y=510, anchor="nw")
scraftx4 = tk.Radiobutton(window, text='私人指导', variable=scraft, value=4).place(x=410, y=510, anchor="nw")
scraftx5 = tk.Radiobutton(window, text='宝石翁', variable=scraft, value=5).place(x=480, y=510, anchor="nw")
scraftx6 = tk.Radiobutton(window, text='黑杯', variable=scraft, value=6).place(x=550, y=510, anchor="nw")

obreak = tk.StringVar()
obreak.set(0)
obreakw = tk.Label(window, text="宝石/黑杯满破：", bg="green", width=15, height=2).place(x=10, y=550, anchor="nw")
obreakx0 = tk.Radiobutton(window, text='否', variable=obreak, value=0).place(x=130, y=560, anchor="nw")
obreakx1 = tk.Radiobutton(window, text='是', variable=obreak, value=1).place(x=180, y=560, anchor="nw")

# 模拟器相关，重点
tishi4 = tk.Label(window, text="重要提示，以下内容错误可能会导致卡助战", bg="red", width=50, height=2).place(x=180, y=600, anchor="nw")

mnq = tk.StringVar()
mnq.set(0)
mnqw = tk.Label(window, text="模拟器窗口置顶：", bg="green", width=15, height=2).place(x=10, y=650, anchor="nw")
mnqx0 = tk.Radiobutton(window, text='其他', variable=mnq, value=0).place(x=130, y=660, anchor="nw")
mnqx1 = tk.Radiobutton(window, text='mumu', variable=mnq, value=1).place(x=180, y=660, anchor="nw")
mnqx2 = tk.Radiobutton(window, text='雷电', variable=mnq, value=2).place(x=250, y=660, anchor="nw")

cpx = tk.StringVar()
cpxw = tk.Label(window, text="区域偏量x：", bg="green", width=15, height=2).place(x=10, y=700, anchor="nw")
cpxx = tk.Entry(window, textvariable=cpx).place(x=130, y=710, anchor="nw")

cpy = tk.StringVar()
cpyw = tk.Label(window, text="区域偏量y：", bg="green", width=15, height=2).place(x=10, y=750, anchor="nw")
cpyx = tk.Entry(window, textvariable=cpy).place(x=130, y=760, anchor="nw")

tishi5 = tk.Label(window, text="偏量参考：mumu为0和36，雷电为1和34，雷电4k屏为1和51，夜神为2和32", bg="pink", width=70, height=2).place(x=100,
                                                                                                                 y=800,
                                                                                                                 anchor="nw")

fname = tk.StringVar()
fnamew = tk.Label(window, text="脚本名称(例如：达芬奇狗粮本，术阶本)：", bg="green", width=35, height=2).place(x=10, y=850, anchor="nw")
fnamex = tk.Entry(window, textvariable=fname).place(x=280, y=860, anchor="nw")


def hitbt():
    a1 = cycle.get()
    a2 = overap.get()
    a3 = capple.get()
    a4 = sapple.get()
    a5 = gapple.get()
    a6 = kapple.get()
    a7 = passby.get()
    a8 = supser.get()
    a9 = ssk1.get()
    a10 = ssk2.get()
    a11 = ssk3.get()
    a12 = noblel.get()
    a13 = scraft.get()
    a14 = obreak.get()
    a15 = mnq.get()
    a16 = cpx.get()
    a17 = cpy.get()
    a18 = fname.get()

    jiaoben = '#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases./nSendMode Input ; Recommended for new scripts due to its superior speed and reliability./nSetMouseDelay, 0 ; Removed mouse delay (as fast as possible)./nSetBatchLines, -1 ; Make AHK run as fast as possible/n/n;各项的详细讲解请看《FGO-AHK参数说明》/n/n;刷本参数/n' \
              'cycle:= %s ;刷几次本/n' \
              'overap:= %s ;是否清完剩余AP/n/n' \
              ';允许吃苹果/n' \
              'capple:= %s ;铜/n' \
              'sapple:= %s ;银/n' \
              'gapple:= %s ;金/n' \
              'kstone:= %s ;彩/n/n' \
              ';助战/n' \
              'global passby:= %s ;好友/n' \
              'global supser:= %s ;1斯2孔3呆4嫁5狐6凛7娜8梅/n' \
              'global tskill:= [ %s,%s,%s ] ;技能/n' \
              'global noblel:= %s ;宝具/n' \
              'global scraft:= %s ;1茶2贝拉3秉4私人5宝石6杯/n' \
              'global obreak:= %s ;满破/n/n;附加功能/nglobal debug:= 0 ;调试/nglobal wucha:= 2 ;误差/n/n' \
              ';模拟器/n' \
              'global mnq:= %s ;置顶0无1mumu2雷电/n' \
              'global cpx:= %s ;窗口x偏量/n' \
              'global cpy:= %s ;窗口y偏量/n/n/n;——————战斗流程——————/norder()/n{/ngosub,wstart ;检测作战开始/n/n;战斗流程（为空则无限平砍）：/n{/n/n/n}/n;自定义结束。/n/nxjbd(0) ;补刀+结算。若最后需要补刀，可以省略，用这句就行。/n}/nreturn/n/n/n;——————脚本快捷键——————/n;可修改热键为F1~12，a~z，0~9等，请修改“$~”与“::”之间的部分/n;若想前置Ctrl需前置加“^”，Shift前置加“+”，Alt前置加“!”/n/n; Ctrl + \\ 退出脚本(任何时候都可以一键结束进程)/n$~^\\::ExitApp/n/n; \\ 键重置(相当于关闭脚本再打开)/n$~\\::Reload/n/n; Ctrl + 0 键 取消吃苹果/n$~^0::/n;后几句别动/ncapple:= 0/nsapple:= 0/ngapple:= 0/nkstone:= 0/nreturn/n/n; ] 键暂停(从当前操作暂停，再按一次从暂停处继续)/n$~]::Pause/n/n; [ 键启动(开始循环刷本)/n$~[::/n{/n/n/n;口口口口口口口口口口口口口口口口/n;以后的代码，不建议修改，除非你懂/n;口口口口口口口口口口口口口口口口/n/n/n;确认mumu窗口/nmup()/nsleep 300/ngosub,checkmnq/nsclick(900,260)/n/n;生成日志记录/nFormatTime,now,A_Now,yyyy-MM-dd HH:mm:ss/nFileAppend,`n%%now%%`n%%A_ScriptName%%`n,fgo-ahk.log/n;刷本次数记录/ncyclist:=0/n/n/n;连续出击主循环内容/nloop/n{/n	;检测当前刷本次数/n	if(cyclist=cycle)/n	{/n		;次数达标后禁用吃苹果/n		capple:= 0/n		sapple:= 0/n		gapple:= 0/n		kstone:= 0/n/n		;若不清剩余AP，直接退出/n		if(!overap)/n			break/n	}/n/n	;检测吃苹果界面，或助战选择界面/n	apok:=0/n	loop/n	{/n		sleep 100/n		if(pixc(1270,364,0xE5E5ED) and !apok)/n		{/n			gosub,eat/n			apok:=1/n		}/n		if((pixc(1000,164,0x08B5F7) && pixc(1055,275,0x656565)) or pixc(978,554,0xFFFFFF))/n			break/n	}/n/n	;挑选助战，进本等待开始/n	gosub,support/n	if(cyclist=0)/n		pixc(1488,852,0xC4C8CC,1,1)/n	sleep 3000/n/n	;记录刷本次数/n	cyclist:=cyclist+1/n	FormatTime,now,A_Now,HH:mm:ss/n	FileAppend,%%cyclist%%/%%cycle%% %%now%%`n,fgo-ahk.log/n/n	;按照设定好的刷本流程执行/n	order()/n/n	;进入结算环节，连点直到出去。/n	loop/n	{/n		sclick(1300,809)/n		pixc(870,704,0xD7D7D7,0,1)/n		pixc(303,767,0xD6D6D6,0,1)/n		if(pixc(1041,278,0xFFFFFF))/n		{/n			sleep 200/n			sclick(950,714)/n			break/n		}/n		sleep 100/n	}/n}/nMsgBox 打完了！/n}/nreturn/n/n;================================================================================================/n/n;循环探测指定像素点颜色，pl是否循环，lc=识别到后是否单击这个像素/npixc(x,y,color,pl:=0,lc:=0)/n{/n	mup()/n	;加入偏量/n	x:=x+cpx/n	y:=y+cpy/n	;调试模式：记录要求的像素点/n	if(debug)/n	{/n		dpix:=0x307521/n		dpn:=Format("{1:4d},{2:4d},0x{3:06X}",x,y,color)/n		FileAppend,%%dpn%%`n,fgo-ahk.log/n	}/n	loop/n	{/n		PixelSearch,xtmp,,x,y,x,y,color,wucha,Fast RGB/n		if(xtmp)/n		{/n			if(lc)/n				click,%%x%%,%%y%%/n			return 1/n		}/n		else if(debug)/n		{/n			PixelGetColor,pix,x,y,RGB/n			;记录不匹配的颜色/n			if(dpix!=pix)/n			{/n				dpix:=pix/n				dpn:=Format("----,----,0x{3:06X}",x,y,dpix)/n				FileAppend,%%dpn%%`n,fgo-ahk.log/n			}/n			sleep 450/n		}/n		if(!pl)/n			return 0/n		sleep 100/n	}/n}/n/n;带偏移量的click，输入FGO区域相对坐标，点击加偏量后的/nsclick(x,y)/n{/n	x:=x+cpx/n	y:=y+cpy/n	click,%%x%%,%%y%%/n	return/n}/n/n;================================================================================================/n/n;按铜银金彩，依次尝试吃苹果/neat:/n{/n	if(pixc(750,709,0xF4ECDB) and capple)/n	{/n		sclick(750,709)/n		pixc(945,726,0xDCDDDF,1,1)/n		FileAppend,吃了铜苹果`n,fgo-ahk.log/n		return/n	}/n	else if(pixc(750,524,0xF4ECDB) and sapple)/n	{/n		sclick(750,524)/n		pixc(945,726,0xDCDDDF,1,1)/n		FileAppend,吃了银苹果`n,fgo-ahk.log/n		return/n	}/n	else if(pixc(750,339,0xF4ECDB) and gapple)/n	{/n		sclick(750,339)/n		pixc(945,726,0xDCDDDF,1,1)/n		FileAppend,吃了金苹果`n,fgo-ahk.log/n		return/n	}/n	else if(pixc(750,154,0xF4ECDB) and kstone)/n	{/n		sclick(750,154)/n		pixc(945,726,0xDCDDDF,1,1)/n		FileAppend,吃了彩苹果`n,fgo-ahk.log/n		return/n	}/n	MsgBox 你没AP了！/n	Exit/n}/nreturn/n/n;================================================================================================/n/n;选择助战/nsupport:/n{/n	if(supcheck())/n		return/n	;如果没有，刷新再找/n	loop/n	{/n		sclick(1060,164)/n		sleep 500/n		sclick(1000,704)/n		loop/n		{/n			if(pixc(1000,164,0x08B5F7) && pixc(1055,275,0x656565))/n				break/n			sleep 100/n		}/n		if(supcheck())/n			return/n		sleep 10000/n	}/n	MsgBox 助战丢了！/n	Exit/n}/nreturn/n/n;助战列表自动翻页检测/nsupcheck()/n{/n	if(pixc(978,554,0xFFFFFF))/n		return 0/n	if(ncheck())/n		return 1/n	spy:=244/n	loop,6/n	{/n		spy:=spy+100/n		sclick(1550,spy)/n		sleep 200/n		if(ncheck())/n			return 1/n	}/n	return 0/n}/n/n;检测本页助战/nncheck()/n{/n	y:=164+cpy/n	loop/n	{/n		y:=y+100/n		;扫描从者栏位/n		PixelSearch, ,y,1030+cpx,y,1030+cpx,920,0xDED5BB,13,Fast RGB/n		if(!y)/n			return 0/n		;检测是否好友/n		if(passby)/n		{/n			PixelSearch, x,,1450+cpx,y-52,1450+cpx,y-52,0xE0FEAA,10,Fast RGB/n			if(!x) ;1020,501,0xE1C8A0 1450,450,0xDFFFAE/n				continue/n		}/n		;匹配英灵/n		if(supser)/n		{/n			if(supser=1)/n			{/n				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %%A_WorkingDir%%\\H\\s1.png/n				if(!x) ;CBA/n					continue/n			}/n			else if(supser=2)/n			{/n				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %%A_WorkingDir%%\\H\\s2.png/n				if(!x) ;孔明/n					continue/n			}/n			else if(supser=3)/n			{/n				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %%A_WorkingDir%%\\H\\s3.png/n				if(!x) ;术呆/n					continue/n			}/n			else if(supser=4)/n			{/n				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %%A_WorkingDir%%\\H\\s4.png/n				if(!x) ;花嫁/n					continue/n			}/n			else if(supser=5)/n			{/n				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %%A_WorkingDir%%\\H\\s5.png/n				if(!x) ;狐狸/n					continue/n			}/n			else if(supser=6)/n			{/n				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %%A_WorkingDir%%\\H\\s6.png/n				if(!x) ;仇凛/n					continue/n			}/n			else if(supser=7)/n			{/n				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %%A_WorkingDir%%\\H\\s7.png/n				if(!x) ;狂娜/n					continue/n			}/n			else if(supser=8)/n			{/n				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %%A_WorkingDir%%\\H\\s8.png/n				if(!x) ;梅林/n					continue/n			}/n			;检测技能等级/n			if(tskill[1] or tskill[2] or tskill[3]) ;1020,489,0xEECC99/n			{/n				if(tskill[1])/n				{/n					PixelSearch, x,,1079+cpx,y-30,1079+cpx,y-30,0XFFFFFF,10,Fast RGB/n					if(!x)	;一技能 1079,469,0xFFFFFF/n						continue/n				}/n				if(tskill[2])/n				{/n					PixelSearch, x,,1176+cpx,y-30,1176+cpx,y-30,0XFFFFFF,10,Fast RGB/n					if(!x)	;二技能 1176,469,0xFFFFFF/n						continue/n				}/n				if(tskill[3])/n				{/n					PixelSearch, x,,1273+cpx,y-30,1273+cpx,y-30,0XFFFFFF,10,Fast RGB/n					if(!x)	;三技能 1273,469,0XFFFFFF/n						continue/n				}/n			}/n			;检测宝具等级/n			if(noblel && passby)/n			{/n				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %%A_WorkingDir%%\\H\\n1.png/n				if(x && noblel>1)/n					continue/n				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %%A_WorkingDir%%\\H\\n2.png/n				if(x && noblel>2)/n					continue/n				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %%A_WorkingDir%%\\H\\n3.png/n				if(x && noblel>3)/n					continue/n				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %%A_WorkingDir%%\\H\\n4.png/n				if(x && noblel>4)/n					continue/n				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %%A_WorkingDir%%\\H\\n5.png/n				if(x && noblel>5)/n					continue/n			}/n		}/n		;礼装种类与满破情况/n		if(scraft)/n		{/n			;礼装种类/n			if(scraft=1)/n			{/n				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %%A_WorkingDir%%\\H\\c1.png/n				if(!x) ;下午茶/n					continue/n			}/n			else if(scraft=2)/n			{/n				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %%A_WorkingDir%%\\H\\c2.png/n				if(!x) ;贝拉丽莎/n					continue/n			}/n			else if(scraft=3)/n			{/n				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %%A_WorkingDir%%\\H\\c3.png/n				if(!x) ;秉持风雅/n					continue/n			}/n			else if(scraft=4)/n			{/n				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %%A_WorkingDir%%\\H\\c4.png/n				if(!x) ;私人指导/n					continue/n			}/n			else if(scraft=5)/n			{/n				ImageSearch, x,, 190+cpx,y-40,230+cpx,y-10, *100 %%A_WorkingDir%%\\H\\c5.png/n				if(!x) ;万华镜/n					continue/n			}/n			else if(scraft=6)/n			{/n				ImageSearch, x,, 190+cpx,y-40,230+cpx,y-10, *100 %%A_WorkingDir%%\\H\\c6.png/n				if(!x) ;黑杯/n					continue/n			}/n			;是否满破/n			if(obreak && scraft>4)/n			{/n				PixelSearch, x,,240+cpx,y-20,240+cpx,y-20,0xFFFF75,22,Fast RGB/n				if(!x)	;满破星星 1020,629,0xEECC98 240,609,0xFCFC8A/n					continue/n			}/n		}/n		y:=y-30-cpy/n		sclick(1000,y)/n		return 1/n	}/n}/n/n;================================================================================================/n/n;检测可以开始行动/nwstart:/n{/n	sleep 500/n	loop/n	{/n		if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))/n			break/n		sleep 100/n	}/n	sleep 100/n}/nreturn/n/n;从者放技能/nssk(si,st:=0)/n{/n	if(si>9 || si<0)/n		MsgBox 从者技能参数异常,请检查ssk(%%si%%...)/n	skc:=[ 80,200,320, 480,600,720, 880,1000,1120 ]/n	skt:=[ 400,800,1200 ]/n	;技能位置/n	temp:=skc[si]/n	sclick(temp,714)/n	sleep 250/n	;指向位置/n	if(st)/n	{/n		temp:=skt[st]/n		sclick(temp,564)/n	}/n	sleep 500/n	loop/n	{/n		if(pixc(1450,254,0x1A2333) && pixc(1514,256,0xFAFFFF))/n			break/n		sleep 100/n	}/n	sleep 100/n}/nreturn/n/n;御主放技能/nmsk(sk,st:=0,sm:=0,sn:=0)/n{/n	if(sk>4 || sk<0)/n		MsgBox 御主技能参数异常,请检查msk(%%sk%%...)/n	skc:=[ 1130,1240,1350 ]/n	skt:=[ 400,800,1200 ]/n	change:=[ 170,420,670, 920,1170,1420 ]/n	;御主面板/n	sclick(1500,394)/n	sleep 400/n	;技能位置/n	temp:=skc[sk]/n	sclick(temp,394)/n	sleep 300/n	;指向位置/n	if(st and st<4)/n	{/n		temp:=skt[st]/n		sclick(temp,600)/n	}/n	else if(st=4)/n	{/n		sleep 200/n		temp:=change[sm]/n		sclick(temp,464)/n		sleep 300/n		temp:=change[sn]/n		sclick(temp,464)/n		sleep 300/n		sclick(800,784)/n	}/n	sleep 500/n	if(st=4)/n	{/n		loop/n		{/n			if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))/n				break/n			sleep 100/n		}/n	}/n	else/n	{/n		loop/n		{/n			if(pixc(1450,254,0x1A2333) && pixc(1514,256,0xFAFFFF))/n				break/n			sleep 100/n		}/n	}/n	sleep 100/n}/nreturn/n/n;切换目标/ntarget(n)/n{/n	enemy:=[ 60,360,660 ]/n	temp:=enemy[n]/n	sclick(temp,54)/n	sleep 300/n}/nreturn/n/n;================================================================================================/n/n;平砍n回合，直到换下一面，或战斗结束。可用于监测战斗结束状态。/nxjbd(n:=0)/n{/n	nn:=0/n	loop/n	{/n		;检测战利品结算界面/n		if(pixc(155,114,0xE5B419) && pixc(1430,114,0x05ACF4))/n			return/n		;检测黑屏换面/n		if(pixc(500,834,0x000000) and n>0)/n			break/n		;检测战斗界面是否又出现/n		if(pixc(1450,254,0x1A2333) && pixc(1514,256,0xFAFFFF))/n		{/n			nn:=nn+1/n			attack()/n			if(nn=n)/n				break/n		}/n		sclick(1212,85)/n		sleep 100/n	}/n	;检测回到界面/n	loop/n	{/n		if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))/n			break/n		sclick(1212,85)/n		sleep 100/n	}/n	sleep 600/n}/nreturn/n/n;出3卡平砍(尽量首红)/nattack()/n{/n	;指令卡间隔 320,319,322,325/n	ccoord:=[ 213,533,852,1174,1499 ]/n	sclick(1400,764)/n	sleep 500/n/n	;选1张红卡，如果没有就选最后一张/n	ci:=1/n	loop,5/n	{/n		xard:=ccoord[ci] ;213,755,0xFA3F00/n		PixelSearch,x,,xard+cpx,719+cpy,xard+cpx,719+cpy,0xFA3F00,10,Fast RGB/n		if(x)/n		{/n			sclick(xard,604)/n			break/n		}/n		ci:=ci+1/n	}/n	if(ci=6)/n	{/n		ci:=5/n		sclick(1450,604)/n	}/n	sleep 150/n/n	;补选其他两张卡/n	cj:=1/n	loop,5/n	{/n		if(cj!=ci)/n		{/n			temp:=ccoord[cj]/n			sclick(temp,604)/n			break/n		}/n		cj:=cj+1/n	}/n	sleep 150/n/n	ck:=cj+1/n	loop,5/n	{/n		if(ck!=ci)/n		{/n			temp:=ccoord[ck]/n			sclick(temp,604)/n			break/n		}/n		ck:=ck+1/n	}/n	sleep 150/n/n	sleep 2000/n}/nreturn/n/n;================================================================================================/n/n;宝具回合出卡/nbaoju(n1,n2:=0,n3:=0)/n{/n	;打开选卡界面/n	sclick(1400,764)/n	sleep 1600/n/n	;第一张选卡/n	if(n1)/n		npc(n1)/n	else/n		sclick(480,604)/n	sleep 150/n/n	;第二张选卡/n	if(n2)/n		npc(n2)/n	else/n		sclick(800,604)/n	sleep 150/n/n	;第三张选卡/n	if(n3)/n		npc(n3)/n	else/n		sclick(1120,604)/n	sleep 150/n/n	sleep 5000/n	;等待可进行下一步操作/n	loop/n	{/n		;检测战利品结算界面/n		if(pixc(155,114,0xE5B419) && pixc(1430,114,0x05ACF4))/n			break/n		;检测战斗界面是否又出现/n		if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))/n			break/n		sclick(1212,85)/n		sleep 100/n	}/n	sleep 300/n}/nreturn/n/n;选一个宝具卡/nnpc(n)/n{/n	npcard:=[ 480,800,1120 ]/n	temp:=npcard[n]/n	sclick(temp,264)/n}/nreturn/n/n;================================================================================================/n/n;检测模拟器窗口/ncheckmnq:/n{/n	if(mnq=1)/n	{/n		if(!WinActive("ahk_exe NemuPlayer.exe"))/n		{/n			msgbox 未发现mumu窗口/n			exit/n		}/n	}/n	else if(mnq=2)/n	{/n		if(!WinActive("ahk_exe dnplayer.exe"))/n		{/n			msgbox 未发现雷电窗口/n			exit/n		}/n	}/n}/nreturn/n/n;置顶mumu窗口/nmup()/n{/n	if(mnq=1)/n	{/n		if(!WinActive("ahk_exe NemuPlayer.exe"))/n		WinActivate, ahk_class Qt5QWindowIcon/n	}/n	else if(mnq=2)/n	{/n		if(!WinActive("ahk_exe dnplayer.exe"))/n		WinActivate, ahk_class LDPlayerMainFrame/n	}/n}/n' \
              'return' % (a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17)
    jiaoben = jiaoben.replace("/n", "\n")
    with open(a18 + ".ahk", "wt") as f:
        f.write(jiaoben)
    print("ok")
    # print(jiaoben)
    tkinter.messagebox.showinfo(title='提示', message='脚本编辑完成，请自行启动脚本并编辑战斗流程！')
    window.quit()
    return 0


b = tk.Button(window, text='点击生成脚本文件', width=20, height=2, command=hitbt).place(x=240, y=920, anchor="nw")
window.mainloop()
