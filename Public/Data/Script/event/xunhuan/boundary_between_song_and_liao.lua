-- 连环副本任务
-- 宋Linh边界

--************************************************************************
--MisDescBegin

-- 脚本号
x050100_g_ScriptId = 050100

-- 任务号
x050100_g_MissionId = 1260					-- 1260 - 1269

-- 上m祎 c醝任务to� 鸬  ID
-- g_MissionIdPre = 1260

-- M鴆 ti陁 nhi甿 v� NPC
x050100_g_Name = "Ti玭 H皀g V�"

--任务归类
x050100_g_MissionKind = 8

--衅ng c nhi甿 v� 
x050100_g_MissionLevel = 10000

-- 任务文本描述
x050100_g_MissionName = "M祎 t阯 c鹡g kh鬾g th� tho醫"
x050100_g_MissionInfo = "    "				-- 任务描述
x050100_g_MissionTarget = "    "..x050100_g_Name.." � T� Ch鈛 #{_INFOAIM62,162,1, "..x050100_g_Name.."} y陁 c c醕 h� trong v騨g 30 ph鷗 ph鋓 d� v� gi猼 ch猼 D� 械c.#r    #{FQSH_090206_01}"						-- M鴆 ti陁 nhi甿 v�
x050100_g_ContinueInfo = "    Tr chi猲 v� c鵱g tr鱪g 鹫i, nh 鸶nh kh鬾g 疬㧟 khinh xu. C醕 h� 疸 chu b� 皙n sao huy畉 b鱪 c呔p ch遖?"	-- 未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x050100_g_SubmitInfo = "    Nhi甿 v� l鄊 th� n鄌 r癷?"										-- 提交时to� 鸬 答复
x050100_g_MissionComplete = "    C醕 h� l鄊 qu� t痶 r癷, ch鷑g ta c� th� c� th� th鬾g qua l畁h b鄆 n鄖 t靘 疬㧟 doanh tr読 c黙 b鱪 ph� 鸢 n鄖. H銀 餴 皙n ti陁 c鴆 t靘 #{_INFOAIM251,109,1, Hoa Ki猰 膎h}, h c� th� cho ng呓i bi猼 lai l竎h c黙 l畁h b鄆"	--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话

x050100_g_IsMissionOkFail = 0				-- 0 号: 当前任务喧ng否完成(0未完成；1完成；2th b読)
x050100_g_DemandKill = { { id = 4060, num = 50 }, { id = 4070, num = 10 }, { id = 4080, num = 1 }, { id = 4090, num = 1 }, { id = 4100, num = 1 } }	-- 1 ~ 5 号,怪物信息
x050100_g_Param_sceneid = 6					-- 6 号: 当前副本任务to� 鸬 场景号

-- 任务奖励

--MisDescEnd
--************************************************************************

x050100_g_DemandKillGroup = { 4, 0, 1, 2, 3 }	-- 1 ~ 5 号怪物对应to� 鸬  GroupID 号,与 x050100_g_DemandKill m祎 m祎 对应
x050100_g_DogfaceGroup = 0					-- 逃跑小兵to� 鸬  Group ID
x050100_g_LittleBossGroup = 2				-- 小 Boss Group ID
x050100_g_ViceBossGroup = 1					-- 宋军副都统
x050100_g_BossGroup = 3						-- Boss Group ID
x050100_g_Token = 40004315					-- 令牌号

x050100_g_NumText_Main = 1					-- 接任务to� 鸬 选项
x050100_g_NumText_EnterCopyScene = 2		-- 要求进入副本to� 鸬 选项

x050100_g_CopySceneMap = "songliao.nav"
x050100_g_CopySceneArea = "songliao_area.ini"
x050100_g_CopySceneMonsterIni = "songliao_monster_%d.ini"

x050100_g_CopySceneType = FUBEN_SONGLIAO	-- 副本类型,定义T読 ScriptGlobal.lua里面
x050100_g_LimitMembers = 1					-- 可以进副本to� 鸬 最小队伍人数
x050100_g_LevelLimit = 30					-- 可以进入副本to� 鸬 最低c别
x050100_g_TickTime = 5						-- 回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x050100_g_LimitTotalHoldTime = 360			-- 副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x050100_g_CloseTick = 6						-- 副本关闭前倒计时(单位: 次数)
x050100_g_NoUserTime = 30					-- 副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x050100_g_LoadBossTick = 180				-- 15  ph鷗刷小 Boss

