--H� t�ng����(������m�t ���Ͷ�ʹ��C�i n�y LUA,�޸���ע��ͨ����)

--����η����б�_MissType	1.ɱ������	2.��������	3.̽������	4.Ѱ������	5.H� t�ng����
x006671_g_MissionTypeList	=	{ {StartIdx = 1000000, EndIdx = 1009999, ScriptId = 006666},
															{StartIdx = 1010000, EndIdx = 1019999, ScriptId = 006668},
															{StartIdx = 1020000, EndIdx = 1029999, ScriptId = 006669},
															{StartIdx = 1030000, EndIdx = 1039999, ScriptId = 006667},
															{StartIdx = 1050000, EndIdx = 1059999, ScriptId = 006671} }

function x006671_DisplayBonus(sceneId, missionIndex)
	local itemCt
	local a = {{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0}}
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetAwardItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetRadioItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddRadioItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct = TGetHideItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddRandItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	local awardMoney = TGetAwardMoney(missionIndex)
	AddMoneyBonus( sceneId, awardMoney)
end
--**********************************
--������ں���
--**********************************
function x006671_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	-- �i�m���������ִ�д˽ű�
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)-- �i�m������T�i 20c�i������to� � ���к�

	local missionTarget, missionInfo, missionContinue, missionComplete = TGetMissionDesc(missionIndex)
	
	if IsHaveMission(sceneId,selfId,missionId) > 0 then
		if GetNumText() == 3 then
			--���ѡ��to� � ������ngҪH� t�ngto� � npc
			local x, z = GetWorldPos(sceneId,targetId)--��¼npcto� � ����
			SetMissionByIndex(sceneId,selfId,misIndex,7,sceneId) --ʼ���Ե�ǰ����Ϊ׼
			SetMissionByIndex(sceneId,selfId,misIndex,1,0) --������
			SetMissionByIndex(sceneId,selfId,misIndex,2,targetId)
			SetMissionByIndex(sceneId,selfId,misIndex,3,x)
			SetMissionByIndex(sceneId,selfId,misIndex,4,z)

      --*********************************************************************	
      -- npc��Ч�Լ��
   		local targetNpcScene, targetNpcName = TGetTargetNpcInfo(missionIndex)
			local targetName = GetName(sceneId, targetId)
			if targetNpcScene ~= sceneId 
			 or targetNpcName ~= targetName then
			 -- ��npc����ngҪ����to� � npc
			 return 0
			end
			-- ��ȡ����ǰto� � ������Ϣ
			local oldAIType = GetNPCAIType(sceneId, targetId)
			local oldUnitReputationId = GetUnitReputationID(sceneId, selfId, targetId)
			-- ����npcѲ�߿�ʼto� � ����
			local patrolPathIndex = TGetHusongPatrolPath(missionIndex)		--  �i�m��H� t�ngѲ��·��
			SetUnitReputationID(sceneId, selfId, targetId, 0) --0Ϊ������Ӫ,������Ѻ�
			SetMonsterFightWithNpcFlag(sceneId, targetId, 1) --����������͹�����to� � ���
			SetNPCAIType(sceneId, targetId, TGetHusongAIType(missionIndex))
			SetPatrolId(sceneId, targetId, patrolPathIndex)
		  --����npcѲ�߽���to� � ����
      AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetPatrolID", -1) 
      AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetBaseAIType", 0, -1, oldAIType) 
      AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetReputationID_CodingRefix", oldUnitReputationId) 
      AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetMonsterFightWithNpcFlag", 0)
			--*********************************************************************
			
			--����������to� � ����ʱ����
			StartMissionTimer(sceneId, selfId, missionId)
			SetMissionEvent(sceneId, selfId, missionId, 5)
			SetMissionEvent(sceneId, selfId, missionId, 6)
		end
		BeginEvent(sceneId)
			AddText(sceneId, missionName)
			AddText(sceneId, missionContinue)
		EndEvent( )
		local bDone = x006671_CheckSubmit( sceneId, selfId, missionIndex )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,missionIndex,missionId,bDone)
	elseif x006671_CheckAccept(sceneId,selfId,missionIndex) > 0 then
		local targetscene, targetname = TGetTargetNpcInfo(missionIndex)
		local monsterId = GetMonsterIdByName(sceneId, targetname)
		local targetx, targetz = GetWorldPos(sceneId, monsterId)
		local respawnx, rewpawnz = GetMonsterRespawnPos(sceneId, monsterId)
		local distSqr = (targetx-respawnx)*(targetx-respawnx) + (targetz-rewpawnz)*(targetz-rewpawnz)
		if distSqr > 2.0 then
			BeginEvent(sceneId)
				AddText(sceneId, missionName)
				AddText(sceneId, "M�c ti�u �� b� k� kh�c h� t�ng v�")
			EndEvent( )
			DispatchEventList(sceneId, selfId, targetId)			
		else	
			BeginEvent(sceneId)
				AddText(sceneId, missionName)
				AddText(sceneId, missionInfo)
				x006671_DisplayBonus(sceneId, missionIndex)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,missionIndex,missionId)
		end
	end	
