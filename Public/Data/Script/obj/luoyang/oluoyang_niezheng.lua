-- L誧 D呓ngNPC
-- 聂政
-- 普通

--脚本号
x000111_g_ScriptId = 000111

--目标NPC
x000111_g_name = "聂政"

--所拥有to� 鸬 事件ID列表 {收徒,出师,逐出师门,叛师,升c师德等c,师徒情深奖励}
--x000111_g_RelationEventList = { 806008, 806007, 806009, 806006, 806015 }
--去掉出师to� 鸬 设定
x000111_g_RelationEventList = { 806019, 806008, 806009, 806006, 806015, 806018 }

--**********************************
--事件交互入口
--**********************************
function x000111_OnDefaultEvent( sceneId, selfId, targetId )
	x000111_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表
--**********************************
function x000111_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local i, eventId
		--zchw
		--AddNumText( sceneId, x000111_g_ScriptId, "师徒心连心", 6, 123)
		AddText( sceneId, "#{OBJ_luoyang_0030}" )
--		AddNumText( sceneId, x000111_g_ScriptId, "我想了解m祎 下怎样拜师", 11, 1 )
		
		for i, eventId in x000111_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end

		
		
--	AddNumText( sceneId, x000111_g_ScriptId, "查看师德 餴琺数", 6, 2 )
		AddNumText( sceneId, x000111_g_ScriptId, "Ta mu痭 d鵱g 餴琺 Thi畁 醕 nh l頽h kinh nghi甿", 6, 3 )
		AddNumText( sceneId, x000111_g_ScriptId, "Xu s�", 6, 10 )
		AddNumText( sceneId, x000111_g_ScriptId, "Gi緄 thi畊 s� 鸢", 11, 4 )
		--AddNumText( sceneId, x000111_g_ScriptId, "关于师徒心连心", 11, 321)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000111_OnEventRequest( sceneId, selfId, targetId, eventId )
	local strText
	local	nMlevel	= LuaFnGetmasterLevel( sceneId, selfId )

	if eventId == x000111_g_ScriptId then

		if GetNumText() == 1 then							-- 了解怎么拜师
			BeginEvent( sceneId )
			AddText( sceneId, "#{OBJ_luoyang_0032}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		
		elseif GetNumText() == 4 then					-- 师徒介绍
			BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_050}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )

		elseif GetNumText() == 2 then					-- 查看师德 餴琺数
			BeginEvent( sceneId )
			strText = format( "  S� 餴琺 s� 鹧c hi畁 c�: %d", LuaFnGetMasterMoralPoint( sceneId, selfId ) )
			AddText( sceneId, strText )
			strText = format( "  T韈h l鹹 s� 餴琺 s� 鹧c: %d", LuaFnGetMasterMoralPoint( sceneId, selfId ) )
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )

		elseif GetNumText() == 10 then
			local HumanLevel = LuaFnGetLevel( sceneId, selfId )
			
			if HumanLevel < 45 then--小于45c
				x000111_MyMsgBox( sceneId, selfId, targetId, "#{STGZ_20080520_5}" )
				return
			end
			
			
			
			if LuaFnHaveMaster( sceneId, selfId ) == 0 then--没有师傅
				x000111_MyMsgBox( sceneId, selfId, targetId, "#{STGZ_20080520_6}" )
				return
			end
			
			--检查喧ng否已经出过师
			if GetMissionFlag(sceneId, selfId, MF_ShiTu_ChuShi_Flag) == 1 then --表示已经出师
				x000111_MyMsgBox( sceneId, selfId, targetId, "#{STGZ_20080520_6}" )
				return
			end
				
			--出师设置出师标志
			SetMissionFlag(sceneId, selfId, MF_ShiTu_ChuShi_Flag, 1)
			
			--发送可执行邮件
			LuaFnChuShiMail(sceneId, selfId)
						
			x000111_MyMsgBox( sceneId, selfId, targetId, "#{STGZ_20080520_1}" )
			
			return
		
		elseif GetNumText() == 3 then					-- 善恶值换Kinh nghi甿
			if nMlevel < 1 or nMlevel > 4 then
				x000111_MyMsgBox( sceneId, selfId, targetId, "  衅ng c s� 鹧c kh鬾g 瘘" )
				return
			end
			if LuaGetPrenticeSupplyExp( sceneId, selfId ) == 0 then
				x000111_MyMsgBox( sceneId, selfId, targetId, "  Kh鬾g c� kinh nghi甿 c� th� l頽h" )
				return
			end
			--打开客户端善恶值秏祎 籏inh nghi甿窗口
			LuaFnExpAssign( sceneId, selfId, 1 )
			--关闭窗口
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		-- add by zchw
		elseif GetNumText() == 123 then
			--检查等c
			local HumanLevel = LuaFnGetLevel( sceneId, selfId )
			
			if HumanLevel < 30 then--小于45c
				x000111_MyMsgBox( sceneId, selfId, targetId, "30c以上才可领�.�" );
				return
			end
			--检测玩家参加活动to� 鸬 时间
			local	nDayTime = GetMissionData( sceneId, selfId, MD_SHITU_XINLIANXIN );
			local nDay = LuaFnGetDayOfThisMonth()
			if nDayTime == nDay then
				x000111_MyMsgBox(sceneId, selfId, targetId, "对不起,你今天已经参加过此活动了,请明天再来!");
				return
			end

			-- 1,检测玩家身上喧ng不喧ng有位置能够放下物品
			BeginAddItem(sceneId)
				AddItem( sceneId, 30008045, 1 ); --大礼包			
			if EndAddItem(sceneId,selfId)	< 1 then
				return
			end
			-- 给礼包
			AddItemListToHuman(sceneId,selfId);
			-- 提示信息
			x000111_MyMsgBox(sceneId, selfId, targetId, "我这里有m祎 c醝师徒大礼包 疬a cho 你,好好利用吧!");
			BeginEvent(sceneId)
				strText = "你收到m祎 c醝师徒大礼包!";
				AddText(sceneId, strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, selfId)
			-- 记录L頽h 时间
			SetMissionData( sceneId, selfId, MD_SHITU_XINLIANXIN, nDay );
			-- 记录参与日志
			AuditJoinJiaoShiJie(sceneId, selfId);
		elseif GetNumText() == 321 then --师徒心连心介绍
				x000111_MyMsgBox(sceneId, selfId, targetId, "m祎 年m祎 度to� 鸬 教师节即将来临啦！所有30c以上to� 鸬 英雄都可以去聂政姓i L�(170,123)处L頽h 师徒大礼包.使用大礼包还会有意外收获哦!");
				return			
		-- end of zchw
		end
				
		
		return
	end

	local i, findId
	for i, findId in x000111_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
--		x000111_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000111_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x000111_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x000111_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000111_g_RelationEventList do
		if missionScriptId == findId then
			x000111_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--对话框提示
--**********************************
function x000111_MyMsgBox( sceneId, selfId, targetId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
