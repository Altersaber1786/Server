--活动——
--春节活动-L頽h 鞭炮

--脚本号
x050054_g_ScriptId = 050054
--活动时间
x050054_g_StartDayTime = 8030   --活动结束时间 2008-1-31
x050054_g_EndDayTime = 8044   --活动结束时间 2008-2-14

--鞭炮ID
x050054_g_BianPaoID = 30505165

--x050054_g_strPlayerLvErr = "你去炸年兽！天哪,你还喧ng不要去了,年兽好可怕to� 鸬 ,你还不到10c呢,根本不可能打过它to� 鸬 !"
--x050054_g_strNotSpace = "您to� 鸬 包裹没有足够空间,请整理后再来L頽h ."
--x050054_g_strYiLingQu = "你已经要了很多鞭炮了啦！你快去炸年兽吧！爹藅o� 鸬 晔夼芰宋颐莟o� 鸬 生活就好起来啦!"
--x050054_g_strGetBianPao = "送你m祎 枚鞭炮！就m祎 枚哦！你看起来好厉害to� 鸬 ,m祎 定能够把年兽打败！諰inh佟材馨阉排馨�."

x050054_g_strPlayerLvErr = "#{NSBS_20071228_04}"
x050054_g_strNotSpace = "您to� 鸬 包裹没有足够空间,请整理后再来L頽h ."
x050054_g_strYiLingQu = "#{NSBS_20071228_05}"
x050054_g_strGetBianPao = "#{NSBS_20071228_06}"

--**********************************
--任务入口函数
--**********************************
function x050054_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050054_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	local NumText = GetNumText()

	if NumText == 101 then
		--领c醝人鞭炮....
		x050054_GiveSelfBianPao( sceneId, selfId, targetId )
	end
end

--**********************************
--列举事件
--**********************************
function x050054_OnEnumerate( sceneId, selfId, targetId )

    local isTime = x050054_CheckRightTime()
    if 1 == isTime then
			AddNumText(sceneId, x050054_g_ScriptId, "给我m祎 枚鞭炮", 6, 101 )													
    end

end

--**********************************
--检测活动喧ng否已结束
--**********************************
function x050054_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x050054_g_StartDayTime and curDayTime <= x050054_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--领c醝人鞭炮
--**********************************
function x050054_GiveSelfBianPao( sceneId, selfId, targetId )

	--检测玩家等c....
	if x050054_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--今天已经领过to� 鸬 数量....
	local num = GetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_NUMBER )
	--上次L頽h 时间....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_DAYTIME )
	local CurDayTime = GetDayTime()
	
	if CurDayTime <= lastDayTime then		
		if num >10 then--L頽h 数量超过10
			BeginEvent(sceneId)
				AddText( sceneId, x050054_g_strYiLingQu )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	else
		num = 50;
	end

	--检测背包喧ng否有地方....
	if x050054_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	
	if x050054_GivePlayerBianPao( sceneId, selfId, targetId ) ==1 then
		SetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_DAYTIME, CurDayTime )
		SetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_NUMBER, num )
	end
	
end

	
--**********************************
--检测玩家等c喧ng否符合要求
--**********************************
function x050054_CheckPlayerLv( sceneId, selfId, targetId )

	if GetLevel( sceneId, selfId ) < 10 then
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strPlayerLvErr )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--检测玩家背包空间喧ng否足够
--**********************************
function x050054_CheckPacketSpace( sceneId, selfId, targetId )

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strNotSpace )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--给玩家鞭炮
--**********************************
function x050054_GivePlayerBianPao( sceneId, selfId, targetId )
			
	--给鞭炮1自己to� 鸬 ....
	--local BagIndex = TryRecieveItem( sceneId, selfId, x050054_g_BianPaoID, QUALITY_MUST_BE_CHANGE )

	--if BagIndex ~= -1 then
		--LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
	--end
	BeginAddItem(sceneId)
	AddItem( sceneId, x050054_g_BianPaoID , 50 )
	local canAdd1 = EndAddItem(sceneId,selfId)
			
	if canAdd1 == 0  then
		--BeginEvent( sceneId )
			--AddText( sceneId, "您to� 鸬 物品栏没有足够空间,请下次L頽h 时留出足够物品栏空间." )
		--EndEvent( sceneId )
		--DispatchMissionTips( sceneId, selfId )
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strNotSpace )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		AddItemListToHuman(sceneId,selfId)
				--local transfer = GetItemTransfer(sceneId,selfId,0)
				
				--local str1 = format( "#{_INFOUSR%s}", GetName(sceneId, selfId))
				--local str2 = format("#W#{_INFOMSG%s}", transfer)
				--local strMsg = str1..x500501_g_strDieNotice0..str2..x500501_g_strDieNotice1				
				--BroadMsgByChatPipe(sceneId, selfId, strMsg, 4)	
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strGetBianPao )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 1	
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x050054_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x050054_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x050054_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x050054_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x050054_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x050054_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050054_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x050054_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x050054_OnItemChanged( sceneId, selfId, itemdataId )
end