end

--**********************************
--�о��¼�
--**********************************
function x006671_OnEnumerate( sceneId, selfId, targetId, missionIndex )
	--��������ɹ�C�i n�y ����
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	
	-- �ж����to� � ������ng����ng��Ti�p th�C�i n�y ����,���������ʾ,�����Ͳ���ʾ
	local nLevel,nMis1,nMis2,nMis3 = TGetCheckInfo(missionIndex)
	
	
	if nLevel > GetLevel(sceneId, selfId)  then
		return
	end
	
	if nMis1 > 0   then
		-- ���ǰ������1û�����,��Tr� v�
		if IsMissionHaveDone(sceneId, selfId, nMis1) <= 0   then
			return
		end
	end
	
	if nMis2 > 0   then
		-- ���ǰ������2û�����,��Tr� v�
		if IsMissionHaveDone(sceneId, selfId, nMis2) <= 0   then
			return
		end
	end
	
	if nMis3 > 0   then
		-- ���ǰ������3û�����,��Tr� v�
		if IsMissionHaveDone(sceneId, selfId, nMis3) <= 0   then
			return
		end
	end

	-- ����������Ѿ����,��Tr� v�
	if IsMissionHaveDone(sceneId, selfId, missionId) > 0 then
   	return
	--Th�a m�n�����������
	elseif IsHaveMission(sceneId, selfId, missionId) > 0 then
		local completeNpcScene, completeNpcName = TGetCompleteNpcInfo(missionIndex)
		if GetName(sceneId, targetId) == completeNpcName then
			--TBeginEvent(sceneId)
				TAddNumText(sceneId, missionIndex, missionName,1,-1);
			--TEndEvent()	
			TDispatchEventList(sceneId, selfId, targetId)
		end
	--Th�a m�n�����������
  elseif x006671_CheckAccept(sceneId, selfId, missionIndex) > 0 then
  	local acceptNpcScene, acceptNpcName = TGetAcceptNpcInfo(missionIndex)
		if GetName(sceneId, targetId) == acceptNpcName then
			--TBeginEvent(sceneId)
				TAddNumText(sceneId, missionIndex, missionName,1,-1);
			--TEndEvent()
			TDispatchEventList(sceneId, selfId, targetId)	
		end
  end
  
end

--**********************************
-- 
--**********************************
function x006671_OnLockedTarget( sceneId, selfId, targetId, missionIndex )
 	local missionId = TGetMissionIdByIndex(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)-- �i�m������T�i 20c�i������to� � ���к�
	local missionName = TGetMissionName(missionIndex)
	
	local nscene1, name1 = TGetCompleteNpcInfo(missionIndex)
	local nscene2, name2 = TGetTargetNpcInfo(missionIndex)
	local targetName = GetName(sceneId, targetId)
	if targetName == name1 then
		--���ѡ��to� � ������ng������to� � npc
		TAddNumText(sceneId, missionIndex, missionName,1,-1);
	elseif targetName == name2 then
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 then --��������Ѿ������ֱ��Tr� v�
			return
		end
		if GetPatrolId(sceneId, targetId) ~= -1 then
			return
		end

		--���ѡ��to� � ������ngҪH� t�ngto� � npc
		TAddNumText(sceneId, missionIndex, missionName,1,3);
	end
end

