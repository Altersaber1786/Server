-- 中秋任务副本回恤n Ho鄋gto� 鸬 传送 餴琺

x050011_g_ScriptId = 050011
x050011_g_ControlScript = 050010

-- 玩家进入传送 餴琺
function x050011_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x050011_g_ControlScript, "Exit", sceneId, selfId )
end

-- 玩家停留T読 传送 餴琺
function x050011_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送 餴琺
function x050011_OnLeaveArea( sceneId, selfId )
	return
end