x050100_g_LittleBoss = { 4080, 4081, 4082, 4083, 4084, 4085, 4086, 4087, 4088, 4089, 34080, 34081, 34082, 34083, 34084, 34085, 34086, 34087, 34088, 34089 }
x050100_g_Dogface = { 4070, 4071, 4072, 4073, 4074, 4075, 4076, 4077, 4078, 4079, 34070, 34071, 34072, 34073, 34074, 34075, 34076, 34077, 34078, 34079 }
x050100_g_DogfacePos = {
	{ 22, 70, 4 }, { 22, 70, 4 }, { 22, 70, 4 }, { 102, 67, 5 }, { 102, 67, 5 },
	{ 102, 67, 5 }, { 75, 83, 6 }, { 75, 83, 6 }, { 49, 84, 7 }, { 49, 84, 7 }
}
x050100_g_Boss = { 4100, 4101, 4102, 4103, 4104, 4105, 4106, 4107, 4108, 4109, 34100, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109 }

x050100_g_Fuben_X = 60
x050100_g_Fuben_Z = 9
x050100_g_Back_X = 60
x050100_g_Back_Z = 161

x050100_g_Fuben_Relive_X = 60
x050100_g_Fuben_Relive_Z = 15


-- 广播消息
x050100_g_BroadcastMsg = {
	"#Y"..x050100_g_Name..": #{_BOSS45}#cff99cc 疸 ch猼! H 疸 b� anh h鵱g c黙 ch鷑g ta #{_INFOUSR$N}#cff99cc ti陁 di畉! K� n誴 m課g ti猵 theo l� ai? #{_BOSS46} hay l� #{_BOSS47}. Ha ha ha!",
	"#Y"..x050100_g_Name..": #cff99ccAnh h鵱g c黙 ch鷑g ta #{_INFOUSR$N}#cff99cc, t� #Gbi阯 gi緄 T痭g Li陁#cff99cc mang tin vui t緄! T阯 th� ph� 醕 鬾 #{_BOSS45}#cff99cc n鄖, 疸 b� tr� kh�!",
	"#Y"..x050100_g_Name..": #cff99ccM鱥 ng叨i mau ra 疴y xem v� anh h鵱g c黙 ch鷑g ta m祎 nh醫 ki猰 疸 gi猼 ch猼 #{_BOSS45}! #{_INFOUSR$N}#cff99cc m祎 huy玭 tho読 s痭g, hi畃 s� chi猲 黏u, 鹫i hi畃!"
}

x050100_g_TakeTimes = 10											-- 每天最多L頽h 次数

--**********************************
-- 任务入口函数
--**********************************
function x050100_OnDefaultEvent( sceneId, selfId, targetId )	--  餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		-- 判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		if numText == x050100_g_NumText_Main then
			if x050100_CheckAccept( sceneId, selfId ) > 0 then
				--发送任务Ti猵 th毕允総o� 鸬 信息
				BeginEvent( sceneId )
					AddText( sceneId, x050100_g_MissionName )
					AddText( sceneId, "    R痶 cu礳 疸 c� ng叨i t緄 tr譶g tr� l� 醕 t n鄖!" )
					AddText( sceneId, "    T阯 th� ph� n鄖 � bi阯 gi緄 r x鋙 quy畉. 啸u m鴆 l� m� ph� D� 械c l� k� t礽 鸢 c黙 C醝 Bang c� v� c鬾g cao v� r gi鰅 d鵱g 鸬c, ch� c� c醕h ngu� trang th鄋h T痭g binh, T痭g ph� m緄 c� th� d� h xu hi畁 " .. GetName( sceneId, selfId ) .. ", 瓞 di畉 t g痗 b鱪 c呔p n鄖, ng呓i c ph鋓 ti陁 di畉 ch鷑g v緄 t痗 鸬 nhanh nh, kh鬾g th� 瓞 1 t阯 s痭g s髏!" )
					AddText( sceneId, "#{M_MUBIAO}" )
					AddText( sceneId, x050100_g_MissionTarget )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId )
			end
		end
	else
		if numText == x050100_g_NumText_Main then
			local bDone = x050100_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				AddText( sceneId, x050100_g_MissionName )

				if bDone == 1 then
					AddText( sceneId, x050100_g_SubmitInfo )
				else
					AddText( sceneId, x050100_g_ContinueInfo )
					x050100_AskEnterCopyScene( sceneId, selfId, targetId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId, bDone )
		elseif numText == x050100_g_NumText_EnterCopyScene then
			x050100_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- 不能有其他to� 鸬 任务,没有Tr� v� 0,有Tr� v� 1