--**********************************
--���Ti�p th�����
--**********************************
function x006671_CheckAccept( sceneId, selfId, missionIndex )
	local nLevel = LuaFnGetLevel(sceneId, selfId)
	local limitLevel, PreMisId1, PreMisId2, PreMisId3 = TGetCheckInfo(missionIndex)

	if nLevel < limitLevel then
		--TBeginEvent(sceneId)
			TAddText(sceneId, "Kinh nghi�m giang h� c�a c�c h�, s� kh�ng chi�n th�ng ���c, ��i".. tostring(limitLevel) .."Sau khi th�ng c�p t�i t�m ta")
		--TEndEvent()
		TDispatchEventList(sceneId, selfId)
		return 0
	else
		local a = {}
		local index = 1
		if PreMisId1 > 0 then
			a[index] = PreMisId1
			index = index + 1
		end
		if PreMisId2 > 0 then
			a[index] = PreMisId2
			index = index + 1
		end
		if PreMisId3 > 0 then
			a[index] = PreMisId3
			index = index + 1
		end
		
		for i, v in a do
			if IsMissionHaveDone(sceneId, selfId, v) <= 0 then
				return 0
			end	
		end
		return 1
		
	end

end

--**********************************
--Ti�p th�
--**********************************
function x006671_OnAccept( sceneId, selfId, targetId, missionIndex )

	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	-- ��������ng����ng�Ѿ���ɹ�C�i n�y ����
	if IsMissionHaveDone(sceneId, selfId, missionId) > 0   then
		return
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, missionId, missionIndex, 0, 0, 0 )
	
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh�t k� nhi�m v� c�a c�c h� �� �y" , MSG2PLAYER_PARA )
		return
	end
	
	--���������������to� � ������ź�����λ��
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)-- �i�m������T�i 20c�i������to� � ���к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0) --�������кŰ��������to� � ��m�t λ��0	��m�t λ��ng���/Th�nh c�ng���
	SetMissionByIndex(sceneId,selfId,misIndex,1,0) --ʼ���Ե�ǰ����Ϊ׼

	local nscene1, name1 = TGetAcceptNpcInfo(missionIndex)
	local nscene2, name2 = TGetCompleteNpcInfo(missionIndex)
	local nscene3, name3 = TGetTargetNpcInfo(missionIndex)
	-- ���������to� � �˲���ng������to� � �˻�ҪH� t�ngto� � ��
	if name1 ~= name2  or name1 ~= name3 then
		SetMissionEvent(sceneId, selfId, missionId, 4)
	end	

	if name1 == name3 then
		local x, z = GetWorldPos(sceneId,targetId)--��¼npcto� � ����
		SetMissionByIndex(sceneId,selfId,misIndex,7,sceneId) --ʼ���Ե�ǰ����Ϊ׼
		SetMissionByIndex(sceneId,selfId,misIndex,2,targetId)
		SetMissionByIndex(sceneId,selfId,misIndex,3,x)
		SetMissionByIndex(sceneId,selfId,misIndex,4,z)
		
    --*********************************************************************	
    -- npc��Ч�Լ��	
		local targetNpcScene, targetNpcName = TGetTargetNpcInfo(missionIndex)
		local targetName = GetName(sceneId, targetId)
		if targetNpcScene~= sceneId 
		 or targetNpcName ~= targetName then
		 -- ��npc����ngҪ����to� � npc
		 return 0
		end
		-- ��ȡ����ǰto� � ������Ϣ
		local oldAIType = GetNPCAIType(sceneId, targetId)
		local oldUnitReputationId = GetUnitReputationID(sceneId, selfId, targetId)
		-- ����npcѲ�߿�ʼto� � ����
		local patrolPathIndex = TGetHusongPatrolPath(missionIndex)		--  �i�m��H� t�ngѲ��·��
		SetUnitReputationID(sceneId, selfId, targetId, 0) --0Ϊ������Ӫ,������Ѻ�
		SetMonsterFightWithNpcFlag(sceneId, targetId, 1) --����������͹�����to� � ���
		SetNPCAIType(sceneId, targetId, TGetHusongAIType(missionIndex))
		SetPatrolId(sceneId, targetId, patrolPathIndex)
	  --����npcѲ�߽���to� � ����
    AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetPatrolID", -1) 
    AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetBaseAIType", 0, -1, oldAIType) 
    AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetReputationID_CodingRefix", oldUnitReputationId) 
    AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetMonsterFightWithNpcFlag", 0)
		--*********************************************************************
	
		--����������to� � ����ʱ����
		StartMissionTimer(sceneId, selfId, missionId)
		SetMissionEvent(sceneId, selfId, missionId, 5)
		SetMissionEvent(sceneId, selfId, missionId, 6)
	end
	
	Msg2Player(  sceneId, selfId,"#YTi�p nh�n #W" .. tostring(missionName), MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#YTi�p nh�n#W " .. tostring(missionName)
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--����
--**********************************
function x006671_OnAbandon( sceneId, selfId, missionIndex )
  --��H� t�ngnpc˲�ƻ�ԭ��λ��
 	local missionId = TGetMissionIdByIndex(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)-- �i�m������T�i 20c�i������to� � ���к�
	
	local targetScene = GetMissionParam(sceneId, selfId, misIndex, 7)
	local targetId = GetMissionParam(sceneId, selfId, misIndex, 2)
	local x = GetMissionParam(sceneId, selfId, misIndex, 3)
	local z = GetMissionParam(sceneId, selfId, misIndex, 4)
	
  --ֹͣ������to� � ����ʱ����
  StopMissionTimer(sceneId, selfId, missionId)
  --ResetMissionEvent(sceneId, selfId, missionId, 4)
  --ResetMissionEvent(sceneId, selfId, missionId, 5)
  --ResetMissionEvent(sceneId, selfId, missionId, 6)

  DelMission(sceneId, selfId, missionId)
  
end

--**********************************
--����
--**********************************
function x006671_OnContinue( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	
	local missionTarget
	local missionInfo
	local missionContinue
	local missionComplete 
	missionTarget, missionInfo, missionContinue, missionComplete = TGetMissionDesc(missionIndex)
	
	BeginEvent(sceneId)
	
		AddText(sceneId,missionName)
		AddText(sceneId,missionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,missionTarget)

		x006671_DisplayBonus(sceneId, missionIndex)  
		
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, missionIndex, missionId)

end

--**********************************
--�����ng������ύ
--**********************************
function x006671_CheckSubmit( sceneId, selfId, missionIndex )
	--��C�i n�y ��������ɱ�־�Ѿ�����λ
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
	
end

--**********************************
--�ύ
--**********************************
function x006671_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	-- �����ng����ngTh�a m�nHo�n t�t nhi�m v�to� � ����
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	
	if x006671_CheckSubmit(sceneId, selfId, missionIndex) <= 0   then
		return
	end

	if IsHaveMission(sceneId,selfId,missionId) > 0 then
		local nAddItemNum = 0;
		BeginAddItem(sceneId)
			local itemCt
			local a = {{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},} 
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetAwardItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
				end
			end
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetRadioItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 and a[i].id == selectRadioId then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
					break
				end
			end
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetHideItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
				end
			end
		local ret = EndAddItem(sceneId,selfId)
		
		if ret > 0 then
		
			if nAddItemNum > 0  then
				AddItemListToHuman(sceneId,selfId)
			end
			
			--����������
			local awardMoney = TGetAwardMoney(missionIndex)
			AddMoney(sceneId,selfId,awardMoney )
			local awardExp = TGetAwardExp(missionIndex)
			LuaFnAddExp( sceneId, selfId, awardExp)
			
			DelMission( sceneId,selfId, missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId, missionId )
			
			local strText = "#Y" .. missionName .. " nhi�m v� �� ho�n th�nh"
			BeginEvent( sceneId )
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

			--  ��t ���c��������to� � Index
			local NextMissIndex = GetNextMissionIndex( missionIndex )

			for i, MissType in x006671_g_MissionTypeList do
				if MissType.ScriptId ~= nil and MissType.ScriptId ~= 0 then
					if NextMissIndex ~= 0 and NextMissIndex >= MissType.StartIdx and NextMissIndex <= MissType.EndIdx then
						local missionId = TGetMissionIdByIndex( NextMissIndex )
						local szNpcName = GetName( sceneId, targetId )
						local AcceptNpcScene, AcceptNpcName = TGetAcceptNpcInfo( NextMissIndex )

						if sceneId == AcceptNpcScene and szNpcName == AcceptNpcName then
							if MissType.ScriptId == 006671 then
								if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
									x006671_OnDefaultEvent( sceneId, selfId, targetId, NextMissIndex )
								end
							else
								if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
									CallScriptFunction( MissType.ScriptId, "OnDefaultEvent", sceneId, selfId, targetId, NextMissIndex )
								end
							end
						end
						
						break;
					end
				end
			end

		else
			--������û�м�Th�t b�i
			BeginEvent(sceneId)
				AddText(sceneId, "Kh�ng th� Ho�n t�t nhi�m v�");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		end
	end	
end

function x006671_OnHumanDie(sceneId, selfId, missionIndex)
	--��������ʱͬ������Th�nh c�ng
	local missionId = TGetMissionIdByIndex(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)-- �i�m������T�i 20c�i������to� � ���к�
	local targetScene = GetMissionParam(sceneId, selfId, misIndex, 7)
	local targetId = GetMissionParam(sceneId, selfId, misIndex, 2)
	local x = GetMissionParam(sceneId, selfId, misIndex, 3)
	local z = GetMissionParam(sceneId, selfId, misIndex, 4)

  --ֹͣ������to� � ����ʱ����
  StopMissionTimer(sceneId, selfId, missionId)
  SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)
  ResetMissionEvent(sceneId, selfId, missionId, 4)
  ResetMissionEvent(sceneId, selfId, missionId, 5)
  ResetMissionEvent(sceneId, selfId, missionId, 6)
  
	local targetscene, targetname = TGetTargetNpcInfo(missionIndex)
  BeginEvent(sceneId)
  	AddText(sceneId, "H� t�ng " .. targetname .. " Th�t b�i")
  EndEvent()
  DispatchMissionTips(sceneId, selfId)

