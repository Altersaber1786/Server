--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


--Public\Data\Script\obj\commonitem\speaker.lua
------------------------------------------------------------------------------------------
--m祎 般物品to� 鸬 默认脚本
--小喇叭
--脚本号
x330003_g_ScriptId	= 330003

--效果to� 鸬 ID
x330003_g_Impact		= -1	--使用m祎 c醝特定to� 鸬 特效编号

--Tr� v荡砑�
x330003_g_WGCResult	=
{
	["SUC_SEND"]			= 36,		--C醝 k鑞 nh� 疸 ph醫 th鄋h c鬾g
	["FAL_SEND"]			= 37,		--小喇叭发送th b読: 未知
	["FAL_FULL"]			= 38,		--小喇叭发送th b読: 消息池已满
}


x330003_g_itemTabIdxList = { 30505107, 30505219 }

--**********************************
--事件交互入口
--**********************************
function x330003_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x330003_IsSkillLikeScript( sceneId, selfId )
	return 1	 --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x330003_CancelImpacts( sceneId, selfId )
	return 0	 --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x330003_OnConditionCheck( sceneId, selfId )

	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--检测物品喧ng否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x330003_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return 0
	end

	--校验使用to� 鸬 物品
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	return 1

end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x330003_OnDeplete( sceneId, selfId )
--if( 0 < LuaFnDepletingUsedItem( sceneId, selfId ) ) then
--	return 1
--end
--return 0

	return 1
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x330003_OnActivateOnce( sceneId, selfId )

	if( -1 ~= x330003_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x330003_g_Impact, 0 )
	end
	
	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	--呼叫发送界面
	BeginUICommand( sceneId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 5422 )
	return 1

end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x330003_OnActivateEachTick( sceneId, selfId )
	return 1	 --不喧ng引导性脚本, 只保留空函数.
end

--**********************************
--C++回调接口,严禁Client呼叫: 
--小喇叭发布前检查
--**********************************
function x330003_CallBackSpeakerBefore( sceneId, selfId )

	--获取物品ID
	local ItemIndex = 0
	if LuaFnGetAvailableItemCount( sceneId, selfId, x330003_g_itemTabIdxList[2] ) > 0 then
		ItemIndex = x330003_g_itemTabIdxList[2]
		SetMissionData( sceneId, selfId, MD_SPEAKER_STATE, x330003_g_itemTabIdxList[2] )		
	else
		ItemIndex = x330003_g_itemTabIdxList[1]
		SetMissionData( sceneId, selfId, MD_SPEAKER_STATE, x330003_g_itemTabIdxList[1] )
	end
			
	local	itmId	= ItemIndex;
	if itmId <= 0 then
		x330003_MsgBox( sceneId, selfId, "T痗 鸬 truy玭 tin c黙 c醕 h� qu� nhanh!" )
		return 0
	end
	if LuaFnDelAvailableItem( sceneId, selfId, itmId, 1 ) == 0 then
		x330003_MsgBox( sceneId, selfId, "Kh鬾g c� v ph, v ph kh鬾g th� s� d鴑g ho b� kh骯!" )
		return 0
	end

	return 1
end

--**********************************
--C++回调接口,严禁Client呼叫: 
--小喇叭发布后Tr� v�
--**********************************
function x330003_CallBackSpeakerAfter( sceneId, selfId, retType, retParam )

	--获取物品ID
	local ItemIndex = GetMissionData( sceneId, selfId, MD_SPEAKER_STATE )

	local ItemId = 0
	for i, ItemTabIdx in x330003_g_itemTabIdxList do
		if ItemIndex == ItemTabIdx then
			ItemId = ItemIndex
			break
		end
	end
	local	itmId	= ItemId;
	if itmId <= 0 then
		return 0
	end

	if retType == x330003_g_WGCResult["SUC_SEND"] then
		if retParam > 0 then
			nMin		= floor( retParam / 60 )
			nSec		= mod( retParam, 60 )
			szTim		= nil
			if nMin > 0 then
				szTim	= nMin.." ph鷗"..nSec.." gi鈟"
			else
				szTim	= nSec.." gi鈟"
			end
			x330003_MsgBox( sceneId, selfId, "C醝 k鑞 nh� 疸 ph醫 th鄋h c鬾g, c醕 h� c 瘙i kho鋘g"..szTim.."." )
		else
			x330003_MsgBox( sceneId, selfId, "C醝 k鑞 nh� 疸 ph醫 th鄋h c鬾g." )
		end
	elseif retType == x330003_g_WGCResult["FAL_SEND"] then
		x330003_MsgBox( sceneId, selfId, "C醝 k鑞 nh� 疸 ph醫 th b読!" )
	elseif retType == x330003_g_WGCResult["FAL_FULL"] then
		x330003_MsgBox( sceneId, selfId, "Tin t裞 c黙 c醝 k鑞 nh� 疸 馥y, vui l騨g 瘙i 30 gi鈟 n鎍 r癷 h銀 th� l読!" )
		TryRecieveItem( sceneId, selfId, itmId, QUALITY_CREATE_DEFAULT )
	end

	return 1
end

--**********************************
--信息提示
--**********************************
function x330003_MsgBox( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
