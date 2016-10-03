--ˮ�θ�������npc

--�ű���
x000089_g_scriptId = 000090


--��ӵ��to� � �¼�ID�б�
x000089_g_eventList={231000}

--**********************************
--�¼��б�
--**********************************
function x000089_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName..", t�i ��y. \n")
		for i, findId in x000089_g_eventList do
			CallScriptFunction( x000089_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000089_OnDefaultEvent( sceneId, selfId, targetId )
------------------------------------------------------
--[Nov.1 2006]Lybin Close
--x000089_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  C�c h� mau �n B�ch M� t�, Tr� Thanh ��i s� �ang r�t n�ng l�ng g�p c�c h� ��! Ta m�y h�m nay vi�c qu� b�n, ��i ta b�nh �nh xong lo�n ��ng � Th�y lao, nh�t �nh s� �n B�ch M� t� quy�n t� cho d�n t� n�n" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
------------------------------------------------------
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x000089_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000089_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x000089_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x000089_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			x000089_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x000089_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x000089_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000089_OnDie( sceneId, selfId, killerId )
end