end

--**********************************
--��ʱ�¼�
--**********************************
function x006671_OnTimer(sceneId,selfId,missionIndex)
	local playerX, playerZ = GetWorldPos(sceneId, selfId)
	local missionId = TGetMissionIdByIndex(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)-- �i�m������T�i 20c�i������to� � ���к�
	local targetScene = GetMissionParam(sceneId, selfId, misIndex, 7)
	local targetId = GetMissionParam(sceneId, selfId, misIndex, 2)
	local targetX, targetZ = GetWorldPos(sceneId, targetId)
	
	local distance = floor(sqrt((playerX-targetX)*(playerX-targetX)+(playerZ-targetZ)*(playerZ-targetZ)))
	local isTargetObjLive = LuaFnIsCharacterLiving(sceneId, targetId)

	local patrolPathIndex = TGetHusongPatrolPath(missionIndex)
	local x, z = GetLastPatrolPoint(sceneId, patrolPathIndex)
	
	-- ��H� t�ng������л�ȡ��ȷto� � H� t�ng��������
	local targetscene, targetname = TGetTargetNpcInfo(missionIndex)

	if sceneId ~= targetscene  then
	  --ֹͣ������to� � ����ʱ����
	  StopMissionTimer(sceneId, selfId, missionId)
	  ResetMissionEvent(sceneId, selfId, missionId, 4)
	  ResetMissionEvent(sceneId, selfId, missionId, 5)
	  ResetMissionEvent(sceneId, selfId, missionId, 6)
	  SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)
 		
	  BeginEvent(sceneId)
	  	AddText(sceneId, "H� t�ng" .. targetname .. "Th�nh c�ng")
	  EndEvent()
	  DispatchMissionTips(sceneId, selfId)
		return
	end

	
		
	local distance2 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
	if distance2 <= 2 then
		--ֹͣ������to� � ����ʱ����
	  StopMissionTimer(sceneId, selfId, missionId)
	  --ResetMissionEvent(sceneId, selfId, missionId, 4)
	  ResetMissionEvent(sceneId, selfId, missionId, 5)
	  ResetMissionEvent(sceneId, selfId, missionId, 6)
	  SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
	  SetMissionByIndex(sceneId, selfId, misIndex, 1, 1)
 		
	  BeginEvent(sceneId)
	  	AddText(sceneId, "H� t�ng" .. targetname .. "Th�t b�i")
	  EndEvent()
	  DispatchMissionTips(sceneId, selfId)
		return
	end

	local bfailed = 0
	if isTargetObjLive <= 0  then --���H� t�ngto� � npc������������Th�nh c�ng
		bfailed = 1
	elseif sceneId ~= targetScene or distance > 20 then
		--����Th�nh c�ng,����˲�ƻ�ԭ��to� � λ��
		bfailed = 1
	end
	
	if bfailed == 1 then
	  --ֹͣ������to� � ����ʱ����
	  StopMissionTimer(sceneId, selfId, missionId)
	  ResetMissionEvent(sceneId, selfId, missionId, 4)
	  ResetMissionEvent(sceneId, selfId, missionId, 5)
	  ResetMissionEvent(sceneId, selfId, missionId, 6)
	  SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)

 	  BeginEvent(sceneId)
	  	AddText(sceneId, "H� t�ng" .. targetname .. "Th�nh c�ng")
	  EndEvent()
	  DispatchMissionTips(sceneId, selfId)
	  
	end 

end