--**********************************
function x050100_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	for missionId = 1260, x050100_g_MissionId - 1 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	for missionId = x050100_g_MissionId + 1, 1269 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	return 0
end

--**********************************
-- 列举事件
--**********************************
function x050100_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	-- 不能有其他to� 鸬 任务
	if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050100_g_ScriptId, x050100_g_MissionName, 4, x050100_g_NumText_Main )
end

--**********************************
-- 检测Ti猵 th跫�
--**********************************
function x050100_CheckAccept( sceneId, selfId )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) > 0 then
		return 0
	end

	-- 不能有其他to� 鸬 任务
	if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end

	-- 检测玩家喧ng否符合刚放弃任务
	local iTime = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1 )			-- 上m祎 次放弃任务to� 鸬 时间(单位: m祎 刻钟)
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()												-- 当前时间(单位: m祎 刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(单位: m祎 刻钟)
	--end modified by zhangguoxin 090207

	if iTime+1 >= CurTime then
		x050100_NotifyFailTips( sceneId, selfId, "Sau khi t� b� nhi甿 v� 30 ph鷗, m緄 c� th� nh l n鎍." )
		return 0
	end

	-- m祎 天只能领 x050100_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
	end

	if takenTimes >= x050100_g_TakeTimes then
		x050100_NotifyFailTips( sceneId, selfId, "S� l nh nhi甿 v� c黙 c醕 h� h鬽 nay 疸 v唼t qu�" .. x050100_g_TakeTimes .. " l, xin ng鄖 mai quay l読 nh" )
		return 0
	else
		DayTimes = nowDate + takenTimes * 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES, DayTimes )
	end

	return 1
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050100_AskEnterCopyScene( sceneId, selfId, targetId )
	AddNumText( sceneId, x050100_g_ScriptId, "Th苙g ti猲 bi阯 c呓ng", 10, x050100_g_NumText_EnterCopyScene )
end

--**********************************
--Ti猵 th�
--**********************************
function x050100_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then					-- 没有任务才可以走这里
		if GetMissionCount( sceneId, selfId ) >= 20 then						-- 身上任务数量喧ng否达到上限20c醝
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    Nhi甿 v� ghi ch閜 疸 馥y, kh鬾g th� nh th阭 nhi甿 v�" )
			return
		end

		if GetLevel( sceneId, selfId ) < x050100_g_LevelLimit then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    衅ng c c黙 ng呓i qu� th, kh鬾g th� chi猲 thg" )
			return
		end

		-- 不能有其他to� 鸬 任务
		if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
			return
		end

		-- 加入任务到玩家列表
		AddMission( sceneId, selfId, x050100_g_MissionId, x050100_g_ScriptId, 1, 0, 0 )			-- kill、area、item
		if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) <= 0 then
			return
		end

		-- m祎 天只能领 x050100_g_TakeTimes 次
		local DayTimes

		DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES )
		DayTimes = DayTimes + 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES, DayTimes )

