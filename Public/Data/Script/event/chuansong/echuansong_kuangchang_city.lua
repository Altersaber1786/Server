-- Th�nh th����񸱱���Th�nh th�to� � ���� �i�m

x400800_g_ScriptId = 400800
x400800_g_ControlScript = 600004

-- ��ҽ��봫�� �i�m
function x400800_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400800_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400800_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400800_OnLeaveArea( sceneId, selfId )
	return
end