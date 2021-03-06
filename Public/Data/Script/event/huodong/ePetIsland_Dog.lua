--Th�nh Th� S�n����Ѳ��
--�ˢ�ֽű�
--��ͨ

--�ű���
x808106_g_ScriptId = 808106;

--�������� �� ˽�����ݱ���
x808106_g_MonsterNumber = 5; --ÿ�������Ŀ
x808106_g_MonsterLifeTime = 3000000; --������ʱ��50 ph�t
x808106_g_ActivitySceneId = 158; --Th�nh Th� S�n

x808106_g_BookThiefID = {13402, 13403} --B�o th� thi�t t�c����ID ���m�t c�i
x808106_g_BookThiefExtAI = {288, 289} --B�o th� thi�t t�c��չAI
x808106_g_BookThiefNPCID = 807003 --B�o th� thi�t t�cNPCID
x808106_g_BookThiefLifeTime = 40*60000; --B�o th� thi�t t�c���ʱ��
x808106_g_ExistBookThief = 10 --�������10c�iB�o th� thi�t t�c����

--˽�к�������
function x808106_BroadcastLocation(sceneId, level, x, z)
	local noticeMsg = format("#{ZSSFC_090211_02}%d#{ZSSFC_090211_03}(%d,%d)#{ZSSFC_090211_04}", level, x, z)
	--PrintStr(format("%d:%d:%d:%s",level, x, z, noticeMsg));
	if nil~=noticeMsg then
		AddGlobalCountNews(sceneId, noticeMsg);
	end
end

function x808106_BroadcastNotice(sceneId)
	local Notices = "#{ZSSFC_090211_01}"
	AddGlobalCountNews(sceneId, Notices);
end

function x808106_CreateMonstersByGroup(sceneId, groupId)
	local Group25 = {
		{DataId=13404, x=221.8390, z=129.7934, aiType=20, aiScript=285,aiLuaExtend=808106,patrolId=4},
		{DataId=13407, x=222.2473, z=128.2261, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=5},
		{DataId=13410, x=223.2509, z=129.5619, aiType=20, aiScript=-1,aiLuaExtend=-1,patrolId=6},
		{DataId=13413, x=220.3515, z=129.4081, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=7},
		{DataId=13416, x=221.3242, z=130.8726, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=8}
	};
	local Group45 = {
		{DataId=13405, x=158.7148, z=155.5938, aiType=20, aiScript=285,aiLuaExtend=808106,patrolId=9},
		{DataId=13408, x=158.9959, z=154.4017, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=10},
		{DataId=13411, x=159.8189, z=155.4866, aiType=20, aiScript=-1,aiLuaExtend=-1,patrolId=11},
		{DataId=13414, x=157.6915, z=155.4017, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=12},
		{DataId=13417, x=158.4503, z=156.3715, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=13}
	};
	local Group65 = {
		{DataId=13406, x=35.6149, z=151.7296, aiType=20, aiScript=285,aiLuaExtend=808106,patrolId=14},
		{DataId=13409, x=35.6754, z=150.6953, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=15},
		{DataId=13412, x=34.6520, z=151.6869, aiType=20, aiScript=-1,aiLuaExtend=-1,patrolId=16},
		{DataId=13415, x=36.5562, z=151.8499, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=17},
		{DataId=13418, x=35.5040, z=152.6140, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=18}
	};

	local MonsterGroup = {
		Group25,
		Group45,
		Group65
	};
	local LocationInfo = {
		{level=25, x=221, z=129},
		{level=45, x=158, z=155},
		{level=65, x=35, z=151}
	};
	local group = MonsterGroup[groupId];
	if nil~=group then
		local locationInfo = LocationInfo[groupId]
		
		for index=1, x808106_g_MonsterNumber do
			local monster = group[index];
			if nil~=monster then
				local monsterId = LuaFnCreateMonster(sceneId, monster.DataId, monster.x, monster.z, monster.aiType, monster.aiScript, monster.aiLuaExtend)
				SetMonsterGroupID(sceneId, monsterId, groupId);	--ÿ���������ͬm�t c�iGroupID,���������ǿ��Ի�����Ԯ
				SetPatrolId(sceneId, monsterId, monster.patrolId); --���ù���to� � Ѳ��ID
				SetCharacterDieTime(sceneId, monsterId, x808106_g_MonsterLifeTime); --����ֻ���ָ��ʱ��
				if (index == 1) then
					SetCharacterTitle(sceneId, monsterId, "Th�nh th� s�n trinh t�p �i tr߶ng")
				end
				--PrintStr(format("%d:monsterDataID=%d",groupId,monster.DataId));
			else
				break;
			end
		end
		
		--PrintNum(sceneId)
		-- Broadcast the notice of this monster group
		x808106_BroadcastNotice(sceneId);
		-- Broadcast the level and location of this monster group
		if nil~=locationInfo then
			x808106_BroadcastLocation(sceneId, locationInfo.level, locationInfo.x, locationInfo.z);
		end 

	end
