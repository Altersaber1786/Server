
--每次打开必定 鹫t 疬㧟to� 鸬 产品
x715031_g_MainItemId = 20103008
--可能 餴琺到to� 鸬 产品
x715031_g_SubItemId = 50112003
--角色身上必须有to� 鸬 物品
x715031_g_MustHaveItemId = 20309009

function 	x715031_OnCreate(sceneId,growPointType,x,y)
	local targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715031_g_MainItemId)
	
	--80%几率,宝箱里出现1c醝物品,出现to� 鸬 物品to� 鸬 判定等于 朽o b醬 v to� 鸬 时候出现物品to� 鸬 判定.
	if random(100) <= 80 then
		local ItemSn, ItemName, bBroadCast = GetItemSnByDropRateOfItemTable()
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,ItemSn)
	end	
	
end


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x715031_OnOpen(sceneId,selfId,targetId)
--Tr� v嘈�
-- 0 表示打开成功
	--PrintStr("OnOpen...")
	if HaveItem(sceneId,selfId, x715031_g_MustHaveItemId) > 0 then
		local Bagpos = GetBagPosByItemSn(sceneId,selfId,x715031_g_MustHaveItemId)
		if LuaFnIsItemAvailable(sceneId,selfId,Bagpos) == 1 then
			return OR_OK
		else
			Msg2Player(  sceneId, selfId,"宝藏主人to� 鸬 钥匙现T読 似乎不可用." ,MSG2PLAYER_PARA )	
			BeginEvent(sceneId)
				AddText(sceneId, "宝藏主人to� 鸬 钥匙现T読 似乎不可用.")
			EndEvent()
			DispatchMissionTips(sceneId,selfId)
			return OR_ERROR	
		end
	else
		BeginEvent(sceneId)
			AddText(sceneId, "C 宝藏主人to� 鸬 钥匙才能打开");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_STUFF_LACK	
	end
end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


function	x715031_OnProcOver(sceneId,selfId,targetId)
	--PrintStr("OnProcOver...")
	--打开宝箱会100% 鹫t 疬㧟钱,直接加T読 玩家身上即可.
	--钱数=114＋(boss等c－30)×16 -->bosslevel == playerlevel
	if 1 == LuaFnDelAvailableItem(sceneId,selfId, x715031_g_MustHaveItemId, 1) then
		local BonusMoney = 114 + (GetLevel(sceneId, selfId)-20) * 16
		AddMoney(sceneId, selfId, BonusMoney)
		Msg2Player(  sceneId, selfId,"你 餴琺到了#{_MONEY" .. tostring(BonusMoney) .. "}" ,MSG2PLAYER_PARA )	
	else
		Msg2Player(  sceneId, selfId,"宝藏主人to� 鸬 钥匙现T読 似乎不可用." ,MSG2PLAYER_PARA )	
		return OR_ERROR
	end
	return OR_OK
end

--回收函数开始########################################################################
function	 x715031_OnRecycle(sceneId,selfId,targetId)
		return OR_OK
end
--回收函数结束########################################################################

function x715031_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
