--Th�c H� C� Tr�nNPC
--��ϼ��
--��ͨ

x001171_g_ScriptId	= 001171

x001171_g_Yinpiao = 40002000

x001171_g_Impact_NotTransportList = { 5929, 5944 } -- ��ֹ����to� � Impact
x001171_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ��ֹ����to� � Impact��ʾ��Ϣ

--������Ϣ(��������,SceneID,PosX,PosY,����ID)
x001171_g_mpInfo		= {}
x001171_g_mpInfo[0]	= { "Tinh T�c", 16,  96, 152, MP_XINGSU }
x001171_g_mpInfo[1]	= { "Ti�u Dao", 14,  67, 145, MP_XIAOYAO }
x001171_g_mpInfo[2]	= { "Thi�u L�m",  9,  96, 127, MP_SHAOLIN }
x001171_g_mpInfo[3]	= { "Thi�n S�n", 17,  95, 120, MP_TIANSHAN }
x001171_g_mpInfo[4]	= { "Thi�n Long", 13,  96, 120, MP_DALI }
x001171_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x001171_g_mpInfo[6]	= { "V� �ang", 12, 103, 140, MP_WUDANG }
x001171_g_mpInfo[7]	= { "Minh Gi�o", 11,  98, 167, MP_MINGJIAO }
x001171_g_mpInfo[8]	= { "C�i Bang", 10,  91, 116, MP_GAIBANG }

x001171_g_MsgInfo = { "#{SHGZ_001}",
											"#{SHGZ_0620_01}",
											"#{SHGZ_0620_02}",
											"#{SHGZ_0620_03}",
										}

--**********************************
--�¼��������
--**********************************
function x001171_OnDefaultEvent( sceneId, selfId, targetId )

	-- ������������ng����ng�С���Ʊ��C�i n�y ����,�оͲ���ʹ������to� � ����
	if GetItemCount(sceneId, selfId, x001171_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin th� l�i tr�n ng߶i c�c h� �ang gi� ng�n phi�u ta kh�ng th� gi�p ���c." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	BeginEvent( sceneId )
	
		local msgidx = random(getn(x001171_g_MsgInfo))
		AddText( sceneId, x001171_g_MsgInfo[msgidx] )
		AddNumText( sceneId, x001171_g_ScriptId, "Quay v� m�n ph�i", 9, 1000 )
		AddNumText( sceneId, x001171_g_ScriptId, "Th�nh Th� - L�c D߽ng", 9, 1001 )
		AddNumText( sceneId, x001171_g_ScriptId, "Th�nh Th� - T� Ch�u", 9, 1002 )
		AddNumText( sceneId, x001171_g_ScriptId, "Th�nh Th� - ��i L�", 9, 1003 )
		AddNumText( sceneId, x001171_g_ScriptId, "Th�nh Th� - L�c D߽ng - C�u Ch�u th߽ng h�i", 9, 1006 )
		AddNumText( sceneId, x001171_g_ScriptId, "Th�nh Th� - T� Ch�u - Thi�t T��ng Ph�", 9, 1007 )
		AddNumText( sceneId, x001171_g_ScriptId, "Th�nh Th� - L�u Lan", 9, 1008 )
		
		AddNumText( sceneId, x001171_g_ScriptId, "��a ta �n c�c m�n ph�i kh�c", 9, 1011 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x001171_OnEventRequest( sceneId, selfId, targetId, eventId )
	--�������
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x001171_MsgBox( sceneId, selfId, targetId, "  Trong �i ng� c�a c�c h� c� ng߶i �ang l�m nhi�m v� v�n chuy�n, th߽ng nh�n ta kh�ng th� cung c�p d�ch v� cho c�c h� ���c." )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x001171_MsgBox( sceneId, selfId, targetId, "  Xin th� l�i! C�c h� �ang mang trong m�nh nhi�m v� v�n chuy�n, th߽ng nh�n ta kh�ng th� cung c�p d�ch v� cho c�c h�." )
		return
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x001171_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x001171_MsgBox( sceneId, selfId, targetId, x001171_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end
	
	--˳������
	local	arg	= GetNumText()

	local	mp
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--Tr� v�����
		if id < 0 or id >= 9 then
			x001171_MsgBox( sceneId, selfId, targetId, "  C�c h� ch�a gia nh�p m�n ph�i n�o." )
		else
			mp	= x001171_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	
	if arg == 1001 then		--L�c D߽ng
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183, 20 )
		return
	end
	if arg == 1002 then		--T� Ch�u
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114, 162, 20 )
		return
	end
	
	if arg == 1003 then		--��i L�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 141, 20 )
		return
	end
	
	if arg == 1006 then		--L�c D߽ng�̻�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 234, 132, 20 )
		return
	end
	if arg == 1007 then		--T� Ch�u������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 235, 132, 20 )
		return
	end
	
	if arg == 1008 then		--L�u Lan
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
		return
	end

	if arg == 1011 then		
		BeginEvent( sceneId )
			for i, mp in x001171_g_mpInfo do
				AddNumText( sceneId, x001171_g_ScriptId, "M�n ph�i - "..mp[1], 9, i )
			end
			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	
	--����....
	for i, mp in x001171_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x001171_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x001171_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x001171_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end
