-- created by zchw 
-- 007113
-- ���� �ع�����ʹ

-- �ű���
x007113_g_scriptId = 007113

--**********************************
--�¼��������
--**********************************
function x007113_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		msg = "#{DG_8724_1}"
		AddText(sceneId,msg);
		AddNumText( sceneId, x007113_g_scriptId, "D�ch chuy�n �n T�n Ho�ng иa Cung", 9, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x007113_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 400, 227, 224)
	end
end
