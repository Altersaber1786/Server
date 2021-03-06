--Li陁 T鈟 衭眎 theo H Phong
--MisDescBegin
--脚本号
x212107_g_ScriptId = 212107

--任务号
x212107_g_MissionId = 552

--任务归类
x212107_g_MissionKind = 32

--衅ng c nhi甿 v� 
x212107_g_MissionLevel = 75

--喧ng否喧ngTinh英任务
x212107_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
--任务喧ng否已经完成
x212107_g_IsMissionOkFail = 0		--变量to� 鸬 第0位
x212107_g_Custom	= { {id="秀 鸠t ph鈔 s骾 kh�",num=1} }

--以上喧ng动态**************************************************************

--任务C  餴琺到to� 鸬 物品
--x212107_g_DemandItem={{id=40002112,num=1}}		--变量第1位

--任务文本描述
x212107_g_MissionName="衭眎 theo H Phong"
x212107_g_MissionInfo="#{Lua_liaoxi_001}"
x212107_g_MissionTarget="  D鵱g l豠 鸠t ph鈔 s骾 kh�, xua 饀眎 H Phong, sau 痼 皙n #GQu鋘g Ninh Tr#W, b醥 c醥 cho #RB� Nhan #W#{_INFOAIM164,199,21, B� Nhan} ph醫 hi畁 c黙 c醕 h�."
x212107_g_ContinueInfo="  Ng呓i 疸 饀眎 H Phong 餴 ch遖?"
x212107_g_MissionComplete="  Ng叨i tr� tu眎, ng呓i ch韓h l� c製 tinh c黙 ch鷑g ta. Thay m t c� t礳 nh鈔 ta, ta xin c鋗 t� s� gi鷓 疝 c黙 c醕 h�. Ch鷑g ta s� m鉯 kh鬾g qu阯"

--奖励
x212107_g_MoneyBonus=49800
x212107_g_Exp = 45000
--x212107_g_ItemBonus={{id=30003007,num=5}}
x212107_g_RadioItemBonus={{id=10411081 ,num=1},{id=10412074,num=1}}


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212107_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果已接此任务
	if IsMissionHaveDone( sceneId, selfId, x212107_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212107_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212107_g_Name then
			--发送交任务前to� 鸬 需求信息
			BeginEvent(sceneId)
				AddText(sceneId,x212107_g_MissionName);
				AddText(sceneId,x212107_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212107_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId,done)
--		end
	--Th鯽 m鉵任务接收条件
	elseif GetLevel( sceneId, selfId ) >= 75 then
	
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x212107_g_MissionName);
			AddText(sceneId,x212107_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212107_g_MissionTarget);
			AddMoneyBonus( sceneId, x212107_g_MoneyBonus )
			for i, item in x212107_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId)

	end
end

--**********************************
--列举事件
--**********************************
function x212107_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x212107_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212107_g_MissionId) > 0 then
		AddNumText(sceneId, x212107_g_ScriptId,x212107_g_MissionName, 2, -1)

	--Th鯽 m鉵任务接收条件
	elseif x212107_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212107_g_MissionName then
			AddNumText(sceneId, x212107_g_ScriptId, x212107_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--检测触发条件
--**********************************
function x212107_CheckAccept( sceneId, selfId )
	--C 60c才能接
	if GetLevel( sceneId, selfId ) >= 75 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x212107_OnAccept( sceneId, selfId )

	-- 检测玩家喧ng不喧ng已经完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId, selfId, x212107_g_MissionId) > 0   then
		return
	end
	
	if x212107_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	-- 生成m祎 c醝任务道具
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002070, 1)
		--AddItem( sceneId, 40002069, 1)
	local retItem = EndAddItem(sceneId,selfId)

	if retItem < 0   then
		Msg2Player(  sceneId, selfId,"#YTay n鋓 nhi甿 v� 疸 馥y#W", MSG2PLAYER_PARA )
		return 
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212107_g_MissionId, x212107_g_ScriptId, 0, 0, 0 )
	-- C 考虑玩家喧ng不喧ng能够Ti猵 th紺醝 n鄖 任务
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	-- 加任务物品
	AddItemListToHuman(sceneId,selfId)
	
	SetMissionEvent(sceneId, selfId, x212107_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x212107_g_MissionId, 2)
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212107_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--根据序列号把任务变量to� 鸬 第0位置1 (任务完成情况)
	
	-- 消息通知客户端
	Msg2Player(  sceneId, selfId,"#YTi猵 nh#W ".. x212107_g_MissionName, MSG2PLAYER_PARA )

	BeginEvent(sceneId)
		strText = "#YTi猵 nh#W ".. x212107_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x212107_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x212107_g_MissionId )
	
	-- 删除任务道具
	DelItem( sceneId, selfId, 40002070, 1 )
	DelItem( sceneId, selfId, 40002069, 1 )

end

--**********************************
--已经接了任务再给出to� 鸬 提示
--**********************************
function x212107_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
	BeginEvent(sceneId)
		AddText(sceneId,x212107_g_MissionName)
		AddText(sceneId,x212107_g_MissionComplete)
		AddMoneyBonus( sceneId, x212107_g_MoneyBonus )
		for i, item in x212107_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212107_CheckSubmit( sceneId, selfId )
	--检测条件喧ng看任务中to� 鸬 标记喧ng不喧ng被改为1了
	misIndex = GetMissionIndexByID(sceneId,selfId,x212107_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0  then
		return 1
	end
	return 0
end

--**********************************
--提交(完成)
--**********************************
function x212107_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- 安全性检测
	-- 1、检测玩家喧ng不喧ng有C醝 n鄖 任务
	if IsHaveMission(sceneId,selfId,x212107_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212107_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212107_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)

	--添加任务奖励
	if ret > 0 then		
		-- 删除任务道具
		DelItem( sceneId, selfId, 40002070, 1 )
		DelItem( sceneId, selfId, 40002069, 1 )

		AddExp(sceneId,selfId,x212107_g_Exp)
		AddMoney(sceneId,selfId,x212107_g_MoneyBonus );
		DelMission( sceneId, selfId, x212107_g_MissionId )
		MissionCom( sceneId, selfId, x212107_g_MissionId )
		AddItemListToHuman(sceneId,selfId)

	else
	--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212107_OnKillObject( sceneId, selfId, objdataId ,objId )
	-- 如果完家杀了白狼大王,可以 鹫t 疬㧟另m祎 c醝道具“干狼粪”
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == " B誧h Lang V呓ng "   then
		--取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x212107_g_MissionId) > 0 then
				-- 先判断喧ng不喧ng已经Th鯽 m鉵了完成标志
				local nMisIndex = GetMissionIndexByID(sceneId,humanObjId,x212107_g_MissionId)
				
				-- 检测玩家身上喧ng不喧ng有C醝 n鄖 物品了,有了就不再掉了
				if GetMissionParam(sceneId, humanObjId, nMisIndex, 0) == 0  and
						GetItemCount(sceneId, humanObjId, 40002069) == 0 then
					AddMonsterDropItem(sceneId,objId,humanObjId, 40002069)
				end
			end
		end
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x212107_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212107_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 40002069  then
	 	BeginEvent(sceneId)
			AddText(sceneId, "秀 l 疬㧟 ph鈔 s骾 kh�: 1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

