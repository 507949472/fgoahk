#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetMouseDelay, 0 ; Removed mouse delay (as fast as possible).
SetBatchLines, -1 ; Make AHK run as fast as possible

;各项的详细讲解请看《FGO-AHK参数说明》

;刷本参数
cycle:= 30 ;刷几次本
overap:= 0 ;是否清完剩余AP

;允许吃苹果
capple:= 0 ;铜
sapple:= 0 ;银
gapple:= 0 ;金
kstone:= 0 ;彩

;助战
global passby:= 0 ;好友
global supser:= 3 ;1斯2孔3呆4嫁5狐6凛7娜8梅
global tskill:= [ 0,1,0 ] ;技能
global noblel:= 0 ;宝具
global scraft:= 2 ;1茶2贝拉3秉4私人5宝石6杯
global obreak:= 0 ;满破

;附加功能
global debug:= 0 ;调试
global wucha:= 2 ;误差

;模拟器
global mnq:= 2 ;置顶0无1mumu2雷电
global cpx:= 1 ;窗口x偏量
global cpy:= 34 ;窗口y偏量


;——————战斗流程——————
order()
{
gosub,wstart ;检测作战开始

;战斗流程（为空则无限平砍）：
{


}
;自定义结束。

xjbd(0) ;补刀+结算。若最后需要补刀，可以省略，用这句就行。
}
return


;——————脚本快捷键——————
;可修改热键为F1~12，a~z，0~9等，请修改“$~”与“::”之间的部分
;若想前置Ctrl需前置加“^”，Shift前置加“+”，Alt前置加“!”

; Ctrl + \ 退出脚本(任何时候都可以一键结束进程)
$~^\::ExitApp

; \ 键重置(相当于关闭脚本再打开)
$~\::Reload

; Ctrl + 0 键 取消吃苹果
$~^0::
;后几句别动
capple:= 0
sapple:= 0
gapple:= 0
kstone:= 0
return

; ] 键暂停(从当前操作暂停，再按一次从暂停处继续)
$~]::Pause

; [ 键启动(开始循环刷本)
$~[::
{


;口口口口口口口口口口口口口口口口
;以后的代码，不建议修改，除非你懂
;口口口口口口口口口口口口口口口口


;确认mumu窗口
mup()
sleep 300
gosub,checkmnq
sclick(900,260)

;生成日志记录
FormatTime,now,A_Now,yyyy-MM-dd HH:mm:ss
FileAppend,`n%now%`n%A_ScriptName%`n,fgo-ahk.log
;刷本次数记录
cyclist:=0


;连续出击主循环内容
loop
{
	;检测当前刷本次数
	if(cyclist=cycle)
	{
		;次数达标后禁用吃苹果
		capple:= 0
		sapple:= 0
		gapple:= 0
		kstone:= 0

		;若不清剩余AP，直接退出
		if(!overap)
			break
	}

	;检测吃苹果界面，或助战选择界面
	apok:=0
	loop
	{
		sleep 100
		if(pixc(1270,364,0xE5E5ED) and !apok)
		{
			gosub,eat
			apok:=1
		}
		if((pixc(1000,164,0x08B5F7) && pixc(1055,275,0x656565)) or pixc(978,554,0xFFFFFF))
			break
	}

	;挑选助战，进本等待开始
	gosub,support
	if(cyclist=0)
		pixc(1488,852,0xC4C8CC,1,1)
	sleep 3000

	;记录刷本次数
	cyclist:=cyclist+1
	FormatTime,now,A_Now,HH:mm:ss
	FileAppend,%cyclist%/%cycle% %now%`n,fgo-ahk.log

	;按照设定好的刷本流程执行
	order()

	;进入结算环节，连点直到出去。
	loop
	{
		sclick(1300,809)
		pixc(870,704,0xD7D7D7,0,1)
		pixc(303,767,0xD6D6D6,0,1)
		if(pixc(1041,278,0xFFFFFF))
		{
			sleep 200
			sclick(950,714)
			break
		}
		sleep 100
	}
}
MsgBox 打完了！
}
return

;================================================================================================

;循环探测指定像素点颜色，pl是否循环，lc=识别到后是否单击这个像素
pixc(x,y,color,pl:=0,lc:=0)
{
	mup()
	;加入偏量
	x:=x+cpx
	y:=y+cpy
	;调试模式：记录要求的像素点
	if(debug)
	{
		dpix:=0x307521
		dpn:=Format("{1:4d},{2:4d},0x{3:06X}",x,y,color)
		FileAppend,%dpn%`n,fgo-ahk.log
	}
	loop
	{
		PixelSearch,xtmp,,x,y,x,y,color,wucha,Fast RGB
		if(xtmp)
		{
			if(lc)
				click,%x%,%y%
			return 1
		}
		else if(debug)
		{
			PixelGetColor,pix,x,y,RGB
			;记录不匹配的颜色
			if(dpix!=pix)
			{
				dpix:=pix
				dpn:=Format("----,----,0x{3:06X}",x,y,dpix)
				FileAppend,%dpn%`n,fgo-ahk.log
			}
			sleep 450
		}
		if(!pl)
			return 0
		sleep 100
	}
}

