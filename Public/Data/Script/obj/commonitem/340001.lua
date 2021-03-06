--门派召集令脚本.注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


--340001.lua
------------------------------------------------------------------------------------------
--m祎 般物品to� 鸬 默认脚本

--脚本号
x340001_g_scriptId = 340001 --临时写C醝 n鄖 ,真正用to� 鸬 时候m祎 定要改.

--C to� 鸬 等c

--效果to� 鸬 ID
x340001_g_Impact1 = 340001 --临时写C醝 n鄖 
x340001_g_Impact2 = -1 --不用

x340001_g_Impact_NotTransportList = { 5929 } -- 禁止传送to� 鸬 Impact
x340001_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- 禁止传送to� 鸬 Impact提示信息

--**********************************
--事件交互入口
--**********************************
function x340001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x340001_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x340001_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x340001_OnConditionCheck( sceneId, selfId )

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			strText = "Anh 餫ng trong tr課g th醝 T鄌 v, kh鬾g th� s� d鴑g ch裞 n錸g truy玭 tin."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end
	
	-- 检测玩家身上喧ng不喧ng有“银票”C醝 n鄖 东西,有就不能使用这里to� 鸬 功能
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "Tr阯 ng叨i ng呓i c� ng鈔 phi猽, 餫ng ch誽 h鄋g! kh鬾g th� s� d鴑g ch裞 n錸g truy玭 tin." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x340001_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x340001_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	return 1; --不C 任何条件,并且始终Tr� v�1.
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x340001_OnDeplete( sceneId, selfId )

  local Level = GetLevel( sceneId, selfId )
  local MenPai = LuaFnGetMenPai( sceneId, selfId )
  
  if Level < 10 then
      return 0
  end
  
  if MenPai < 0 or MenPai >8 then           
 		  BeginEvent(sceneId)
			  strText = format("Kh鬾g gia nh m鬾 ph醝, kh鬾g 疬㧟 s� d鴑g v ph n鄖")
			  AddText(sceneId,strText)
 		  EndEvent(sceneId)

 		  DispatchMissionTips(sceneId,selfId)
 		  
      return 0
  end
  
  if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			strText = "Anh 餫ng trong tr課g th醝 T鄌 v, kh鬾g th� s� d鴑g ch裞 n錸g truy玭 tin."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end
  
  	-- 检测玩家身上喧ng不喧ng有“银票”C醝 n鄖 东西,有就不能使用这里to� 鸬 功能
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "Tr阯 ng叨i ng呓i c� ng鈔 phi猽, 餫ng ch誽 h鄋g! kh鬾g th� s� d鴑g ch裞 n錸g truy玭 tin." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
  
  --检测Impact状态驻留效果
	for i, ImpactId in x340001_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x340001_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
  
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end



function x340001_MenpaiTransfer( sceneId, selfId )
            
    local MenPai = LuaFnGetMenPai( sceneId, selfId )
    
    local TargetScene
    local x
    local z
    
    if( MenPai >= 0 and MenPai <=8 ) then
        if 0 == MenPai then      --Thi猽 L鈓
            TargetScene = 9
            x = 93
            z = 72  
        end
        
        if 1 == MenPai then      --Minh Gi醥
            TargetScene = 11
            x = 106
            z = 59          
        end

        if 2 == MenPai then      --C醝 Bang
            TargetScene = 10
            x = 91
            z = 100          
        end

        if 3 == MenPai then      --V� 衋ng
            TargetScene = 12
            x = 80
            z = 87                  
        end

        if 4 == MenPai then      --Nga My
            TargetScene = 15
            x = 96
            z = 48                  
        end

        if 5 == MenPai then      --Tinh T鷆
            TargetScene = 16
            x = 86
            z = 73                  
        end

        if 6 == MenPai then      --姓i L�
            TargetScene = 13
            x = 96
            z = 88                  
        end

        if 7 == MenPai then      --Thi阯 S絥
            TargetScene = 17
            x = 89
            z = 47                  
        end

        if 8 == MenPai then      --消遥
            TargetScene = 14
            x = 122
            z = 141                  
        end        
        
       
       if sceneId == TargetScene then
           
           SetPos( sceneId, selfId, x, z )
           return
       end
       
        CallScriptFunction((400900), "TransferFunc",sceneId, selfId, TargetScene, x, z) 
		--数据统计
		LuaFnAuditItemUseMenPaiZhaoJiLing(sceneId, selfId, MenPai)
        
    
    end        
    
    
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x340001_OnActivateOnce( sceneId, selfId )

	if(-1~=x340001_g_Impact1) then
		--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x340001_g_Impact1, 0);
		x340001_MenpaiTransfer( sceneId, selfId )
	end
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x340001_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end