--		SetMissionEvent( sceneId, selfId, x050100_g_MissionId, 4 ) -- 注册 OnLockedTarget 事件

		local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )

		SetMissionByIndex( sceneId, selfId, misIndex, x050100_g_IsMissionOkFail, 0 )	-- 任务完成情况置为未完成
		SetMissionByIndex( sceneId, selfId, misIndex, x050100_g_Param_sceneid, -1 )		-- 副本号置为 -1

		--显示内容告诉玩家已经Ti猵 th巳挝�
		BeginEvent( sceneId )
			AddText( sceneId, x050100_g_MissionName )
			AddText( sceneId, x050100_g_ContinueInfo )
			AddText( sceneId, "#r    C醕 h� 疸 nh " .. x050100_g_MissionName )

			x050100_AskEnterCopyScene( sceneId, selfId, targetId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050100_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) > 0 then					-- 有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050100_g_Param_sceneid )
		if copysceneid >= 0 then												-- 进过副本
			-- 将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050100_g_Fuben_X, x050100_g_Fuben_Z )
			else
				x050100_NotifyFailBox( sceneId, selfId, targetId, "     R ti猚, nhi甿 v� c黙 ng呓i 疸 th b読" )
			end

			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    L� 鹫o t n鄖 kh鬾g ph鋓 v譨 疴u, ng呓i c ph鋓 c� 1 nh髆 m課h" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    Ta ph鋓 疬㧟 s� x醕 nh c黙 tr叻ng nh髆 m緄 c� th� y阯 t鈓 瓞 c醕 ng呓i th苙g ti猲 bi阯 c呓ng" )
			return
		end
		
		--bug27726,2007.11.15 by alan,因为sceneMemberCount不m祎 定准确,改用附近械i vi阯 数与队伍人数to� 鸬 比较判断
		--并不再提示具体不T読 附近to� 鸬 械i vi阯 名称
				
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);	
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);		
		if not teamMemberCount or not nearMemberCount or teamMemberCount ~= nearMemberCount then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    C醕 h� c� nh髆 vi阯 kh鬾g � g 疴y" )
			return
		end
		
		--bug27726 end
                                                               
		-- 取 餴琺玩家附近to� 鸬 队友数量(包括自己)
		--local teamMemberCount = GetTeamMemberCount(sceneId, selfId);		
		--local sceneMemberCount = GetTeamSceneMemberCount(sceneId, selfId);
		--if not teamMemberCount or not sceneMemberCount or teamMemberCount ~= sceneMemberCount + 1 then
		--	x050100_NotifyFailBox( sceneId, selfId, targetId, "    你还有械i vi阯 不T読 附近." )
		--	return
		--end
		
		--local nearMemberCount = GetNearTeamCount(sceneId, selfId)
		--if nearMemberCount ~= sceneMemberCount + 1 then
		--	local strOutmsg = "Trong 鸬i ng� c� th鄋h vi阯 (";
		--	local checkNearCount = 0;
		--	for	i = 0, sceneMemberCount - 1 do
		--		local sceneMemId = LuaFnGetTeamSceneMember(sceneId, selfId, i);
		--		if sceneMemId and sceneMemId >= 0 then
		--			local findFlag = 0;
		--			for	j = 0, nearMemberCount - 1 do
		--				local nearMemId = GetNearTeamMember(sceneId, selfId, j);
		--				if nearMemId and nearMemId == sceneMemId then
		--					findFlag = 1;
		--					break;
		--				end
		--			end
					
		--			if findFlag == 0 then
		--				memName = GetName(sceneId, sceneMemId);
		--				if checkNearCount == 0 then
		--					strOutmsg = strOutmsg..memName;
		--				else
		--					strOutmsg = strOutmsg.."、"..memName;
		--				end
		--				checkNearCount = checkNearCount + 1;
		--			end
		--		end
		--	end
		--	if checkNearCount  > 0 then
		--		strOutmsg = strOutmsg..")不T読 附近,请集合后再找我进入活动.";
		--		x050100_NotifyFailBox( sceneId, selfId, targetId, strOutmsg)
		--	end
		--	return 
		--end

		if nearMemberCount < x050100_g_LimitMembers then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    L� 鹫o t n鄖 kh鬾g ph鋓 v譨 疴u, ng呓i c ph鋓 c� 1 s� b鋘 l頽h v� 1 s� tr� th�, ta m緄 y阯 t鈓. (trong nh髆 t痠 thi璾 c ph鋓 c� "..x050100_g_LimitMembers.." nh鈔 v t� c 30 tr� l阯)" )
			return
		end

		-- 检测小队中喧ng否有人任务记录已满, 队友喧ng否已经接过此任务
		local member, mylevel, numerator, denominator = 0, 0, 0, 0
		local outNotAcceptMissionStr = "B課 c� th鄋h vi阯 trong nh髆 (";
		local notAcceptMissionCount = 0;
		local outDoingMissionStr = "B課 c� th鄋h vi阯 trong nh髆 (";
		local doingMissionCount = 0;
		for	i = 0, nearMemberCount - 1 do
			member = GetNearTeamMember( sceneId, selfId, i )

			if IsHaveMission( sceneId, member, x050100_g_MissionId ) <= 0 then
				if notAcceptMissionCount == 0 then
					outNotAcceptMissionStr = outNotAcceptMissionStr..GetName(sceneId, member);
				else
					outNotAcceptMissionStr = outNotAcceptMissionStr..","..GetName(sceneId, member);
				end
				notAcceptMissionCount = notAcceptMissionCount + 1;
			end

			if notAcceptMissionCount == 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x050100_g_MissionId )
				if GetMissionParam( sceneId, member, misIndex, x050100_g_Param_sceneid ) >= 0 then
					if doingMissionCount == 0 then
						outDoingMissionStr = outDoingMissionStr..GetName(sceneId, member);
					else
						outDoingMissionStr = outDoingMissionStr..","..GetName(sceneId, member);
					end
					doingMissionCount = doingMissionCount + 1;
				end
			end

			numerator = numerator + GetLevel( sceneId, member ) ^ 4
			denominator = denominator + GetLevel( sceneId, member ) ^ 3
		end
		
		if notAcceptMissionCount > 0 then
			outNotAcceptMissionStr = outNotAcceptMissionStr..") ch遖 nh nhi甿 v� n鄖";
			x050100_NotifyFailBox( sceneId, selfId, targetId, outNotAcceptMissionStr);
			return
		end

		if doingMissionCount > 0 then
			outDoingMissionStr = outDoingMissionStr..") 疸 ho 餫ng l鄊 nhi甿 v�.";
			x050100_NotifyFailBox( sceneId, selfId, targetId, outDoingMissionStr);
			return
		end
		
		if denominator <= 0 then
			mylevel = 0
		else
			mylevel = numerator / denominator
		end

    local PlayerMaxLevel = GetHumanMaxLevelLimit()
		local iniLevel
		if mylevel < 10 then
			iniLevel = 10
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor( mylevel/10 ) * 10
		else
			iniLevel = PlayerMaxLevel
		end

		local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
		LuaFnSetSceneLoad_Map( sceneId, x050100_g_CopySceneMap )						-- 地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050100_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050100_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050100_g_CopySceneType )				-- 设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050100_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- 设置定时器调用次数
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- 设置副本入口场景号, 初始化
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- 设置副本关闭标志, 0开放,1关闭
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- 设置离开倒计时次数
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- 保存队伍号
		LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 杀死Boss1to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- 杀死Boss2to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 杀死Boss3to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 杀死Boss4to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 杀死Boss5to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- 喧ng否杀死小 Boss
		LuaFnSetCopySceneData_Param( sceneId, 13, iniLevel / 10 )				-- 存储玩家们to� 鸬 c别档次
		LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- 喧ng否已经有小怪逃走
		LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- 喧ng否已经刷出大 Boss

		LuaFnSetSceneLoad_Area( sceneId, x050100_g_CopySceneArea )

		local monsterINI = format( x050100_g_CopySceneMonsterIni, iniLevel )
		LuaFnSetSceneLoad_Monster( sceneId, monsterINI )

		LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) -- c别差,CopyScene_LevelGap T読  scene.lua 中赋值

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
		if bRetSceneID > 0 then
			x050100_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
		else
			x050100_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
		end
	end
