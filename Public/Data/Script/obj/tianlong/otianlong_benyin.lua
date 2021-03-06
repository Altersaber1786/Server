--掌门人
--本因

--脚本号
x013001_g_scriptId = 013001
x013001_g_eventList={224900,229009,808004,229012,808092}
--**********************************
--事件交互入口
--**********************************
function x013001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  L鉶 n誴 B眓 Nh絥, th� ch� t靘 l鉶 n誴 c� chuy畁 g�?")
		local mp = GetMenPai(sceneId, selfId)
		local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		if mp == 9 then 
			if nMenpaiPoint <= 0 then
				AddNumText(sceneId, x013001_g_scriptId, "Gia nh m鬾 ph醝",6,0)
			end
		end
		AddNumText(sceneId, x013001_g_scriptId, "Gi緄 thi畊 m鬾 ph醝",8,1)
		AddNumText(sceneId, x013001_g_scriptId, "H鱟 K� n錸g c黙 m鬾 ph醝?",8,6)		--指路到技能学习人
		for i, eventId in x013001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x013001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x013001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_DALI )
			return
		end
	end
	if GetNumText()==0	then

		x013001_g_MenPai = GetMenPai(sceneId, selfId)
		if x013001_g_MenPai == 6  then
			BeginEvent(sceneId)
				AddText(sceneId, "Ng呓i l読 皙n 瘗a c⺶ v緄 ta r癷, ng呓i 疸 l� 甬 t� Thi阯 Long T�, c騨 b醝 s� g� n鎍")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x013001_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i 疸 l� cao 甬 c黙 m鬾 ph醝 kh醕 r癷, Thi阯 Long T� c黙 ch鷑g ta nh�, l鄊 sao ch� 疬㧟 鹫i Ph nh� ng呓i")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_006}")
			AddNumText(sceneId, x013001_g_scriptId, "Ta mu痭 b醝 nh Thi阯 Long",6,3)
			AddNumText(sceneId, x013001_g_scriptId, "T読 h� ch遖 mu痭 b醝 s�",8,4)
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
	
	if	GetNumText()==3	then
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
				x013001_g_MenPai = GetMenPai(sceneId, selfId)
				if x013001_g_MenPai == 6 then
					BeginEvent(sceneId)
						AddText(sceneId, "Ng呓i l読 皙n 瘗a c⺶ v緄 ta r癷, ng呓i 疸 l� 甬 t� Thi阯 Long T�, c騨 b醝 s� g� n鎍")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					--Tr� v滴�9表示无门派
				elseif x013001_g_MenPai==9	then
					AddText(sceneId,"V b 馥u t� 疴y, ng呓i ch韓h l� 甬 t� c黙 Thi阯 Long T�")
					LuaFnJoinMenpai(sceneId, selfId, targetId, 6)

					-- 设置初始to� 鸬 Npc关系值
					CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

					-- 把相关to� 鸬 心法设置为10c别  37,40,41
					LuaFnSetXinFaLevel(sceneId,selfId,37,10)
					LuaFnSetXinFaLevel(sceneId,selfId,40,10)
					LuaFnSetXinFaLevel(sceneId,selfId,41,10)

					BeginEvent(sceneId)
						AddText(sceneId,"C醕 h� 疸 gia nh Thi阯 Long T�!");
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					--给玩家发信,告诉他到哪里打怪,怎样赚钱
					LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_5}" )
					--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_tianlong_0001}" )
					
					--门派奖励召集令
					for i=1, 20 do
						TryRecieveItem( sceneId, selfId, 30501001, 1 )
					end
					x013001_MsgBox( sceneId, selfId, "L 疬㧟 20 t Chi陁 t l畁h c黙 m鬾 ph醝" )


					if TryRecieveItem( sceneId, selfId, 10124008, 1 ) >= 0 then
						str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10124008 ).."."
						x013001_MsgBox( sceneId, selfId, str )
					end
				
					if	LuaFnGetSex( sceneId, selfId)==0	then
						LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh Thi阯 Long T�!",MSG2PLAYER_PARA)
						LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 166, 0)
						CallScriptFunction( 224900, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh Thi阯 Long T�!",MSG2PLAYER_PARA)
						LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 166, 0)
						CallScriptFunction( 224900, "OnDefaultEvent",sceneId, selfId, targetId )
					end
				else
					BeginEvent(sceneId)
						AddText(sceneId,"Ng呓i 疸 l� cao 甬 c黙 m鬾 ph醝 kh醕 r癷, Thi阯 Long T� c黙 ch鷑g ta nh�, l鄊 sao ch� 疬㧟 鹫i Ph nh� ng呓i")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
				end
			end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_tianlong_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "B眓 Qu醤 (97, 67) c� th� d誽 ng呓i k� n錸g chi猲 黏u c黙 m鬾 ph醝 ta. 詎g � ngay b阯 ta")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 97, 67, "B鋘 Qu醤" )
		return
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x013001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x013001_g_eventList do
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
function x013001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x013001_g_eventList do
		if missionScriptId == findId then
			x013001_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x013001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x013001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x013001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x013001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x013001_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x013001_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
