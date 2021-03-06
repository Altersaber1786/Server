--副本任务
--消灭T読 矿场捣乱to� 鸬 小贼

--************************************************************************
--MisDescBegin

--脚本号
x600009_g_ScriptId = 600009

--任务号
x600009_g_MissionId = 1106

--目标NPC
x600009_g_Name = "Chu Th� H鎢"

--衅ng c nhi甿 v� 
x600009_g_MissionLevel = 10000

--任务归类
x600009_g_MissionKind = 50

--喧ng否喧ngTinh英任务
x600009_g_IfMissionElite = 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--角色Mission变量� 餴琺�
x600009_g_IsMissionOkFail			=0	--0 Nhi甿 v� ho鄋 th鄋h标记
x600009_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置
x600009_g_Param_sceneid				=2	--2号: 当前副本任务to� 鸬 场景号

--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数
x600009_g_MissionRound = 40
--**********************************以上喧ng动态****************************

--任务文本描述
x600009_g_MissionName = "Nhi甿 v� ph醫 tri琻"
x600009_g_MissionInfo = ""													--任务描述
x600009_g_MissionTarget = "    B鋙 h� %n 皙n g %s %s. "						--M鴆 ti陁 nhi甿 v�
x600009_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"						--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600009_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"								--完成未提交时to� 鸬 npc对话
x600009_g_MissionComplete = "    L鄊 t痶 l, r t痶 r t痶. "						--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600009_g_StrForePart = 3

x600009_g_FamilyNameStart = 0												-- x600009_g_StrList 中to� 鸬 姓to� 鸬 起始位置
x600009_g_FamilyNameCount = 13												-- x600009_g_StrList 中to� 鸬 姓to� 鸬 数量
x600009_g_StrList = { [0] = "Ch鈛", [1] = "Tri畊", [2] = "D呓ng", [3] = "H鄋", [4] = "L鈓", [5] = "Qu醕h", [6] = "M課h",
			  [7] = "Th叨ng", [8] = "Ng�", [9] = "Th鬷", [10] = "Kim", [11] = "Ti猼", [12] = "Quan",
			  [13] = "Y猲", [14] = "徐nh", [15] = "L鈓", [16] = "C", [17] = "S鋘h", [18] = "To鄋",
			  [19] = "X鋙 X鋙", [20] = "Oanh Oanh", [21] = "T� T�", [22] = "刵 Nhi", [23] = "Nguy畉 Nhi",
			  [24] = "Tuy猼 Nhi", [25] = "Uy琻 Nhi",
}

-- 通用Th鄋h ph� 任务脚本
x600009_g_CityMissionScript = 600001
x600009_g_DevelopmentScript = 600007

--任务奖励

--MisDescEnd
--************************************************************************

--副本名称
x600009_g_CopySceneName = "M鴆 tr叨ng"

x600009_g_CopySceneType = FUBEN_CONVOYPET	--副本类型,定义T読 ScriptGlobal.lua里面

x600009_g_CopySceneMap = "muchang.nav"
x600009_g_Exit = "muchang_area.ini"
x600009_g_TickTime = 5					--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x600009_g_LimitTotalHoldTime = 360		--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x600009_g_LimitTimeSuccess = 500		--副本时间限制(单位: 次数),如果此时间到了,Nhi甿 v� ho鄋 th鄋h
x600009_g_CloseTick = 3					--副本关闭前倒计时(单位: 次数)
x600009_g_NoUserTime = 300				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x600009_g_DeadTrans = 0					--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x600009_g_Fuben_X = 70					--进入副本to� 鸬 位置X
x600009_g_Fuben_Z = 113					--进入副本to� 鸬 位置Z
x600009_g_Back_X = 129					--源场景位置X
x600009_g_Back_Z = 99					--源场景位置Z

