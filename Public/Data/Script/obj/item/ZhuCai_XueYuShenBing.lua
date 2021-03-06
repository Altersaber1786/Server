-- 创建人[ QUFEI 2007-09-30 21:53 UPDATE BugID 25759 ]
-- 修改人[ 褚少微 2008.5.20 添加102c神器to� 鸬 合成配方 ]

-- 血浴神兵完整主材to� 鸬 合成机制实现 (改成正确T阯)
-- ItemID = 30505800~30505805(新莽神符)			30505806 102c神器
-- 335135
-- 提高神符完成度及完整神符to� 鸬 合成
-- 物品可以使用1次
-- 使用完就删除物品


--******************************************************************************
-- 以下部分C 喧ngC 修改to� 鸬 部分
--******************************************************************************

--脚本号 (改成正确脚本号)
x335135_g_scriptId = 335135

-- 增加值 (根据要求改写具体数值)
x335135_g_CompleteValue = 5			-- 神材增加完成度			-- 褚少微,102神器.方便测试调成了50,测试完毕调回5即可.
--x335135_g_MaxCompleteValue = 100-- 最大神材完成度上限
x335135_g_MaxUseCount = 1				-- 最大使用次数1次

--标准效果ID (改成神材合成to� 鸬 特效)
--g_ImpactID = 0

--神材合成对应表
x335135_g_ShenCaiTable = {{sjid=30505700,sfid=30505800,lrid=30505900},
													{sjid=30505701,sfid=30505801,lrid=30505901},
													{sjid=30505702,sfid=30505802,lrid=30505902},
													{sjid=30505703,sfid=30505803,lrid=30505903},
													{sjid=30505704,sfid=30505804,lrid=30505904},
													{sjid=30505705,sfid=30505805,lrid=30505905},
													{sjid=30505706,sfid=30505806,lrid=30505906},}		-- -- 褚少微 2008.5.20. 102c神器铸造图样.残缺to� 鸬 神节7c,T鈔 m鉵g th ph� c 7,连戎神节7c.
x335135_g_MaxCompleteValue = {25,50,75,100,100,100,100}
-- 当前可以合成to� 鸬 神材索引号
x335135_g_ShenCaiIndex = 0

-- 使用新莽神符增加完整度时to� 鸬 特效ID
x335135_g_Impact_LevelUP = 47

-- 合成出连戎神节时to� 鸬 特效ID
x335135_g_Impact_Complete = 48

-- 褚少微,102神器
x335135_g_XinMang7JiInfo = "T鈔 m鉵g th ph� c 7"

--******************************************************************************
-- 以上部分C 喧ngC 修改to� 鸬 部分
--******************************************************************************

--脚本

