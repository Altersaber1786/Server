--V� �angNPC
--����
--��ͨ

--�ű���
x012004_g_ScriptId = 012004

--��ӵ��to� � �¼�
estudy_daofa = 713536
elevelup_daofa = 713595
edialog_daofa = 713611
--��ӵ��to� � �¼�ID�б�
x012004_g_eventList={estudy_daofa,elevelup_daofa}	
--MessageNum = 1		--MessageNum��ng�Ի����,���ڵ��ò�ͬ�Ի�
--**********************************
--�¼��б�
--**********************************
function x012004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  K� n�ng c�a ta ch� d�y � t� b�n ph�i.")
	for i, eventId in x012004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x012004_g_ScriptId, "Gi�i thi�u ��o ph�p", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x012004_OnDefaultEvent( sceneId, selfId,targetId )
	x012004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x012004_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_036}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x012004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x012004_g_ScriptId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x012004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x012004_g_eventList do
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
--�ܾ���NPCto� � ����
--**********************************
function x012004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x012004_g_eventList do
		if missionScriptId == findId then
			x012004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x012004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x012004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x012004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x012004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x012004_OnDie( sceneId, selfId, killerId )
end