x600009_g_PetList = {
	PetNpcId = { 300464, 300465, 300466, 300467, 300468 },
	[10] = { 1940, 1950, 1960, 1970, 1980 },
	[20] = { 1941, 1951, 1961, 1971, 1981 },
	[30] = { 1942, 1952, 1962, 1972, 1982 },
	[40] = { 1943, 1953, 1963, 1973, 1983 },
	[50] = { 1944, 1954, 1964, 1974, 1984 },
	[60] = { 1945, 1955, 1965, 1975, 1985 },
	[70] = { 1946, 1956, 1966, 1976, 1986 },
	[80] = { 1947, 1957, 1967, 1977, 1987 },
	[90] = { 1948, 1958, 1968, 1978, 1988 },
	[100] = { 1949, 1959, 1969, 1979, 1989 },
}

--**********************************
--任务入口函数
--**********************************
function x600009_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		local bDone = x600009_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600009_g_SubmitInfo
		else
			strText = x600009_g_ContinueInfo
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )

		if bDone == 0 and GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 2 then		--任务未完成
			if GetNumText() == 1 then
				x600009_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x600009_g_MissionName )
					x600009_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		else											--任务已经完成或th b読
			BeginEvent( sceneId )
				AddText( sceneId, x600009_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600009_g_ScriptId, x600009_g_MissionId, bDone )
		end
	--Th鯽 m鉵任务接收条件
	elseif x600009_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600009_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600009_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600009_OnEnumerate( sceneId, selfId, targetId )
	--local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	--SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 0 )
	
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		AddNumText( sceneId, x600009_g_ScriptId, x600009_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600009_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600009_g_DevelopmentScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x600009_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )

	local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )

	local missionInfo
	if random(2) == 1 then
		missionInfo = format( "    %s %s c黙 tr読 ch錸 nu鬷 疸 l誧 m %s, phi玭 c醕 h� h� t痭g %s v� v緄 ch� c黙 n�.",
			x600009_g_StrList[girlFamilyNameIndex], x600009_g_StrList[girlNameIndex], strPetName, strPetName )
	else
		missionInfo = format( "    Nghe n骾 %s %s kh鬾g c th 瓞 l誧 m %s, n猽 c醕 h� c� th� t靘 gi鷓 n� v�, ta ngh� n� s� r ph kh穒.",
			x600009_g_StrList[girlFamilyNameIndex], x600009_g_StrList[girlNameIndex], strPetName )
	end

	AddText( sceneId, missionInfo )
	AddNumText( sceneId, x600009_g_ScriptId, "衖 v鄌 tr読 ch錸 nu鬷", 10, 1 )
end

