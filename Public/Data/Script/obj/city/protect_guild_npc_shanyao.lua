--��������פ��
--��ͨ

--�ű���
x805040_g_ScriptId	= 805040

--��ӵ��to� � �¼�ID�б�
x805040_g_EventList	= { 805042 }


--��ȡ����to� � ��͵�c�p
x805040_g_minLevel			= 20

--**********************************
--�¼��б�
--**********************************
function x805040_UpdateEventList( sceneId, selfId, targetId )

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)
	
	if Humanguildid ~= cityguildid then
		BeginEvent( sceneId )
			AddText( sceneId, "#{SYDH_81016_01}" )
			AddNumText( sceneId, 805042, "V� b�o h� bang h�i" ,11 ,2)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	CallScriptFunction( x805040_g_EventList[1], "OnEnumerate", sceneId, selfId, targetId )
	
end

--**********************************
--�¼��������
--**********************************
function x805040_OnDefaultEvent( sceneId, selfId, targetId )
	x805040_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x805040_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x805040_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x805040_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x805040_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x805040_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x805040_g_EventList do
		if missionScriptId == findId then
			x805040_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--����(�Ѿ���������)
--**********************************
function x805040_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x805040_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--�ύ������to� � ����
--**********************************
function x805040_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x805040_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--�����¼�
--**********************************
function x805040_OnDie( sceneId, selfId, killerId )
end