--**********************************
--事件交互入口
--**********************************
function x335135_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x335135_IsSkillLikeScript( sceneId, selfId)
	return 1	--C醝 n鄖 脚本C 动作支持
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x335135_OnConditionCheck( sceneId, selfId )
	-- PrintStr("OnConditionCheck...")
	
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--  餴琺到当前正T読 使用to� 鸬 物品to� 鸬 tr� tay n鋓
	local nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	
	--  餴琺到当前正T読 使用to� 鸬 物品to� 鸬 ID
	local Item01 = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nIndex)
	
	-- PrintStr("Item01 ="..Item01)
	
	-- 褚少微 2008.5.20. 102c神器铸造图样.七c醝新莽神符.
	for i=1, 7 do				--for i=1, 6 do
		if Item01 == x335135_g_ShenCaiTable[i].sfid then
			x335135_g_ShenCaiIndex = i
			-- PrintStr("x335135_g_ShenCaiIndex ="..x335135_g_ShenCaiIndex)
			break
		end
		-- PrintStr("sfid ="..x335135_g_ShenCaiTable[i].sfid)
	end
	
	-- PrintStr("x335135_g_ShenCaiIndex ="..x335135_g_ShenCaiIndex)
		
	-- 褚少微 2008.5.20. 102c神器铸造图样.添加新to� 鸬 新莽神符
	if Item01 < 30505800 or Item01 > 30505806 then			-- if Item01 < 30505800 or Item01 > 30505805 then
		local strNotice = "Ch� c� th� d鵱g t鈔 m鉵g th ph� h䅟 th鄋h" -- 新莽神符
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- PrintStr("sjid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid)
	
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid )
	if ItemCount < 1 then
		local strNotice = "Ng呓i c ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- 残缺to� 鸬 神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	local bagbegin = GetBasicBagStartPos(sceneId, selfId)
	local bagend   = GetBasicBagEndPos(sceneId, selfId)
	-- PrintStr("bagbegin ="..bagbegin)
	-- PrintStr("bagend ="..bagend)
	local ItemEX
	--  鹫t 疬㧟当前可以合成to� 鸬 第m祎 c醝神节T読 背包中to� 鸬 位置	
	local sjbagpos = -1
	for i=bagbegin, bagend do
		if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
			ItemEX = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
			if ItemEX == x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid then
				-- PrintStr("ItemEX ="..ItemEX)
				sjbagpos = i
				break
			end		
		end
	end
		
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	if sjbagpos == -1 then
		local strNotice = "Ng呓i c ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- 残缺to� 鸬 神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	local CheckParam = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )   
	
	-- PrintStr("CheckParam ="..CheckParam)
	
	if CheckParam < x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] and CheckParam + x335135_g_CompleteValue >= x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] then		-- 当完整度达到100时喧ng否还有空间
		local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
		if( FreeSpace < 1 ) then
	     local strNotice = "� 鹫o c� kh鬾g c� kh鬾g gian, c s豠 sang l読."
		   x335135_ShowMsg( sceneId, selfId, strNotice)
	     return 0
		end
	end
	
	
	-- 褚少微,102神器.如果使用to� 鸬 喧ngT鈔 m鉵g th ph� c 7
	if Item01 == 30505806 then
		x335135_g_XinMang7JiInfo = GetBagItemTransfer( sceneId, selfId, nIndex )
		--PrintStr(x335135_g_XinMang7JiInfo)
	end
	
	
	return 1; --不C 任何条件,并且始终Tr� v�1.
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x335135_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335135_OnActivateOnce( sceneId, selfId )

	-- PrintStr("OnActivateOnce...")
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid )
	
	if ItemCount < 1 then
		local strNotice = "Ng呓i c ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- 残缺to� 鸬 神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	--  餴琺到当前正T読 使用to� 鸬 物品to� 鸬 tr� tay n鋓
	local nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	
	-- PrintStr("nIndex ="..nIndex)
	
	--  餴琺到当前正T読 使用to� 鸬 物品to� 鸬 ID
	local Item01 = x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sfid
	
	-- PrintStr("Item01 ="..Item01)
	
	--消耗选中to� 鸬 新莽神符
  -- ret = LuaFnDelAvailableItem(sceneId, selfId, Item01, 1)
	local bagbegin = GetBasicBagStartPos(sceneId, selfId)
	local bagend   = GetBasicBagEndPos(sceneId, selfId)
	-- PrintStr("bagbegin ="..bagbegin)
	-- PrintStr("bagend ="..bagend)
	local ItemEX
	--  鹫t 疬㧟当前可以合成to� 鸬 第m祎 c醝神节T読 背包中to� 鸬 位置	
	local sjbagpos = -1
	for i=bagbegin, bagend do
		if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
			ItemEX = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
			if ItemEX == x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid then
				-- PrintStr("ItemEX ="..ItemEX)
				sjbagpos = i
				break
			end		
		end
	end
		
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	if sjbagpos == -1 then
		local strNotice = "Ng呓i c ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- 残缺to� 鸬 神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	--  鹫t 疬㧟当前合成to� 鸬 神节完整度	
	local CompleteValue = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )
	-- PrintStr("CompleteValue ="..CompleteValue)

	if nIndex >= 0 then		
		
		-- 记录统计信息
		LuaFnAuditShenCai(sceneId, selfId, Item01)
		
		CompleteValue = CompleteValue + x335135_g_CompleteValue
		
		-- PrintStr("CompleteValue ="..CompleteValue)
		
		SetBagItemParam( sceneId, selfId, sjbagpos, 8, 2, CompleteValue ) --设置完成度
		
		-- 褚少微,2008.5.22 添加世界H� th痭g公告	#IS� d鴑g m祎 c醝新莽神符#G7c#I,离铸成绝世神器又近了m祎 步.
		if Item01 == 30505806 then
			local playername = GetName(sceneId, selfId)	
			local strText = format("#{_INFOUSR%s}#{DQSJ_20080512_12}#{_INFOMSG%s}#{DQSJ_20080512_13}", playername, x335135_g_XinMang7JiInfo)						
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end
		
		--------------参数设置安全性检测,虽然理论上参数设置不会th b読
		local CheckParam = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )   
				
		-- PrintStr("CheckParam ="..CheckParam)
				
		if CheckParam ~= CompleteValue then
		    return 0
		end		
		--------------参数设置安全性检测,虽然理论上参数设置不会th b読
		
		local strNotice = "C黙 ng呓i ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}".."啸y 瘘 鸬 gia t錸g 1 r癷" -- 残缺to� 鸬 神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
		
		LuaFnRefreshItemInfo( sceneId, selfId, sjbagpos )	--刷新背包信息
		
		if CompleteValue >= x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] then		-- 当完整度达到100时
					
			local EraseRet = EraseItem( sceneId, selfId, sjbagpos )
			
			if EraseRet < 0 then      --如果删除th b読,将不会产生任何效果			  
					return 0
			end
			
			-- PrintStr("lrid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid)
			
			BeginAddItem( sceneId )
			AddItem( sceneId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, 1 )
			ret = EndAddItem( sceneId, selfId )
											
			if ret > 0 then
				TryRecieveItem( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了							
				
			else
					BeginEvent(sceneId)
					strText = "� 鹫o c� ho nguy阯 li畊 kh鬾g 瘘 kh鬾g gian, th飊h s豠 sang l読 sau l読 皙n l頽h."
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return 0
			end		
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_Complete, 0 )
		else
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_LevelUP, 0 )
		end
		
	else
		local strMsg = "H䅟 th鄋h th b読"
		x335135_ShowMsg( sceneId, selfId, strMsg)
		return 0
	end
  
	-- 主材合成完毕

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335135_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
function x335135_CancelImpacts( sceneId, selfId )
	return 0		--不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

function x335135_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