--**********************************
--Ti猵 th�
--**********************************
function x600009_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then					--没有任务才可以走这里
		if GetLevel( sceneId, selfId ) < 30 then
			CallScriptFunction( x600009_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
			return
		end

		--加入任务到玩家列表
		AddMission( sceneId, selfId, x600009_g_MissionId, x600009_g_ScriptId, 0, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) <= 0 then
			return
		end

		SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 4 ) -- 注册 x600009_OnLockedTarget 事件
		CallScriptFunction( x600009_g_DevelopmentScript, "OnAccept", sceneId, selfId, targetId, x600009_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )

		-- 护送B到AA附近.
		local PetNpcId = x600009_g_PetList.PetNpcId[random( getn(x600009_g_PetList.PetNpcId) )]
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart, PetNpcId )

		local girlFamilyNameIndex = random( x600009_g_FamilyNameStart, x600009_g_FamilyNameStart + x600009_g_FamilyNameCount - 1 )
		local girlNameIndex = random( x600009_g_FamilyNameStart, getn(x600009_g_StrList) - x600009_g_FamilyNameCount ) + x600009_g_FamilyNameCount
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 1, girlFamilyNameIndex )
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 2, girlNameIndex )

		--显示内容告诉玩家已经Ti猵 th巳挝�
		BeginEvent( sceneId )
			AddText( sceneId, x600009_g_MissionName )
			x600009_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#rC醕 h� 疸 nh " .. x600009_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x600009_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600009_g_Param_sceneid )

		--changed by xindefeng
		--副本新机制:无论什么原因,T読 未Ho鄋 t nhi甿 v龈北�,副本不对玩家身上to� 鸬 任务做任何改动(设置th b読或者删除任务),而玩家再进该副本时,都要重新初始化任务数据,而且副本都要重新创建
		--if copysceneid >= 0 then												--进过副本
		--	--将自己传送到副本场景
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600009_g_Fuben_X, x600009_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 0 )	--将任务to� 鸬 第0号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_Param_sceneid, -1 )		--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
		x600009_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x600009_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600009_g_CopySceneMap )						--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600009_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600009_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600009_g_CopySceneType )				--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600009_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数为0
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--杀死Bossto� 鸬 数量

	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < 100 then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = 100
	end

	LuaFnSetSceneLoad_Area( sceneId, x600009_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "muchang_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel ) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local PetList = x600009_g_PetList[iniLevel]
	local petMonsterId = nil
	local i = 1

	if not PetList then
		x600009_NotifyFailTips( sceneId, selfId, "Kh鬾g c� lo読 tr鈔 th� n鄌 th韈h h䅟 瓞 c醕 h� h� t痭g" )
		return
	end

	for i = 1, getn( x600009_g_PetList.PetNpcId ) do
		if x600009_g_PetList.PetNpcId[i] == PetNpcId then
			petMonsterId = PetList[i]
			break
		end
	end

	if not petMonsterId then
		x600009_NotifyFailTips( sceneId, selfId, "Kh鬾g t靘 th lo鄆 tr鈔 th� n鄌 th韈h h䅟 瓞 c醕 h� h� t痭g" )
		return
	end

	SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 3, petMonsterId )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x600009_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
		x600009_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
	end

end

