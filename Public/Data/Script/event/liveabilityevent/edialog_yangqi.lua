--�����
--����

--2006-9-18 17:05 (C�i n�y �ļ���T�i to� � ������ngΪ�˼��ݡ�����չ,��������to� � �ж�,��T�i ecity_lifeskillstudy.lua��ʵ��)
x713623_g_ScriptId 		= 713623
x713623_g_AbilityName	= "D��ng kh�"
x713623_g_AbilityID		= ABILITY_YANGQI

-- �����������to� � ѡ��
function x713623_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	if bid then
		if 0 == nNum then	--ѧϰ
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713623_g_AbilityID, bid, 4)
			local studyMsg = format("N�u c�c h� ��t t�i c�p %d, ph�i ti�u t�n #{_MONEY%d} v� %d �i�m bang h�i m�i c� th� h�c k� n�ng d��ng kh�. C�c h� c� quy�t �nh h�c kh�ng?", lv, money, con)
			AddText(sceneId,studyMsg)
			--X�c nh�nѧϰ��ť
					AddNumText(sceneId,x713623_g_ScriptId,"T�i h� x�c �nh mu�n h�c", 6, 3)
			--Hu� b�ѧϰ��ť
					AddNumText(sceneId,x713623_g_ScriptId,"T�i h� ch� mu�n coi", 8, 4)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 1 == nNum then	--��c�p
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713623_g_AbilityID, bid, 2)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713623_g_AbilityID, bid, 2)
			end
		elseif 2 == nNum then	--�˽�
			local dialog = "#{event_liveabilityevent_0032}"
			BeginEvent(sceneId)
				AddText(sceneId, dialog)
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
		elseif 3 == nNum then	--X�c nh�nѧϰ
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713623_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713623_g_AbilityID, bid, 1)
			end
		elseif 4 <= nNum then	--ֻ������
			CallScriptFunction( npcScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	else
		-- Ŀǰ�������ܱ���T�i Th�nh ph� �����ѧϰ����c�p���˽�
	end
end

-- �о�ѡ��
-- nNum == 1 ѧϰ
-- nNum == 2 ��c�p
-- nNum == 3 �˽�
function x713623_OnEnumerate( sceneId, selfId, targetId, bid, nNum)
	if bid then
		if 1 == nNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713623_g_AbilityID, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713623_g_ScriptId,"H�c "..x713623_g_AbilityName.." k� n�ng", 12, 0) end
			return
		elseif 2 == nNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713623_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713623_g_ScriptId,"Th�ng c�p"..x713623_g_AbilityName.." k� n�ng", 12, 1) end
			return
		elseif 3 == nNum then
			AddNumText(sceneId,x713623_g_ScriptId,"T�i h� mu�n t�m hi�u d��ng kh�",11,2)
			AddNumText(sceneId,x713623_g_ScriptId,"Quay l�i",8,5)
		end
	else
		-- Ŀǰ�������ܱ���T�i Th�nh ph� �����ѧϰ����c�p���˽�
	end
end