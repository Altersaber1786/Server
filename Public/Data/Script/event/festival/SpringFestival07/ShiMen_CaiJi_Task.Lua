
--MisDescBegin
--脚本号
x050061_g_ScriptId	= 050061

--Ti猵 th挝馧PC属性
x050061_g_Position_X=78
x050061_g_Position_Z=95
x050061_g_SceneID=12
x050061_g_AccomplishNPC_Name="Tr呓ng Trung H鄋h"

--当前任务号
x050061_g_MissionId			= 1150
--下m祎 c醝任务to� 鸬 ID
x050061_g_MissionIdNext	= -1
--M鴆 ti陁 nhi甿 v鴑pc
x050061_g_Name 					= ""
--任务归类
x050061_g_MissionKind			= 3
--衅ng c nhi甿 v� 
x050061_g_MissionLevel		= 10000
--喧ng否喧ngTinh英任务
x050061_g_IfMissionElite	= 0
--任务喧ng否已经完成
x050061_g_IsMissionOkFail	= 0		--任务参数to� 鸬 第0位

--x050059_g_MissionRound = 249

--喧ng否显示任务完成
x050061_g_AccomplishCircumstance = 0

--任务文本描述
x050061_g_MissionName			= "Mua s 鸢 t猼 M鬾 ph醝"
--任务描述
x050061_g_MissionInfo			= ""
--M鴆 ti陁 nhi甿 v�
x050061_g_MissionTarget		= "%f"
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x050061_g_ContinueInfo		= ""
--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话
x050061_g_MissionComplete	= ""
--每次活动可以完成to� 鸬 次数
x050061_g_MaxRound	= 3

--用来保存字符串格式化to� 鸬 数据
x050061_g_FormatList = {
								"#{SMCJ_081021_29}",
								"#{SMCJ_081021_30}",
								"#{SMCJ_081021_31}",
								"#{SMCJ_081021_32}",
								"#{SMCJ_081021_33}",
								"#{SMCJ_081021_34}",
								"#{SMCJ_081021_35}",
								"#{SMCJ_081021_36}",
								"#{SMCJ_081021_37}",
								"#{SMCJ_081021_38}",
								"#{SMCJ_081021_39}",
								"#{SMCJ_081021_40}",
								"#{SMCJ_081021_41}",
								"#{SMCJ_081021_42}",
								"#{SMCJ_081021_43}",
								"#{SMCJ_081021_44}",
								"#{SMCJ_081021_45}",
								"#{SMCJ_081021_46}",
								}


-- 任务完成情况,内容动态刷新,占用任务参数to� 鸬 第1,2位
x050061_g_Custom	=  { {id="#YNhi甿 v� tr呔c m ho鄋 s�",num=8}}
--MisDescEnd

x050061_G_RefID = 050059


function x050061_GetStrIndexByStrValue(stringV)
	for i, v in x050061_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("C ph鋓 %s 疱ng k� StrList trong", stringV)
	----PrintStr(strText)
	return 0;
end

function x050061_OnEnumerate( sceneId, selfId, targetId )
	CallScriptFunction(x050061_G_RefID,"OnEnumerate",sceneId,selfId,targetId,x050061_g_ScriptId)
end

function x050061_OnDefaultEvent( sceneId, selfId, targetId,MenPai)
	CallScriptFunction(x050061_G_RefID,"OnDefaultEvent",sceneId, selfId, targetId,MenPai,x050061_g_MissionId,x050061_g_ScriptId)
end

function x050061_OnContinue( sceneId, selfId, targetId )
	CallScriptFunction( x050061_G_RefID, "OnContinue",sceneId, selfId, targetId,x050061_g_MissionId,x050061_g_ScriptId)
end

--**********************************
--提交
--**********************************
function x050061_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	CallScriptFunction( x050061_G_RefID, "OnSubmit",sceneId, selfId, targetId, selectRadioId,x050061_g_MissionId,x050061_g_ScriptId)
end

function x050061_OnItemChanged( sceneId, selfId, itemdataId )
	CallScriptFunction( x050061_G_RefID, "OnItemChanged",sceneId, selfId, itemdataId,x050061_g_MissionId,x050061_g_ScriptId)
end

--**********************************
--继续
--**********************************
function x050061_OnContinue( sceneId, selfId, targetId)
	CallScriptFunction(x050061_G_RefID,"OnContinue",sceneId, selfId, targetId,x050061_g_MissionId,x050061_g_ScriptId)
end

--**********************************
--放弃
--**********************************
function x050061_OnAbandon( sceneId, selfId)
	CallScriptFunction(x050061_G_RefID,"OnAbandon",sceneId, selfId,x050061_g_MissionId)
end

