-- 剧情任务——万劫谷  副本内送信到副本外
-- 石敢当->段正淳

--MisDescBegin
--脚本号
x200004_g_ScriptId = 200004

--任务号
x200004_g_MissionId = 4

--前续任务
x200004_g_PreMissionId = 3

--上m祎 c醝任务to� 鸬 ID
--g_MissionIdPre = 

--目标NPC
x200004_g_Name	="衞鄋 Ch韓h Thu"

--任务归类
x200004_g_MissionKind = 51

--衅ng c nhi甿 v� 
x200004_g_MissionLevel = 20

--喧ng否喧ngTinh英任务
x200004_g_IfMissionElite = 0

--Ti猵 th挝馧PC属性
x200004_g_Position_X=62.9422
x200004_g_Position_Z=35.9417
x200004_g_SceneID=2
x200004_g_AccomplishNPC_Name="衞鄋 Ch韓h Thu"

--任务名
x200004_g_MissionName="羉 Qu醤 M鉵 Doanh"
x200004_g_MissionInfo="#{Mis_juqing_0004}"
x200004_g_MissionTarget="#{Mis_juqing_Tar_0004}"
x200004_g_MissionComplete="  N鄖, n鄖, ta l t裞 th鬾g b醥 vi甤 n鄖 cho ho鄋g huynh"

x200004_g_MoneyBonus=7200
x200004_g_exp=6900

x200004_g_RadioItemBonus={{id=10414001 ,num=1},{id=10414002,num=1},{id=10414003,num=1},{id=10414004,num=1}}

x200004_g_Custom	= { {id="秀 t靘 疬㧟 衞鄋 Ch韓h Thu",num=1} }

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x200004_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x200004_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200004_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200004_g_Name then
			x200004_OnContinue( sceneId, selfId, targetId )
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x200004_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200004_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
			AddText(sceneId,x200004_g_MissionName)
			AddText(sceneId,x200004_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200004_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200004_g_MoneyBonus )
			for i, item in x200004_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200004_g_ScriptId,x200004_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x200004_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x200004_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200004_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200004_g_Name then
			AddNumText(sceneId, x200004_g_ScriptId,x200004_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x200004_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200004_g_Name then
			AddNumText(sceneId,x200004_g_ScriptId,x200004_g_MissionName,1,-1);
		end
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200004_CheckAccept( sceneId, selfId )
	--C 3c才能接
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200004_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--Ti猵 th�
--**********************************
function x200004_OnAccept( sceneId, selfId, targetId )
	if x200004_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200004_g_MissionId, x200004_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: 羉 Qu醤 M鉵 Doanh",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200004_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--放弃
--**********************************
function x200004_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200004_g_MissionId )
--	--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200004_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200004_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x200004_g_MissionName)
		AddText(sceneId,x200004_g_MissionComplete)
		AddMoneyBonus( sceneId, x200004_g_MoneyBonus )
		for i, item in x200004_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200004_g_ScriptId,x200004_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200004_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200004_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200004_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200004_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
  	BeginAddItem(sceneId)
		for i, item in x200004_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
		if ret < 1 then
			--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		AddItemListToHuman(sceneId,selfId)

		--添加任务奖励
		AddMoney(sceneId,selfId,x200004_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200004_g_exp)

		DelMission( sceneId,selfId,  x200004_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200004_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: 羉 Qu醤 M鉵 Doanh",MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200002), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200004_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200004_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200004_OnItemChanged( sceneId, selfId, itemdataId )
end
