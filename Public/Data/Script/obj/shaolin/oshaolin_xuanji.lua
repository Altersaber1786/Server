--Thi猽 L鈓NPC
--玄寂
--普通

x009003_g_scriptId = 009003
x009003_g_eventList={220900, 808004}
--**********************************
--事件交互入口
--**********************************
function x009003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  L鉶 n誴 Huy玭 T竎h, th� ch� t靘 l鉶 n誴 c� chuy畁 g�?")
		local mp = GetMenPai(sceneId, selfId)
		local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		if mp == 9 then 
			if nMenpaiPoint <= 0 then
				AddNumText(sceneId, x009003_g_scriptId, "Gia nh m鬾 ph醝",6,0)
			end
		end
		AddNumText(sceneId, x009003_g_scriptId, "Gi緄 thi畊 m鬾 ph醝",8,1)
		AddNumText(sceneId, x009003_g_scriptId, "H鱟 K� n錸g c黙 m鬾 ph醝?",8,6)		--指路到技能学习人
		for i, eventId in x009003_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x009003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText()==0	then
		x009003_g_MenPai = GetMenPai(sceneId, selfId)
		if x009003_g_MenPai == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "Ng呓i l読 t緄 痱i b醝 ph醝 Ti陁 Dao l鄊 s� ph�, ng呓i 疸 l� 甬 t� Thi猽 L鈓, c騨 mu痭 b醝 s� g� n鎍")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x009003_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, l唼ng th� Thi猽 L鈓 ch鷑g t鬷 ch鵤 b�, kh鬾g ch補 疬㧟 b裞 t唼ng l緉 nh� c醕 h�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_000}")
			AddNumText(sceneId, x009003_g_scriptId, "Ta mu痭 b醝 nh ph醝 Thi猽 L鈓",6,3)
			AddNumText(sceneId, x009003_g_scriptId, "T読 h� ch遖 mu痭 b醝 s�",8,4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		 
		return
	end
	
	if GetNumText()==4	then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	
	if GetNumText()==3	then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  H銀 s x猵 l読 tay n鋓, c 2 v� tr� tr痭g, ta s� th叻ng cho ng呓i!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel( sceneId, selfId ) < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"Th� ch� 瘙i t緄 疬㧟 c 10 h莕g t緄 b醝 s� h鱟 ngh�!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x009003_g_MenPai = GetMenPai(sceneId, selfId)
			if x009003_g_MenPai == 0 then
				BeginEvent(sceneId)
					AddText(sceneId, "Ng呓i l読 t緄 痱i b醝 ph醝 Ti陁 Dao l鄊 s� ph�, ng呓i 疸 l� 甬 t� Thi猽 L鈓, c騨 mu痭 b醝 s� g� n鎍")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--Tr� v滴�9表示无门派
			elseif x009003_g_MenPai==9	then
				
				LuaFnJoinMenpai(sceneId, selfId, targetId, 0)

				-- 设置初始to� 鸬 Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关to� 鸬 心法设置为10c别  1,4,5
				LuaFnSetXinFaLevel(sceneId,selfId,1,10)
				LuaFnSetXinFaLevel(sceneId,selfId,4,10)
				LuaFnSetXinFaLevel(sceneId,selfId,5,10)
				
				BeginEvent(sceneId)
	  				AddText(sceneId,"C醕 h� 疸 gia nh ph醝 Thi猽 L鈓!");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
	  			
	  			if TryRecieveItem( sceneId, selfId, 10124000, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124000).."."
					x009003_MsgBox( sceneId, selfId, str )
				end
				
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_3}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_shaolin_0001}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x009003_MsgBox( sceneId, selfId, "L 疬㧟 20 t Chi陁 t l畁h c黙 m鬾 ph醝" )

				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh ph醝 Thi猽 L鈓!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
					CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh ph醝 Thi猽 L鈓!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
					CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, l唼ng th� Thi猽 L鈓 ch鷑g t鬷 ch鵤 b�, kh鬾g ch補 疬㧟 b裞 t唼ng l緉 nh� c醕 h�")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_shaolin_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		for i, findId in x009003_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_SHAOLIN )
				return
			end
		end
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "姓i s� Huy玭 N課 [91,71] c� th� d誽 ng呓i k� n錸g chi猲 黏u c黙 ph醝 ta, 鬾g ngay � b阯 c課h ta")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 91, 71, "Huy玭 N課" )
		return
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x009003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x009003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			--UpdateEventList( sceneId, selfId, targetId ) --根本就没有C醝 n鄖 函数,who do to� 鸬 ???
			x009003_OnDefaultEvent( sceneId, selfId,targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x009003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x009003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x009003_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x009003_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