;带偏移量的click，输入FGO区域相对坐标，点击加偏量后的
sclick(x,y)
{
	x:=x+cpx
	y:=y+cpy
	click,%x%,%y%
	return
}

;================================================================================================

;按铜银金彩，依次尝试吃苹果
eat:
{
	if(pixc(750,709,0xF4ECDB) and capple)
	{
		sclick(750,709)
		pixc(945,726,0xDCDDDF,1,1)
		FileAppend,吃了铜苹果`n,fgo-ahk.log
		return
	}
	else if(pixc(750,524,0xF4ECDB) and sapple)
	{
		sclick(750,524)
		pixc(945,726,0xDCDDDF,1,1)
		FileAppend,吃了银苹果`n,fgo-ahk.log
		return
	}
	else if(pixc(750,339,0xF4ECDB) and gapple)
	{
		sclick(750,339)
		pixc(945,726,0xDCDDDF,1,1)
		FileAppend,吃了金苹果`n,fgo-ahk.log
		return
	}
	else if(pixc(750,154,0xF4ECDB) and kstone)
	{
		sclick(750,154)
		pixc(945,726,0xDCDDDF,1,1)
		FileAppend,吃了彩苹果`n,fgo-ahk.log
		return
	}
	MsgBox 你没AP了！
	Exit
}
return

;================================================================================================

;选择助战
support:
{
	if(supcheck())
		return
	;如果没有，刷新再找
	loop
	{
		sclick(1060,164)
		sleep 500
		sclick(1000,704)
		loop
		{
			if(pixc(1000,164,0x08B5F7) && pixc(1055,275,0x656565))
				break
			sleep 100
		}
		if(supcheck())
			return
		sleep 10000
	}
	MsgBox 助战丢了！
	Exit
}
return

;助战列表自动翻页检测
supcheck()
{
	if(pixc(978,554,0xFFFFFF))
		return 0
	if(ncheck())
		return 1
	spy:=244
	loop,6
	{
		spy:=spy+100
		sclick(1550,spy)
		sleep 200
		if(ncheck())
			return 1
	}
	return 0
}