end

--**********************************
--副本事件
--**********************************
function x050100_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )				-- 设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then											-- 找不到该玩家
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then		-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local i, nearMemberCount, member
	local members = {}
	local validmembercount = 0

	nearMemberCount = GetNearTeamCount( sceneId, leaderObjId )
	for i = 0, nearMemberCount - 1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		if IsHaveMission( sceneId, member, x050100_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	if validmembercount < x050100_g_LimitMembers then
		x050100_NotifyFailTips( sceneId, leaderObjId, "    L� 鹫o t n鄖 kh鬾g ph鋓 v譨 疴u, ng呓i c ph鋓 c� 1 s� b鋘 l頽h v� 1 s� tr� th�, ta m緄 y阯 t鈓. (trong nh髆 t痠 thi璾 c ph鋓 c� "..x050100_g_LimitMembers.." nh鈔 v t� c 30 tr� l阯)" )
		return
	end

	local misIndex
	for i = 1, validmembercount do
		misIndex = GetMissionIndexByID( sceneId, members[i], x050100_g_MissionId )

		if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑to� 鸬 状态
			--将任务to� 鸬 第1号数据设置为副本to� 鸬 场景号
			SetMissionByIndex( sceneId, members[i], misIndex, x050100_g_Param_sceneid, destsceneId )
	--		SetMissionEvent( sceneId, members[i], x050100_g_MissionId, 0 )			-- 关心杀怪事件
			NewWorld( sceneId, members[i], destsceneId, x050100_g_Fuben_X, x050100_g_Fuben_Z )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x050100_OnPlayerEnter( sceneId, selfId )
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x050100_g_Fuben_Relive_X, x050100_g_Fuben_Relive_Z )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050100_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		return
	end

	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050100_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态,则杀怪无效
		return
	end

	--取 餴琺杀死怪物to� 鸬 GroupID
	local GroupID = GetMonsterGroupID( sceneId, objId )
	local killedMonsterIndex, killedCount = 0, 0
	for i = 1, getn( x050100_g_DemandKillGroup ) do
		if GroupID == x050100_g_DemandKillGroup[i] then
			killedMonsterIndex = i
			killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
			LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- 杀死Bossito� 鸬 数量
			break
		end
	end

	if killedMonsterIndex == 0 then													-- 杀死了m祎 c醝不相关怪
		return
	end

	if x050100_g_BossGroup == GroupID then
		local BroadcastMsg = x050100_g_BroadcastMsg[ random( getn(x050100_g_BroadcastMsg) ) ]
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )
	end

	local maxKilledCount = x050100_g_DemandKill[killedMonsterIndex].num

	--取 餴琺当前场景里to� 鸬 人数
	local i, humanObjId, misIndex
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local strText = format( "秀 gi猼 %s: %d/%d", GetName( sceneId, objId ), killedCount, maxKilledCount )
	for i = 0, num - 1 do
		humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- 取 餴琺当前场景里人to� 鸬 objId

		if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then						-- 不T読 场景to� 鸬 不做此操作
			x050100_NotifyFailTips( sceneId, humanObjId, strText )
			Msg2Player( sceneId, humanObjId, strText, MSG2PLAYER_PARA )
			misIndex = GetMissionIndexByID( sceneId, humanObjId, x050100_g_MissionId )
			SetMissionByIndex( sceneId, humanObjId, misIndex, killedMonsterIndex, killedCount )	-- 刷新杀怪数量

			-- 杀死所有怪没有放走m祎 c醝则T読 中央大营前刷出boss[余毒],杀死后副本任务完成.(余毒身上必掉任务道具”余毒to� 鸬 令牌”)
			if x050100_g_BossGroup == GroupID then
				-- 杀死了也不关闭副本,因为要等所有人都捡令牌……
				AddMonsterDropItem( sceneId, objId, humanObjId, x050100_g_Token )

				SetMissionByIndex( sceneId, humanObjId, misIndex, x050100_g_IsMissionOkFail, 1 )	-- 任务完成
			end
		end
	end

	-- 杀死地图中央to� 鸬 小boss[伪装to� 鸬 宋兵都统]5 gi鈟后,T読 地图下方刷出10只沿路线逃窜to� 鸬 小怪
	if x050100_g_LittleBossGroup == GroupID then									-- 杀死了小 Boss
		LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- 喧ng否杀死小 Boss
	end

	-- 杀死所有怪没有放走m祎 c醝则T読 中央大营前刷出boss[余毒]
	local bigBossFlag = 1
	for i = 1, 4 do
		if LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) < x050100_g_DemandKill[i].num then
			bigBossFlag = 0
			break
		end
	end

	if bigBossFlag == 1 then
		if LuaFnGetCopySceneData_Param( sceneId, 15 ) > 0 then					-- 不C 再刷 Boss 了
			return
		end

		local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
		if not x050100_g_Boss[bossGrade] then
			return
		end

		local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
		local bossId = LuaFnCreateMonster( sceneId, x050100_g_Boss[bossGrade], 55, 67, 14, 126, -1 )
		SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
		SetCharacterTitle(sceneId, bossId, "")
		SetMonsterGroupID( sceneId, bossId, x050100_g_BossGroup )
		LuaFnSetCopySceneData_Param( sceneId, 15, 1 )
	end
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x050100_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--离开副本
--**********************************
function x050100_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取 餴琺副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x050100_g_Back_X, x050100_g_Back_Z )
end

