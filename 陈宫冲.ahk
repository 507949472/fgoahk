#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetMouseDelay, 0 ; Removed mouse delay (as fast as possible).
SetBatchLines, -1 ; Make AHK run as fast as possible

;�������ϸ�����뿴��FGO-AHK����˵����

;ˢ������
cycle:= 100 ;ˢ���α�
overap:= 0 ;�Ƿ�����ʣ��AP

;�����ƻ��
capple:= 0 ;ͭ
sapple:= 0 ;��
gapple:= 0 ;��
kstone:= 0 ;��

;��ս
global passby:= 0 ;����
global supser:= 3 ;1˹2��3��4��5��6��7��8÷
global tskill:= [ 1,1,1 ] ;����
global noblel:= 0 ;����
global scraft:= 0 ;1��2����3��4˽��5��ʯ6��
global obreak:= 0 ;����

;���ӹ���
global debug:= 0 ;����
global wucha:= 2 ;���

;ģ����
global mnq:= 2 ;�ö�0��1mumu2�׵�
global cpx:= 1 ;����xƫ��
global cpy:= 34 ;����yƫ��


;������������ս�����̡�����������
order()
{
gosub,wstart ;�����ս��ʼ

;ս�����̣�Ϊ��������ƽ������
{


}
;�Զ��������

xjbd(0) ;����+���㡣�������Ҫ����������ʡ�ԣ��������С�
}
return


;�������������ű���ݼ�������������
;���޸��ȼ�ΪF1~12��a~z��0~9�ȣ����޸ġ�$~���롰::��֮��Ĳ���
;����ǰ��Ctrl��ǰ�üӡ�^����Shiftǰ�üӡ�+����Altǰ�üӡ�!��

; Ctrl + \ �˳��ű�(�κ�ʱ�򶼿���һ����������)
$~^\::ExitApp

; \ ������(�൱�ڹرսű��ٴ�)
$~\::Reload

; Ctrl + 0 �� ȡ����ƻ��
$~^0::
;�󼸾��
capple:= 0
sapple:= 0
gapple:= 0
kstone:= 0
return

; ] ����ͣ(�ӵ�ǰ������ͣ���ٰ�һ�δ���ͣ������)
$~]::Pause