;检测本页助战
ncheck()
{
	y:=164+cpy
	loop
	{
		y:=y+100
		;扫描从者栏位
		PixelSearch, ,y,1030+cpx,y,1030+cpx,920,0xDED5BB,13,Fast RGB
		if(!y)
			return 0
		;检测是否好友
		if(passby)
		{
			PixelSearch, x,,1450+cpx,y-52,1450+cpx,y-52,0xE0FEAA,10,Fast RGB
			if(!x) ;1020,501,0xE1C8A0 1450,450,0xDFFFAE
				continue
		}
		;匹配英灵
		if(supser)
		{
			if(supser=1)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s1.png
				if(!x) ;CBA
					continue
			}
			else if(supser=2)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s2.png
				if(!x) ;孔明
					continue
			}
			else if(supser=3)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s3.png
				if(!x) ;术呆
					continue
			}
			else if(supser=4)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s4.png
				if(!x) ;花嫁
					continue
			}
			else if(supser=5)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s5.png
				if(!x) ;狐狸
					continue
			}
			else if(supser=6)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s6.png
				if(!x) ;仇凛
					continue
			}
			else if(supser=7)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s7.png
				if(!x) ;狂娜
					continue
			}
			else if(supser=8)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s8.png
				if(!x) ;梅林
					continue
			}
			;检测技能等级
			if(tskill[1] or tskill[2] or tskill[3]) ;1020,489,0xEECC99
			{
				if(tskill[1])
				{
					PixelSearch, x,,1079+cpx,y-30,1079+cpx,y-30,0XFFFFFF,10,Fast RGB
					if(!x)	;一技能 1079,469,0xFFFFFF
						continue
				}
				if(tskill[2])
				{
					PixelSearch, x,,1176+cpx,y-30,1176+cpx,y-30,0XFFFFFF,10,Fast RGB
					if(!x)	;二技能 1176,469,0xFFFFFF
						continue
				}
				if(tskill[3])
				{
					PixelSearch, x,,1273+cpx,y-30,1273+cpx,y-30,0XFFFFFF,10,Fast RGB
					if(!x)	;三技能 1273,469,0XFFFFFF
						continue
				}
			}
			;检测宝具等级
			if(noblel && passby)
			{
				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %A_WorkingDir%\H\n1.png
				if(x && noblel>1)
					continue
				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %A_WorkingDir%\H\n2.png
				if(x && noblel>2)
					continue
				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %A_WorkingDir%\H\n3.png
				if(x && noblel>3)
					continue
				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %A_WorkingDir%\H\n4.png
				if(x && noblel>4)
					continue
				ImageSearch, x,, 450+cpx,y-70,900+cpx,y-20, *100 %A_WorkingDir%\H\n5.png
				if(x && noblel>5)
					continue
			}
		}
		;礼装种类与满破情况
		if(scraft)
		{
			;礼装种类
			if(scraft=1)
			{
				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %A_WorkingDir%\H\c1.png
				if(!x) ;下午茶
					continue
			}
			else if(scraft=2)
			{
				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %A_WorkingDir%\H\c2.png
				if(!x) ;贝拉丽莎
					continue
			}
			else if(scraft=3)
			{
				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %A_WorkingDir%\H\c3.png
				if(!x) ;秉持风雅
					continue
			}
			else if(scraft=4)
			{
				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %A_WorkingDir%\H\c4.png
				if(!x) ;私人指导
					continue
			}
			else if(scraft=5)
			{
				ImageSearch, x,, 190+cpx,y-40,230+cpx,y-10, *100 %A_WorkingDir%\H\c5.png
				if(!x) ;万华镜
					continue
			}
			else if(scraft=6)
			{
				ImageSearch, x,, 190+cpx,y-40,230+cpx,y-10, *100 %A_WorkingDir%\H\c6.png
				if(!x) ;黑杯
					continue
			}
			;是否满破
			if(obreak && scraft>4)
			{
				PixelSearch, x,,240+cpx,y-20,240+cpx,y-20,0xFFFF75,22,Fast RGB
				if(!x)	;满破星星 1020,629,0xEECC98 240,609,0xFCFC8A
					continue
			}
		}
		y:=y-30-cpy
		sclick(1000,y)
		return 1
	}
}

;================================================================================================

;检测可以开始行动
wstart:
{
	sleep 500
	loop
	{
		if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))
			break
		sleep 100
	}
	sleep 100
}
return

;从者放技能
ssk(si,st:=0)
{
	if(si>9 || si<0)
		MsgBox 从者技能参数异常,请检查ssk(%si%...)
	skc:=[ 80,200,320, 480,600,720, 880,1000,1120 ]
	skt:=[ 400,800,1200 ]
	;技能位置
	temp:=skc[si]
	sclick(temp,714)
	sleep 250
	;指向位置
	if(st)
	{
		temp:=skt[st]
		sclick(temp,564)
	}
	sleep 500
	loop
	{
		if(pixc(1450,254,0x1A2333) && pixc(1514,256,0xFAFFFF))
			break
		sleep 100
	}
	sleep 100
}
return

;御主放技能
msk(sk,st:=0,sm:=0,sn:=0)
{
	if(sk>4 || sk<0)
		MsgBox 御主技能参数异常,请检查msk(%sk%...)
	skc:=[ 1130,1240,1350 ]
	skt:=[ 400,800,1200 ]
	change:=[ 170,420,670, 920,1170,1420 ]
	;御主面板
	sclick(1500,394)
	sleep 400
	;技能位置
	temp:=skc[sk]
	sclick(temp,394)
	sleep 300
	;指向位置
	if(st and st<4)
	{
		temp:=skt[st]
		sclick(temp,600)
	}
	else if(st=4)
	{
		sleep 200
		temp:=change[sm]
		sclick(temp,464)
		sleep 300
		temp:=change[sn]
		sclick(temp,464)
		sleep 300
		sclick(800,784)
	}
	sleep 500
	if(st=4)
	{
		loop
		{
			if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))
				break
			sleep 100
		}
	}
	else
	{
		loop
		{
			if(pixc(1450,254,0x1A2333) && pixc(1514,256,0xFAFFFF))
				break
			sleep 100
		}
	}
	sleep 100
}
return