--**********************************
--副本事件
--**********************************
function x600009_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600009_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600009_g_MissionId )

		--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600009_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600009_g_Fuben_X, x600009_g_Fuben_Z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600009_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then				--如果进入副本前删除任务,则直接传送回
		x600009_NotifyFailTips( sceneId, selfId, "C醕 h� 疸 kh鬾g nh nhi甿 v� n鄖 t� tr呔c" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
		return
	end

	--�?� 2008-03-06
	--不应该出现这种情况....C 检测喧ng否喧ng本任务....
	local misIdx = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local scriptId = GetMissionParam( sceneId, selfId, misIdx, 1 )
	if x600009_g_ScriptId == scriptId then
		--进入副本就启动计时器 --add by xindefeng
		StartMissionTimer( sceneId, selfId, x600009_g_MissionId )
		SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )
	else
		local msg = format( "CityMission_OnTimer_Error x600009_OnPlayerEnter %0X,%d,%d real scriptId = %d", LuaFnObjId2Guid( sceneId, selfId ), sceneId, selfId, scriptId )
		MissionLog( sceneId, msg )
		return
	end

	local monstercount = GetMonsterCount( sceneId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )
	local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )

	local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )

	-- 设置护送宠物属性
	local i
	local monsterId
	local petFlag = 0
	for i = 0, monstercount - 1 do
		monsterId = GetMonsterObjID( sceneId, i )
		if GetName( sceneId, monsterId ) == strPetName then
			petFlag = 1
		end

		if GetName( sceneId, monsterId ) == "Thi猽 n�" then
			SetCharacterName( sceneId, monsterId, x600009_g_StrList[girlFamilyNameIndex] .. x600009_g_StrList[girlNameIndex] )
		end
	end
	
	if petFlag == 0 then
		monsterId = LuaFnCreateMonster( sceneId, petMonsterId, x600009_g_Fuben_X, x600009_g_Fuben_Z, 0, 0, -1 )
		SetLevel( sceneId, monsterId, GetLevel( sceneId, selfId ) )			-- 调整c别
		SetUnitReputationID(sceneId, selfId, monsterId, GetUnitReputationID(sceneId, selfId, selfId)) --设定为玩家势力ID,和玩家友好

		local pAttack = 0													-- 物理攻击
		local pDefense = 0													-- 物理防御
		local mDefense = 0													-- 内功防御
		local maxHP = 0														-- 气血值

		pAttack = LuaFnGetBaseAttackPhysics( sceneId, monsterId )
		pAttack = floor( pAttack * ( 80 + random(40) ) / 100 - pAttack )
		pAttack = pAttack + LuaFnGetLifeTimeAttrRefix_AttackPhysics( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_AttackPhysics( sceneId, monsterId, pAttack )

		pDefense = LuaFnGetBaseDefencePhysics( sceneId, monsterId )
		pDefense = floor( pDefense * ( 80 + random(40) ) / 100 - pDefense )
		pDefense = pDefense + LuaFnGetLifeTimeAttrRefix_DefencePhysics( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_DefencePhysics( sceneId, monsterId, pDefense )

		mDefense = LuaFnGetBaseDefenceMagic( sceneId, monsterId )
		mDefense = floor( mDefense * ( 80 + random(40) ) / 100 - mDefense )
		mDefense = mDefense + LuaFnGetLifeTimeAttrRefix_DefenceMagic( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_DefenceMagic( sceneId, monsterId, mDefense )

		maxHP = LuaFnGetMaxBaseHp( sceneId, monsterId )
		maxHP = floor( maxHP * ( 80 + random(40) ) / 100 - maxHP )
		maxHP = maxHP + LuaFnGetLifeTimeAttrRefix_MaxHP( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_MaxHP( sceneId, monsterId, maxHP )
		RestoreHp( sceneId, monsterId )
	end
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x600009_OnHumanDie( sceneId, selfId, killerId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then				--如果进入副本前删除任务,则直接传送回
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	x600009_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
	SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )			-- Nhi甿 v� th b読
	LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

	if x600009_g_DeadTrans == 1 then														--死亡后C 被强制踢出场景
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
	end
end

--**********************************
--放弃
--**********************************
function x600009_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600009_g_Param_sceneid )

	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600009_g_DevelopmentScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--如果T読 副本里删除任务,则直接传送回
		x600009_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
	end
end

--**********************************
-- 回城,只有Th鄋h ph� 任务副本可以调用此接口
--**********************************
function x600009_BackToCity( sceneId, selfId )
	--可以用原来to� 鸬 方法,但喧ng会提示两遍"Nhi甿 v� th b読",所以修改 --changed by xindefeng
	--CallScriptFunction( x600009_g_CityMissionScript, "BackToCity", sceneId, selfId, x600009_g_MissionId, x600009_g_Back_X, x600009_g_Back_Z )	
	
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 1 then	--如果任务未成功
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )	--设置Nhi甿 v� th b読
		end
	end
	
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--取 餴琺进入副本时所T読 场景号
	CallScriptFunction( 400900, "TransferFunc", sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )	--传送
end

--**********************************
--继续
--**********************************
function x600009_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600009_g_MissionName )
		AddText( sceneId, x600009_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600009_g_ScriptId, x600009_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600009_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务喧ng否已经完成
	local ret = CallScriptFunction( x600009_g_DevelopmentScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600009_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600009_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600009_g_DevelopmentScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600009_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x600009_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600009_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件(scene.lua调用)
--**********************************
function x600009_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新to� 鸬 定时器调用次数

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--C 离开
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x600009_g_CloseTick then										--倒计时间到,大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--取 餴琺副本入口场景号

			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
				end
			end
		else
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍", ( x600009_g_CloseTick - leaveTickCount ) * x600009_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600009_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

--**********************************
--当锁定m祎 c醝对象
--**********************************
function x600009_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )
	local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )

	local strGirlName = x600009_g_StrList[girlFamilyNameIndex] .. x600009_g_StrList[girlNameIndex]

	if GetMonsterDataID( sceneId, objId ) == petMonsterId then				-- 珍兽
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 4 ) > 0 then
			print( "� 疴y c� v 皤, lo鄆 tr鈔 th� nhi玼 l h叻ng 裯g s� ki畁  chu祎" )
		end

		------------------挪到x600009_OnPlayerEnter()去了,玩家m祎 进入副本就启动时钟 changed by xindefeng----------------
		--启动该任务to� 鸬 任务时钟器
		--StartMissionTimer( sceneId, selfId, x600009_g_MissionId )
		--SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )
		---------------------------------------------------------------------------------------------------------------
		
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 1 )	--设置标志:喧ng否与护送宠物对话(即T読 副本喧ng否已经开始护送?)
		SetPatrolId( sceneId, objId, 0 )									-- 设置巡逻路径
		return
	end

	if GetName( sceneId, objId ) == strGirlName then						-- 失女
		-- 设置任务已经完成
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) == 1 then
			-- 将该任务从 x600009_OnLockedTarget 事件列表中清除,该任务不再关心此类事件
			ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 4 )
			TAddText( sceneId, "    T痶 qu�, th 瘊ng l� c鋗 絥 c醕 h� qu�." )
			x600009_NotifyFailTips( sceneId, selfId, "Nhi甿 v� ho鄋 th鄋h" )
			LuaFnDeleteMonster( sceneId, objId )
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
		else
			local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
			local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )
			local strText = format( "    %s c黙 ta kh鬾g th n鎍, hu hu hu, c醕 h� c� th� gi鷓 ta t靘 n� v� kh鬾g?", strPetName )
			TAddText( sceneId, strText )
		end
	end
