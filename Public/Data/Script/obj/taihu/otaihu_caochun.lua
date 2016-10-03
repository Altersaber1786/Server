--Th�i H� �ܴ�

--�ű���
x004003_g_scriptId = 004003

--��ӵ��to� � �¼�ID�б�
x004003_g_eventList={}	--210404,210403

--**********************************
--�¼��б�
--**********************************
function x004003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	
	local IsDone474 = IsMissionHaveDone(sceneId,selfId,474)
	
		
	
	if(IsDone474 == 0) then	
		AddText(sceneId,  "Th�n th� c�a ta r�t b� m�t, hi�m ng߶i bi�t.")	
	end
	
	for i, eventId in x004003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x004003_OnDefaultEvent( sceneId, selfId,targetId )
	x004003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x004003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x004003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x004003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x004003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x004003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x004003_g_eventList do
		if missionScriptId == findId then
			x004003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x004003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x004003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x004003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x004003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x004003_OnDie( sceneId, selfId, killerId )
end
