--��������
--����ʦѰ�Ҷ�����
--MisDescBegin
--�ű���
x210225_g_ScriptId = 210225

--Ti�p th�����NPC����
x210225_g_Position_X=214.8831
x210225_g_Position_Z=283.8709
x210225_g_SceneID=2
x210225_g_AccomplishNPC_Name="�o�n Di�n Kh�nh"

--�����
x210225_g_MissionId = 705

--��m�t c�i����to� � ID
x210225_g_MissionIdPre = 704

--Ŀ��NPC
x210225_g_Name	="�o�n Di�n Kh�nh"

--�������
x210225_g_MissionKind = 13

--��ng c�p nhi�m v� 
x210225_g_MissionLevel = 9

--��ng����ngTinhӢ����
x210225_g_IfMissionElite = 0

--������
x210225_g_MissionName="�o�n Di�n Kh�nh"
x210225_g_MissionInfo="#{event_dali_0035}"
x210225_g_MissionTarget="� #Gh�m Ng�c Nh� ph�a ��ng Nam th�nh ��i L�#W t�m #R�o�n Di�n Kh�nh#W#{_INFOAIM215,284,2, �o�n Di�n Kh�nh}. "
x210225_g_MissionComplete="#{event_dali_0036}"
x210225_g_MoneyBonus=72
x210225_g_SignPost = {x = 215, z = 284, tip = "�o�n Di�n Kh�nh"}

x210225_g_Custom	= { {id="�� t�m ���c �o�n Di�n Kh�nh",num=1} }
x210225_g_IsMissionOkFail = 1		--����to� � ��0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210225_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ�C�i n�y ����
    if (IsMissionHaveDone(sceneId,selfId,x210225_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210225_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210225_g_Name then
			x210225_OnContinue( sceneId, selfId, targetId )
		end
    --Th�a m�n�����������
    elseif x210225_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210225_g_Name then
			--��������Ti�p th�ʱ��ʾto� � ��Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210225_g_MissionName)
				AddText(sceneId,x210225_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210225_g_MissionTarget)
				AddMoneyBonus( sceneId, x210225_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210225_g_ScriptId,x210225_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210225_OnEnumerate( sceneId, selfId, targetId )
    --�����m�t �δ�����m�t c�i����
    if 	IsMissionHaveDone(sceneId,selfId,x210225_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ�C�i n�y ����
    if IsMissionHaveDone(sceneId,selfId,x210225_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210225_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210225_g_Name then
			AddNumText(sceneId, x210225_g_ScriptId,x210225_g_MissionName,2,-1);
		end
    --Th�a m�n�����������
    elseif x210225_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210225_g_Name then
			AddNumText(sceneId,x210225_g_ScriptId,x210225_g_MissionName,1,-1);
		end
    end
end

--**********************************
--���Ti�p th�����
--**********************************
function x210225_CheckAccept( sceneId, selfId )
	--C�n 8c�p���ܽ�
	if GetLevel( sceneId, selfId ) >= 8 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti�p th�
--**********************************
function x210225_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210225_g_MissionId, x210225_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�#W: �o�n Di�n Kh�nh",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210225_g_SignPost.x, x210225_g_SignPost.z, x210225_g_SignPost.tip )

	-- ����������ɱ�־
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210225_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x210225_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
    DelMission( sceneId, selfId, x210225_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210225_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210225_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱto� � � �i�m���Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210225_g_MissionName)
		AddText(sceneId,x210225_g_MissionComplete)
		AddMoneyBonus( sceneId, x210225_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210225_g_ScriptId,x210225_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x210225_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210225_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210225_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210225_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--����������
		AddMoney(sceneId,selfId,x210225_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,100)
		DelMission( sceneId,selfId,  x210225_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210225_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo�n t�t nhi�m v�#W: �o�n Di�n Kh�nh",MSG2PLAYER_PARA )
		CallScriptFunction( 210226, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210225_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210225_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210225_OnItemChanged( sceneId, selfId, itemdataId )
end