; [ ������(��ʼѭ��ˢ��)
$~[::
{


;�ڿڿڿڿڿڿڿڿڿڿڿڿڿڿڿ�
;�Ժ�Ĵ��룬�������޸ģ������㶮
;�ڿڿڿڿڿڿڿڿڿڿڿڿڿڿڿ�


;ȷ��mumu����
mup()
sleep 300
gosub,checkmnq
sclick(900,260)

;������־��¼
FormatTime,now,A_Now,yyyy-MM-dd HH:mm:ss
FileAppend,`n%now%`n%A_ScriptName%`n,fgo-ahk.log
;ˢ��������¼
cyclist:=0


;����������ѭ������
loop
{
	;��⵱ǰˢ������
	if(cyclist=cycle)
	{
		;����������ó�ƻ��
		capple:= 0
		sapple:= 0
		gapple:= 0
		kstone:= 0

		;������ʣ��AP��ֱ���˳�
		if(!overap)
			break
	}

	;����ƻ�����棬����սѡ�����
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

	;��ѡ��ս�������ȴ���ʼ
	gosub,support
	if(cyclist=0)
		pixc(1488,852,0xC4C8CC,1,1)
	sleep 3000

	;��¼ˢ������
	cyclist:=cyclist+1
	FormatTime,now,A_Now,HH:mm:ss
	FileAppend,%cyclist%/%cycle% %now%`n,fgo-ahk.log

	;�����趨�õ�ˢ������ִ��
	order()

	;������㻷�ڣ�����ֱ����ȥ��
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
MsgBox �����ˣ�
}
return

;================================================================================================

;ѭ��̽��ָ�����ص���ɫ��pl�Ƿ�ѭ����lc=ʶ�𵽺��Ƿ񵥻��������
pixc(x,y,color,pl:=0,lc:=0)
{
	mup()
	;����ƫ��
	x:=x+cpx
	y:=y+cpy
	;����ģʽ����¼Ҫ������ص�
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
			;��¼��ƥ�����ɫ
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

;��ƫ������click������FGO����������꣬�����ƫ�����
sclick(x,y)
{
	x:=x+cpx
	y:=y+cpy
	click,%x%,%y%
	return
}

;================================================================================================

;��ͭ����ʣ����γ��Գ�ƻ��
eat:
{
	if(pixc(750,709,0xF4ECDB) and capple)
	{
		sclick(750,709)
		pixc(945,726,0xDCDDDF,1,1)
		FileAppend,����ͭƻ��`n,fgo-ahk.log
		return
	}
	else if(pixc(750,524,0xF4ECDB) and sapple)
	{
		sclick(750,524)
		pixc(945,726,0xDCDDDF,1,1)
		FileAppend,������ƻ��`n,fgo-ahk.log
		return
	}
	else if(pixc(750,339,0xF4ECDB) and gapple)
	{
		sclick(750,339)
		pixc(945,726,0xDCDDDF,1,1)
		FileAppend,���˽�ƻ��`n,fgo-ahk.log
		return
	}
	else if(pixc(750,154,0xF4ECDB) and kstone)
	{
		sclick(750,154)
		pixc(945,726,0xDCDDDF,1,1)
		FileAppend,���˲�ƻ��`n,fgo-ahk.log
		return
	}
	MsgBox ��ûAP�ˣ�
	Exit
}
return

;================================================================================================

;ѡ����ս
support:
{
	if(supcheck())
		return
	;���û�У�ˢ������
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
	MsgBox ��ս���ˣ�
	Exit
}
return

;��ս�б��Զ���ҳ���
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

;��Ȿҳ��ս
ncheck()
{
	y:=164+cpy
	loop
	{
		y:=y+100
		;ɨ�������λ
		PixelSearch, ,y,1030+cpx,y,1030+cpx,920,0xDED5BB,13,Fast RGB
		if(!y)
			return 0
		;����Ƿ����
		if(passby)
		{
			PixelSearch, x,,1450+cpx,y-52,1450+cpx,y-52,0xE0FEAA,10,Fast RGB
			if(!x) ;1020,501,0xE1C8A0 1450,450,0xDFFFAE
				continue
		}
		;ƥ��Ӣ��
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
				if(!x) ;����
					continue
			}
			else if(supser=3)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s3.png
				if(!x) ;����
					continue
			}
			else if(supser=4)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s4.png
				if(!x) ;����
					continue
			}
			else if(supser=5)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s5.png
				if(!x) ;����
					continue
			}
			else if(supser=6)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s6.png
				if(!x) ;����
					continue
			}
			else if(supser=7)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s7.png
				if(!x) ;����
					continue
			}
			else if(supser=8)
			{
				ImageSearch, x,, 450+cpx,y-115,900+cpx,y-65, *100 %A_WorkingDir%\H\s8.png
				if(!x) ;÷��
					continue
			}
			;��⼼�ܵȼ�
			if(tskill[1] or tskill[2] or tskill[3]) ;1020,489,0xEECC99
			{
				if(tskill[1])
				{
					PixelSearch, x,,1079+cpx,y-30,1079+cpx,y-30,0XFFFFFF,10,Fast RGB
					if(!x)	;һ���� 1079,469,0xFFFFFF
						continue
				}
				if(tskill[2])
				{
					PixelSearch, x,,1176+cpx,y-30,1176+cpx,y-30,0XFFFFFF,10,Fast RGB
					if(!x)	;������ 1176,469,0xFFFFFF
						continue
				}
				if(tskill[3])
				{
					PixelSearch, x,,1273+cpx,y-30,1273+cpx,y-30,0XFFFFFF,10,Fast RGB
					if(!x)	;������ 1273,469,0XFFFFFF
						continue
				}
			}
			;��ⱦ�ߵȼ�
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
		;��װ�������������
		if(scraft)
		{
			;��װ����
			if(scraft=1)
			{
				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %A_WorkingDir%\H\c1.png
				if(!x) ;�����
					continue
			}
			else if(scraft=2)
			{
				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %A_WorkingDir%\H\c2.png
				if(!x) ;������ɯ
					continue
			}
			else if(scraft=3)
			{
				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %A_WorkingDir%\H\c3.png
				if(!x) ;���ַ���
					continue
			}
			else if(scraft=4)
			{
				ImageSearch, x,, 220+cpx,y-40,260+cpx,y-10, *100 %A_WorkingDir%\H\c4.png
				if(!x) ;˽��ָ��
					continue
			}
			else if(scraft=5)
			{
				ImageSearch, x,, 190+cpx,y-40,230+cpx,y-10, *100 %A_WorkingDir%\H\c5.png
				if(!x) ;�򻪾�
					continue
			}
			else if(scraft=6)
			{
				ImageSearch, x,, 190+cpx,y-40,230+cpx,y-10, *100 %A_WorkingDir%\H\c6.png
				if(!x) ;�ڱ�
					continue
			}
			;�Ƿ�����
			if(obreak && scraft>4)
			{
				PixelSearch, x,,240+cpx,y-20,240+cpx,y-20,0xFFFF75,22,Fast RGB
				if(!x)	;�������� 1020,629,0xEECC98 240,609,0xFCFC8A
					continue
			}
		}
		y:=y-30-cpy
		sclick(1000,y)
		return 1
	}
}