--**********************************
--放弃
--**********************************
function x050100_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050100_g_Param_sceneid )


	-- 设置放弃连环任务to� 鸬 时间
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()											-- 当前时间
	local CurTime = GetQuarterTime()											-- 当前时间
	--end modified by zhangguoxin 090207
	SetMissionData( sceneId, selfId, MD_ROUNDMISSION1, CurTime )

	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x050100_g_MissionId )
	
	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050100_g_CopySceneType then											-- 如果T読 副本里删除任务,则直接传送回
		x050100_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- 取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x050100_g_Back_X, x050100_g_Back_Z )
	end
end


--**********************************
--副本场景定时器事件
--**********************************
function x050100_OnCopySceneTimer( sceneId, nowTime )
	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						-- 取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							-- 设置新to� 鸬 定时器调用次数

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )

	if leaveFlag == 1 then															-- C 离开
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x050100_g_CloseTick then										-- 倒计时间到,大家都出去吧
			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍!", ( x050100_g_CloseTick - leaveTickCount ) * x050100_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050100_g_LimitTotalHoldTime then									-- 副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050100_NotifyFailTips( sceneId, mems[i], "Th秈 gian nhi甿 v� 疸 h猼, r秈 c鋘h..." )
				x050100_Exit( sceneId, mems[i] )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--定时检查队伍成员to� 鸬 队伍号,如果不符合,则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取 餴琺保存to� 鸬 队伍号
		local oldsceneId

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050100_NotifyFailTips( sceneId, mems[i], "Ng呓i kh鬾g � trong 瘊ng 鸬i, r秈 c鋘h..." )
				x050100_Exit( sceneId, mems[i] )
			end
		end

		-- 每 ph鷗提示玩家剩余时间
		if mod( x050100_g_TickTime * TickCount, 60 ) < x050100_g_TickTime and TickCount < x050100_g_LimitTotalHoldTime then
			local str = "C騨 l読 " .. ( x050100_g_LimitTotalHoldTime - TickCount ) * x050100_g_TickTime / 60 .. " Ph鷗..."
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_NotifyFailTips( sceneId, mems[i], str )
				end
			end
		end

		-- 副本进行15 ph鷗时会T読 队长玩家身边刷出小boss: 伪装to� 鸬 宋兵副都统
		if TickCount == x050100_g_LoadBossTick then
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			if not x050100_g_LittleBoss[bossGrade] then
				return
			end

			local PosX, PosZ = 55, 66												-- 避免出现队伍成员死光光啊死光光
			for	i = 0, membercount - 1 do
				PosX, PosZ = LuaFnGetWorldPos( sceneId, mems[i] )					-- 避免出现未找到队长to� 鸬 意外
				if LuaFnIsTeamLeader( sceneId, mems[i] ) == 1 then
					break
				end
			end

			local bossId = LuaFnCreateMonster( sceneId, x050100_g_LittleBoss[bossGrade], PosX, PosZ, 14, 124, -1 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetMonsterGroupID( sceneId, bossId, x050100_g_ViceBossGroup )
		end

		-- 杀死地图中央to� 鸬 小boss[伪装to� 鸬 宋兵都统]5 gi鈟后,T読 地图下方刷出10只沿路线逃窜to� 鸬 小怪
		local flag = LuaFnGetCopySceneData_Param( sceneId, 12 )
		if flag > 0 then
			if flag == 1 then
				LuaFnSetCopySceneData_Param( sceneId, 12, 2 )						-- 等m祎 轮再出小怪
			elseif flag == 2 then
				LuaFnSetCopySceneData_Param( sceneId, 12, 0 )

				local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
				if not x050100_g_Dogface[bossGrade] then
					return
				end

				local dogfaceId = -1
				for i = 1, getn( x050100_g_DogfacePos ) do
					if x050100_g_DogfacePos[i] then
						dogfaceId = LuaFnCreateMonster( sceneId, x050100_g_Dogface[bossGrade], x050100_g_DogfacePos[i][1], x050100_g_DogfacePos[i][2], 1, 4, -1 )
						SetLevel( sceneId, dogfaceId, GetLevel( sceneId, dogfaceId ) + LevelGap )
						SetMonsterGroupID( sceneId, dogfaceId, x050100_g_DogfaceGroup )
						SetPatrolId( sceneId, dogfaceId, x050100_g_DogfacePos[i][3] )		-- 设置巡逻路径
					end
				end
			end
		end

		-- 小怪沿路线到达指定区域则消失
		-- 当有m祎 c醝小怪逃走后T読 屏幕上方提示玩家: “逃窜匪类逃出,贼人头目闻风藏匿,任务th b読.”
		local monstercount = GetMonsterCount( sceneId )
		local monsterId, GroupID, DogX, DogZ, misIndex
		local x, z = GetLastPatrolPoint( sceneId, 5 )

		for i = 0, monstercount - 1 do
			monsterId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, monsterId )

			if GroupID == x050100_g_DogfaceGroup
			 and LuaFnIsCharacterLiving( sceneId, monsterId ) == 1 then			-- 判断活着to� 鸬 小兵喧ng否逃跑成功
				DogX, DogZ = GetWorldPos( sceneId, monsterId )

				if (x - DogX) * (x - DogX) + (z - DogZ) * (z - DogZ) < 25 then	-- 离终 餴琺不到 5 米
					if LuaFnGetCopySceneData_Param( sceneId, 14 ) < 1 then		-- 第m祎 次小兵逃跑
						LuaFnSetCopySceneData_Param( sceneId, 14, 1 )			-- 喧ng否已经有小怪逃走

						for	i = 0, membercount - 1 do
							if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
								misIndex = GetMissionIndexByID( sceneId, mems[i], x050100_g_MissionId )
								SetMissionByIndex( sceneId, mems[i], misIndex, x050100_g_IsMissionOkFail, 2 )	-- 任务th b読
								x050100_NotifyFailTips( sceneId, mems[i], "B鱪 c呔p 疸 ch誽 tr痭 ra kh鰅 n鷌, t阯 c 馥u 疸 疳nh 疬㧟 h絠 tr痭 m, nhi甿 v� th b読" )
							end
						end
					end

					LuaFnDeleteMonster( sceneId, monsterId )
				end
			end
		end

--		if GetMonsterCount( sceneId ) < 1 then
--			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
--		end
	end
end

--**********************************
--继续
--**********************************
function x050100_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050100_g_MissionName )
		AddText( sceneId, x050100_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x050100_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )				--  餴琺到任务to� 鸬 序列号
	if GetMissionParam( sceneId, selfId, misIndex, x050100_g_IsMissionOkFail ) ~= 1 then
		return 0
	end

	local nItemNum = GetItemCount( sceneId, selfId, x050100_g_Token )
	if nItemNum < 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x050100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x050100_CheckSubmit( sceneId, selfId ) == 1 then
		-- 不扣东西,直接完成
		x050100_NotifyFailBox( sceneId, selfId, targetId, x050100_g_MissionComplete )
		DelMission( sceneId, selfId, x050100_g_MissionId )
		-- 任务籱祎 疃臣�
		LuaFnAuditQuest(sceneId, selfId, "Bi阯 gi緄 T痭g Li陁")
		local strText = x050100_g_MissionName .. "Nhi甿 v� 疸 ho鄋 th鄋h"
		x050100_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050100_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x050100_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
