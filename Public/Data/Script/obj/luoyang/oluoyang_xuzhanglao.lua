--L誧 D呓ngNPC
--徐长老
--普通

--脚本号
x000021_g_scriptId = 000021

--所拥有to� 鸬 事件ID列表
x000021_g_eventList={200020, 200022, 200023, 200086, 200087, 200088, 200089, 200090}

--**********************************
--事件列表
--**********************************
function x000021_UpdateEventList( sceneId, selfId,targetId )
  local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng"
	else
		PlayerSex = " c醕 h�"
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,"  姓i h礽 � H課h L鈓 c黙 C醝 Bang s tri畊 t, 皙n l鷆 痼 t読 h� s� tuy阯 b� v緄 m鱥 ng叨i m祎 vi甤 quan tr鱪g "..PlayerName..PlayerSex..", n猽 c� th秈 gian h銀 皙n tham d�!")
		for i, eventId in x000021_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000021_OnDefaultEvent( sceneId, selfId,targetId )
	x000021_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000021_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000021_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000021_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000021_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
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
function x000021_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000021_g_eventList do
		if missionScriptId == findId then
			x000021_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x000021_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000021_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000021_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000021_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000021_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000021_OnDie( sceneId, selfId, killerId )
end
