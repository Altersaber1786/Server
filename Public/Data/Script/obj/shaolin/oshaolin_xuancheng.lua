--ͭ���︱������npc

--�ű���
x009014_g_scriptId = 009014


--��ӵ��to� � �¼�ID�б�
x009014_g_eventList={220901}

--**********************************
--�¼��б�
--**********************************
function x009014_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." , Thi�u L�m t� c� аng Nh�n H�ng n�i danh thi�n h�, c�c h� c� mu�n th� th�ch b�n th�n kh�ng?")
		for i, findId in x009014_g_eventList do
			CallScriptFunction( x009014_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x009014_OnDefaultEvent( sceneId, selfId,targetId )
	x009014_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x009014_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x009014_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x009014_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009014_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x009014_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x009014_g_eventList do
		if missionScriptId == findId then
			x009014_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x009014_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009014_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x009014_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x009014_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x009014_OnDie( sceneId, selfId, killerId )
end