end


--**********************************
--�¼��������
--**********************************
function x808106_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )
	if x808106_g_ActivitySceneId == sceneId then
		StartOneActivity( sceneId, actId, floor(300000));--Timer ����: 5 ph�t
	end
end

--**********************************
--��������
--**********************************
function x808106_OnTimer( sceneId, actId, uTime )
	if x808106_g_ActivitySceneId == sceneId then
		local RegenesisTime ={
				{groupId = nil},--0 �i�m
				{groupId = nil},--1 �i�m
				{groupId = 1},--2 �i�m
				{groupId = nil},--3 �i�m
				{groupId = nil},--4 �i�m
				{groupId = nil},--5 �i�m
				{groupId = 2},--6 �i�m
				{groupId = nil},--7 �i�m
				{groupId = nil},--8 �i�m
				{groupId = nil},--9 �i�m
				{groupId = 3},--10 �i�m
				{groupId = nil},--11 �i�m
				{groupId = nil},--12 �i�m
				{groupId = nil},--13 �i�m
				{groupId = 1},--14 �i�m
				{groupId = nil},--15 �i�m
				{groupId = nil},--16 �i�m
				{groupId = nil},--17 �i�m
				{groupId = 2},--18 �i�m
				{groupId = nil},--19 �i�m
				{groupId = nil},--20 �i�m
				{groupId = nil},--21 �i�m
				{groupId = 3},--22 �i�m
				{groupId = nil},--23 �i�m
			};
			
		if 5>floor(GetMinute()) then --ֻ��T�i ÿc�iСʱto� � ͷ5 ph�t�ڻ�ˢ�¹���
			local index = floor(GetHour()+1);
			local groupId = nil;
			local regenesisTime = RegenesisTime[index];
			if nil~=regenesisTime then
				groupId = regenesisTime.groupId;
			end
			if nil~=groupId then
				x808106_CreateMonstersByGroup(sceneId, groupId);
			end
		end
	end
end

--**********************************
--obj����
--**********************************
function x808106_OnDie( sceneId, objId, selfId )--C�i n�y selfId������ng����
	local killerID = selfId
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --�����ng����to� � ��,��C�i n�y ID���ó�����ID
		killerID = GetPetCreator( sceneId, selfId )
	end
	
	local postable = {{228,	193},{227,	125},{215,	66},{169,	29},{155,	83},{154,	127},{159,	167},{156,	224},{103,	211},{95,	121},
										{86,	36},{44,	28},{54,	126},{48,	207},{62,	159},{210,	214},{214,	168},{203,	139},{206,	81},{161,	64},
										{132,	89},{139,	115},{133,	122},{142,	186},{161,	190},{188,	217},{92,	208},{34,	141},{30,	177},{19,	62}}
	local size = getn(postable)
	for i=1, x808106_g_ExistBookThief do
		--PrintStr(size)
		local ram = random(size)
		local ThisPos = postable[ram]
		
		for j=ram, size do
			if j+1 <= size then
				postable[j] = postable[j+1]
			end
		end
		
		size = size -1
		
		--PrintStr("after size "..size.." this create pos "..ThisPos[1].." "..ThisPos[2].." ran "..ram)
		
		local monsterType = random(getn(x808106_g_BookThiefID))
		local MonsterId = LuaFnCreateMonster(sceneId, x808106_g_BookThiefID[monsterType], ThisPos[1], ThisPos[2], 0, x808106_g_BookThiefExtAI[monsterType], x808106_g_BookThiefNPCID)
		SetCharacterDieTime(sceneId, MonsterId, x808106_g_BookThiefLifeTime)
		SetCharacterTitle(sceneId, MonsterId, "B�o th� thi�t t�c")
		--���öԹ�Ϊ�Ѻ�to� �  Ŀǰ��ng0����ng�Ѻ�to� � ,������˸ı�����Ӧto� � �����������ҾͲ��ˣ.�:-(((
		SetUnitReputationID(sceneId, killerID, MonsterId, 0)
		
	end
	
	-- #P����T�i #{_BOSS115}#P�������֮ǰ,͸¶�˾���to� � ��Ϣ: m�t Щ̰��to� � #GB�o th� thi�t t�c: #{_BOSS116}��#{_BOSS117}#PT�i #GTh�nh Th� S�n#P��ʼ������to� � ���ܻ����·Ӣ�ۿ��ȥ��c�i������.
	local strText = "#{ZSSFC_090211_06}"
	BroadMsgByChatPipe(sceneId, killerID, strText, 4)
	
end