end

--**********************************
--定时事件
--**********************************
function x600009_OnTimer( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	
	--changed by xindefeng
	--该成玩家进入副本就启动计时器,但不设置(x600009_g_StrForePart + 4)Mission Para这样,玩家进入副本后,没有与护送宠物对话就出去了,那么也可以提示设置th b読!	
	--玩家与护送宠物对话后由x600009_OnLockedTarget()设置(x600009_g_StrForePart + 4)Mission Para,设置路径标识玩家T読 副本中开始护送
	local sceneType = LuaFnGetSceneType( sceneId )	--喧ng否喧ng副本类型
	if sceneType ~= 1 then		
		--护送任务,任务没完成就出副本,就算Nhi甿 v� th b読!
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 1 then	--任务成功否?
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )	--任务还没成功就出副本,因为喧ng护送任务就设置Nhi甿 v� th b読
			ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )									--离开副本后要停止定时调用本函数
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 0 )	--设置标志:喧ng否与护送宠物对话(即T読 副本喧ng否已经开始护送?)
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )																	--设置副本关闭标志
			x600009_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )												--提示th b読
		end
		return
	end
	
	

	-- 只有触发了珍兽自动行走才会走到这里
	if GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 4 ) == 1 then
		--喧ng否喧ng所C to� 鸬 副本
		local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
		
		if fubentype == x600009_g_CopySceneType then			
			local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )
			local monstercount = GetMonsterCount( sceneId )
			local monsterId
			local i

			for i = 0, monstercount - 1 do
				monsterId = GetMonsterObjID( sceneId, i )
				if GetMonsterDataID( sceneId, monsterId ) == petMonsterId then		-- 判断喧ng否成功
					local x, z = GetLastPatrolPoint( sceneId, 0 )
					local petX, petZ = GetWorldPos( sceneId, monsterId )

					if (x - petX) * (x - petX) + (z - petZ) * (z - petZ) < 4 then	-- 离终 餴琺不到 2 米
						SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 1 )
						ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )		-- 不再走此心跳
						LuaFnDeleteMonster( sceneId, monsterId )
					end
					return	--护送to� 鸬 宠物还T読 就直接Tr� v�
				end
			end
		end

		--护送过程中珍兽死亡算Nhi甿 v� th b読
		x600009_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )		-- Nhi甿 v� th b読
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )		--设置副本关闭标志
		ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )						-- 不再走此心跳
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 0 )	--设置标志:喧ng否与护送宠物对话(即T読 副本喧ng否已经开始护送?)	--add by xindefeng
	end
end

function x600009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
