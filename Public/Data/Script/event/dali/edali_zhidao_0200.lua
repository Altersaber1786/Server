--��������
--����ʦѰ������
--MisDescBegin
--�ű���
x210200_g_ScriptId = 210200

--Ti�p th�����NPC����
x210200_g_Position_X=341
x210200_g_Position_Z=221
x210200_g_SceneID=2
x210200_g_AccomplishNPC_Name="B� L߽ng"

--�����
x210200_g_MissionId = 440

--��m�t c�i����to� � ID
--g_MissionIdPre = 

--Ŀ��NPC
x210200_g_Name	="B� L߽ng"

--�������
x210200_g_MissionKind = 13

--��ng c�p nhi�m v� 
x210200_g_MissionLevel = 1

--��ng����ngTinhӢ����
x210200_g_IfMissionElite = 0

--������
x210200_g_MissionName="Thanh v� kh� th� nh�t"
x210200_g_MissionInfo_1="  ��y kh�ng ph�i l� #R"
x210200_g_MissionInfo_2="#{event_dali_0001}" --Ӧ����������to� � ����ǰ���μ����ִ��.
x210200_g_MissionTarget="#{xinshou_001}"
x210200_g_MissionComplete="#{event_dali_0002}"
x210200_g_MoneyBonus=10
x210200_g_SignPost = {x = 341, z = 221, tip = "B� L߽ng"}

x210200_g_ItemBonus={id=30101001, num=10}
x210200_g_RadioItemBonus={{id=10101000 ,num=1},{id=10102000,num=1},{id=10104000,num=1},{id=10103000,num=1}}

x210200_g_Custom	= { {id="�� t�m th�y Ph� L߽ng",num=1} }
x210200_g_IsMissionOkFail = 1		--����to� � ��0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210200_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ�C�i n�y ����
    if (IsMissionHaveDone(sceneId,selfId,x210200_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210200_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210200_g_Name then
			x210200_OnContinue( sceneId, selfId, targetId )
		end
    --Th�a m�n�����������
    elseif x210200_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210200_g_Name then
			--��������Ti�p th�ʱ��ʾto� � ��Ϣ
				local  PlayerName=GetName(sceneId,selfId)	
	            local  PlayerSex=GetSex(sceneId,selfId)
	            if PlayerSex == 0 then
		            PlayerSex = " c� n߽ng "
	            else
		            PlayerSex = " c�c h� "
	            end
			BeginEvent(sceneId)
				AddText(sceneId,x210200_g_MissionName)
				AddText(sceneId,x210200_g_MissionInfo_1..PlayerName..PlayerSex..x210200_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210200_g_MissionTarget)
				AddItemDemand( sceneId, 30101001, 10 )
				
				for i, item in x210200_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				
				AddMoneyBonus( sceneId, x210200_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210200_g_ScriptId,x210200_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210200_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ�C�i n�y ����
	if IsMissionHaveDone(sceneId,selfId,x210200_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x210200_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210200_g_Name then
			AddNumText(sceneId, x210200_g_ScriptId,x210200_g_MissionName,2,-1);
		end
	--Th�a m�n�����������
	elseif x210200_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210200_g_Name then
			AddNumText(sceneId,x210200_g_ScriptId,x210200_g_MissionName,1,-1);
		end
    end
end

--**********************************
--���Ti�p th�����
--**********************************
function x210200_CheckAccept( sceneId, selfId )
	--C�n 1c�p���ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti�p th�
--**********************************
function x210200_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210200_g_MissionId, x210200_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�#W: V� kh� �u ti�n",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210200_g_SignPost.x, x210200_g_SignPost.z, x210200_g_SignPost.tip )

	-- ����������ɱ�־
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210200_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

end

--**********************************
--����
--**********************************
function x210200_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
    DelMission( sceneId, selfId, x210200_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210200_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210200_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱto� � � �i�m���Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210200_g_MissionName)
		AddText(sceneId,x210200_g_MissionComplete)
		AddMoneyBonus( sceneId, x210200_g_MoneyBonus )
		AddItemDemand( sceneId, 30101001, 10 )
		
		for i, item in x210200_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210200_g_ScriptId,x210200_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x210200_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210200_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210200_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210200_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210200_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
			AddItem( sceneId,30101001, 10 )
			
		ret = EndAddItem(sceneId,selfId)
		--����������
		if ret > 0 then
			AddMoney(sceneId,selfId,x210200_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 10)
			
			ret = DelMission( sceneId, selfId, x210200_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210200_g_MissionId )
				--�۳�������Ʒ
				--for i, item in g_DemandItem do
				--	DelItem( sceneId, selfId, item.id, item.num )
				--end
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#YHo�n t�t nhi�m v�#W: V� kh� �u ti�n",MSG2PLAYER_PARA )
				CallScriptFunction( 210201, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		else
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "Kh�ng th� Ho�n t�t nhi�m v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210200_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210200_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210200_OnItemChanged( sceneId, selfId, itemdataId )
end