;================================================================================================

;�����Կ�ʼ�ж�
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

;���߷ż���
ssk(si,st:=0)
{
	if(si>9 || si<0)
		MsgBox ���߼��ܲ����쳣,����ssk(%si%...)
	skc:=[ 80,200,320, 480,600,720, 880,1000,1120 ]
	skt:=[ 400,800,1200 ]
	;����λ��
	temp:=skc[si]
	sclick(temp,714)
	sleep 250
	;ָ��λ��
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

;�����ż���
msk(sk,st:=0,sm:=0,sn:=0)
{
	if(sk>4 || sk<0)
		MsgBox �������ܲ����쳣,����msk(%sk%...)
	skc:=[ 1130,1240,1350 ]
	skt:=[ 400,800,1200 ]
	change:=[ 170,420,670, 920,1170,1420 ]
	;�������
	sclick(1500,394)
	sleep 400
	;����λ��
	temp:=skc[sk]
	sclick(temp,394)
	sleep 300
	;ָ��λ��
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

;�л�Ŀ��
target(n)
{
	enemy:=[ 60,360,660 ]
	temp:=enemy[n]
	sclick(temp,54)
	sleep 300
}
return

;================================================================================================

;ƽ��n�غϣ�ֱ������һ�棬��ս�������������ڼ��ս������״̬��
xjbd(n:=0)
{
	nn:=0
	loop
	{
		;���ս��Ʒ�������
		if(pixc(155,114,0xE5B419) && pixc(1430,114,0x05ACF4))
			return
		;����������
		if(pixc(500,834,0x000000) and n>0)
			break
		;���ս�������Ƿ��ֳ���
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
	;���ص�����
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

;��3��ƽ��(�����׺�)
attack()
{
	;ָ���� 320,319,322,325
	ccoord:=[ 213,533,852,1174,1499 ]
	sclick(1400,764)
	sleep 500

	;ѡ1�ź쿨�����û�о�ѡ���һ��
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

	;��ѡ�������ſ�
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

;���߻غϳ���
baoju(n1,n2:=0,n3:=0)
{
	;��ѡ������
	sclick(1400,764)
	sleep 1600

	;��һ��ѡ��
	if(n1)
		npc(n1)
	else
		sclick(480,604)
	sleep 150

	;�ڶ���ѡ��
	if(n2)
		npc(n2)
	else
		sclick(800,604)
	sleep 150

	;������ѡ��
	if(n3)
		npc(n3)
	else
		sclick(1120,604)
	sleep 150

	sleep 5000
	;�ȴ��ɽ�����һ������
	loop
	{
		;���ս��Ʒ�������
		if(pixc(155,114,0xE5B419) && pixc(1430,114,0x05ACF4))
			break
		;���ս�������Ƿ��ֳ���
		if(pixc(1400,699,0x02D9F1) && pixc(1450,254,0x1A2333))
			break
		sclick(1212,85)
		sleep 100
	}
	sleep 300
}
return

;ѡһ�����߿�
npc(n)
{
	npcard:=[ 480,800,1120 ]
	temp:=npcard[n]
	sclick(temp,264)
}
return

;================================================================================================

;���ģ��������
checkmnq:
{
	if(mnq=1)
	{
		if(!WinActive("ahk_exe NemuPlayer.exe"))
		{
			msgbox δ����mumu����
			exit
		}
	}
	else if(mnq=2)
	{
		if(!WinActive("ahk_exe dnplayer.exe"))
		{
			msgbox δ�����׵細��
			exit
		}
	}
}
return

;�ö�mumu����
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