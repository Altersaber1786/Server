--����ӯ��

--�ű���
x022002_g_scriptId = 022002

--��ӵ��to� � �¼�ID�б�
x022002_g_eventList={}--211305	

--**********************************
--�¼��б�
--**********************************
function x022002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  V� anh h�ng d�ng c�m, v� ��i, hi�n l߽ng, nhi�t huy�t! C�c h� l�i �n b� l�c Ho�n Nhan r�i �, mau ng�i xu�ng u�ng 1 ly s�a d� n�o.")
	for i, eventId in x022002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x022002_OnDefaultEvent( sceneId, selfId,targetId )
	x022002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x022002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x022002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022002_g_eventList do
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
function x022002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x022002_g_eventList do
		if missionScriptId == findId then
			x022002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x022002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x022002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x022002_OnDie( sceneId, selfId, killerId )
end
