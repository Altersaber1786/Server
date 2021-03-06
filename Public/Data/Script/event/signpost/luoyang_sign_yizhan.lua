-- L誧 D呓ng
--驿站
--问路脚本
x500002_g_scriptId = 500002

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500002_g_Signpost = {
	{ type=2, name="D竎h tr誱", x=139, y=182, tip="Ng� 醒c X呓ng ", desc="詎g ch� D竎h tr誱 Ng� 醒c X呓ng (139, 182) � D竎h tr誱 gi鎍 疬秐g l緉 ph韆 Nam v� T鈟 Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="C豼 Ch鈛 th呓ng h礽 v chuy琻", x=230, y=129, tip="U鬾g H課", desc="C豼 Ch鈛 th呓ng h礽 v U鬾g H課 (230, 129) � 疬秐g l緉 ph韆 恤ng. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500002_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500002_g_Signpost do
		AddNumText(sceneId, x500002_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500002_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500002_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ": ")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

end