;切换目标
target(n)
{
	enemy:=[ 60,360,660 ]
	temp:=enemy[n]
	sclick(temp,54)
	sleep 300
}
return

;================================================================================================

;平砍n回合，直到换下一面，或战斗结束。可用于监测战斗结束状态。
xjbd(n:=0)
{
	nn:=0
	loop
	{
		;检测战利品结算界面
		if(pixc(155,114,0xE5B419) && pixc(1430,114,0x05ACF4))
			return
		;检测黑屏换面
		if(pixc(500,834,0x000000) and n>0)
			break
		;检测战斗界面是否又出现
		if(pixc(1450,254,0x1A2333) && pixc(1514,256,0xFAFFFF))
		{
			nn:=nn+1
			attack()
			if(nn=n)
				break
		}
		sclick(1212,85)
		sleep 100
	}
	;检测回到界面
	loop
	{
		if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))
			break
		sclick(1212,85)
		sleep 100
	}
	sleep 600
}
return

;出3卡平砍(尽量首红)
attack()
{
	;指令卡间隔 320,319,322,325
	ccoord:=[ 213,533,852,1174,1499 ]
	sclick(1400,764)
	sleep 500

	;选1张红卡，如果没有就选最后一张
	ci:=1
	loop,5
	{
		xard:=ccoord[ci] ;213,755,0xFA3F00
		PixelSearch,x,,xard+cpx,719+cpy,xard+cpx,719+cpy,0xFA3F00,10,Fast RGB
		if(x)
		{
			sclick(xard,604)
			break
		}
		ci:=ci+1
	}
	if(ci=6)
	{
		ci:=5
		sclick(1450,604)
	}
	sleep 150

	;补选其他两张卡
	cj:=1
	loop,5
	{
		if(cj!=ci)
		{
			temp:=ccoord[cj]
			sclick(temp,604)
			break
		}
		cj:=cj+1
	}
	sleep 150

	ck:=cj+1
	loop,5
	{
		if(ck!=ci)
		{
			temp:=ccoord[ck]
			sclick(temp,604)
			break
		}
		ck:=ck+1
	}
	sleep 150

	sleep 2000
}
return

;================================================================================================

;宝具回合出卡
baoju(n1,n2:=0,n3:=0)
{
	;打开选卡界面
	sclick(1400,764)
	sleep 1600

	;第一张选卡
	if(n1)
		npc(n1)
	else
		sclick(480,604)
	sleep 150

	;第二张选卡
	if(n2)
		npc(n2)
	else
		sclick(800,604)
	sleep 150

	;第三张选卡
	if(n3)
		npc(n3)
	else
		sclick(1120,604)
	sleep 150

	sleep 5000
	;等待可进行下一步操作
	loop
	{
		;检测战利品结算界面
		if(pixc(155,114,0xE5B419) && pixc(1430,114,0x05ACF4))
			break
		;检测战斗界面是否又出现
		if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))
			break
		sclick(1212,85)
		sleep 100
	}
	sleep 300
}
return

;选一个宝具卡
npc(n)
{
	npcard:=[ 480,800,1120 ]
	temp:=npcard[n]
	sclick(temp,264)
}
return

;================================================================================================

;检测模拟器窗口
checkmnq:
{
	if(mnq=1)
	{
		if(!WinActive("ahk_exe NemuPlayer.exe"))
		{
			msgbox 未发现mumu窗口
			exit
		}
	}
	else if(mnq=2)
	{
		if(!WinActive("ahk_exe dnplayer.exe"))
		{
			msgbox 未发现雷电窗口
			exit
		}
	}
}
return

;置顶mumu窗口
mup()
{
	if(mnq=1)
	{
		if(!WinActive("ahk_exe NemuPlayer.exe"))
		WinActivate, ahk_class Qt5QWindowIcon
	}
	else if(mnq=2)
	{
		if(!WinActive("ahk_exe dnplayer.exe"))
		WinActivate, ahk_class LDPlayerMainFrame
	}
}
return