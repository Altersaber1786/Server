--L誧 D呓ngNPC 材料加工技能NPC   包含功能: 1材料加工技能to� 鸬 学习 2讲解材料加工技能
--冯铸铁
--普通

--脚本号
x000141_g_ScriptId = 000141

--商店编号
x000141_g_shoptableindex = 167

--所拥有to� 鸬 事件Id列表
--estudy_cailiaojiagong = 713538


--所拥有to� 鸬 事件ID列表
x000141_g_eventList={713538}
--**********************************
--事件列表
--**********************************
function x000141_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Mu痭 h鱟 k� n錸g gia c鬾g nguy阯 li畊 kh鬾g ? H銀 ch鱪  v鄌 d騨g \"H鱟 gia c鬾g nguy阯 li畊\"d呔i 疴y, l� c� th� h鱟 k� n錸g gia c鬾g nguy阯 li畊.")
	AddText(sceneId,"  Gia c鬾g nguy阯 li畊 c ph鋓 c� t韓h ki阯 nh鏽, m緄 c� th� ch� t誳 ra l唼ng l緉 th鄋h ph h䅟 th鄋h, c醕 lo読 th鄋h ph n鄖 r c thi猼 瓞 h鱟 c鬾g ngh�, ch� t誳, may m 3 lo読 k� n錸g s痭g, n猽 c醕 h� mu痭 th錸g c c鬾g ngh�, ch� t誳 v� may m 3 lo読 k� n錸g n鄖 th� th� ph鋓 h鱟 gia c鬾g nguy阯 li畊 r癷!")
	AddText(sceneId,"  Ch� �: H鱟 \"Gia c鬾g nguy阯 li畊\" c t痭 #{_MONEY10000}, 鹱ng quen mang theo nh�!")
	for i, eventId in x000141_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x000141_g_ScriptId,"Mua ph痠 ph呓ng gia c鬾g nguy阯 li畊 ",7, 99 )
	AddNumText( sceneId, x000141_g_ScriptId, "Gi緄 thi畊 gia c鬾g nguy阯 li畊 ", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000141_OnDefaultEvent( sceneId, selfId,targetId )
	x000141_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000141_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{HELP_CLJG}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText() == 99	then
		DispatchShopItem( sceneId, selfId,targetId, x000141_g_shoptableindex )
	end
	for i, findId in x000141_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000141_g_ScriptId )
		return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000141_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x000141_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000141_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000141_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--死亡事件
--**********************************
function x000141_OnDie( sceneId, selfId, killerId )
end
