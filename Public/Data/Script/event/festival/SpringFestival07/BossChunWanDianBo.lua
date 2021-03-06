--BOSS春晚 餴琺播脚本

--脚本号
x050044_g_ScriptId = 050044

--春晚主控脚本脚本号....
x050044_g_MainScriptId = 050030

--普通 餴琺播券节目表....
x050044_g_ChapterTblA = {

	[1] = { id=2,  name="歌曲: 向天再借五百年"				},
	[2] = { id=3,  name="歌曲: 保卫三连环"						},
	[3] = { id=5,  name="歌曲: 健康歌"								},
	[4] = { id=6,  name="小品: 企鹅王to� 鸬 故事"					},
	[5] = { id=8,  name="歌曲: 双节棍"								},
	[6] = { id=10, name="小品: m祎 见钟情"							}

}

--高c 餴琺播券节目表....
x050044_g_ChapterTblB = {

	[1] = { id=2,  name="歌曲: 向天再借五百年"				},
	[2] = { id=3,  name="歌曲: 保卫三连环"						},
	[3] = { id=5,  name="歌曲: 健康歌"								},
	[4] = { id=6,  name="小品: 企鹅王to� 鸬 故事"					},
	[5] = { id=7,  name="舞蹈: 肚皮舞"								},
	[6] = { id=8,  name="歌曲: 双节棍"								},
	[7] = { id=10, name="小品: m祎 见钟情"							},
	[8] = { id=11, name="歌曲: 我们喧ng极品宝物接班人"	}

}

--普通 餴琺播券ID....
x050044_g_TicketIdA = 30900046

--高c 餴琺播券ID....
x050044_g_TicketIdB = 30900047


--**********************************
--事件交互入口
--**********************************
function x050044_OnDefaultEvent( sceneId, selfId,targetId )

	local NumText = GetNumText()

	if NumText == 0	then

		--显示普通 餴琺播券节目列表....
		BeginEvent(sceneId)
			AddText(sceneId,"#{CWDB_20080225_02}")
			local ChapterCount = getn( x050044_g_ChapterTblA )
			for i=1, ChapterCount do
				AddNumText( sceneId, x050044_g_ScriptId, x050044_g_ChapterTblA[i].name, 6, i+100 )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 1	then

		--显示高c 餴琺播券节目列表....
		BeginEvent(sceneId)
			AddText(sceneId,"#{CWDB_20080225_03}")
			local ChapterCount = getn( x050044_g_ChapterTblB )
			for i=1, ChapterCount do
				AddNumText( sceneId, x050044_g_ScriptId, x050044_g_ChapterTblB[i].name, 6, i+200 )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

	if NumText > 200 then

		--使用高c 餴琺播券 餴琺播节目....
		x050044_DianBo( sceneId, selfId, targetId, 2, NumText - 200 )

	elseif NumText > 100 then

		--使用普通 餴琺播券 餴琺播节目....
		x050044_DianBo( sceneId, selfId, targetId, 1, NumText - 100 )

	end

end


--**********************************
--列举事件
--**********************************
function x050044_OnEnumerate( sceneId, selfId, targetId )

--		AddNumText( sceneId, x050044_g_ScriptId, "普通 餴琺播券 餴琺播", 6, 0 )
--		AddNumText( sceneId, x050044_g_ScriptId, "高c 餴琺播券 餴琺播", 6, 1 )

end


--**********************************
-- 餴琺播指定节目....
--**********************************
function x050044_DianBo( sceneId, selfId, targetId, type, idx )

	--检测当前喧ng否T読 播放节目....
	if 1 == CallScriptFunction( x050044_g_MainScriptId, "IsChapterPlaying", sceneId ) then
		BeginEvent(sceneId)
			AddText( sceneId, "#{CWDB_20080225_04}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	local ChapterData = nil
	if type == 1 then
		ChapterData = x050044_g_ChapterTblA[idx]
	elseif type == 2 then
		ChapterData = x050044_g_ChapterTblB[idx]
	end
	if not ChapterData then
		return
	end

	local needItemId = -1
	if type == 1 then
		needItemId = x050044_g_TicketIdA
	elseif type == 2 then
		needItemId = x050044_g_TicketIdB
	end

	local needItemName = "#{_ITEM"..needItemId.."}"
	local msgNoItem = "您没有携带"..needItemName..",所以无法 餴琺播节目哦!"

	--检测喧ng否有 餴琺播道具....
	if LuaFnGetAvailableItemCount(sceneId, selfId, needItemId) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	--删除前获取道具to� 鸬 Transfer....
	local itemPos = GetItemBagPos( sceneId, selfId, needItemId, 1 )
	if itemPos < 0 then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	local needItemTransfer = GetBagItemTransfer(sceneId,selfId,itemPos)

	--删除 餴琺播道具....
	if 1 ~= LuaFnDelAvailableItem( sceneId, selfId, needItemId, 1 ) then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	-- 餴琺播....
	CallScriptFunction( x050044_g_MainScriptId, "PlayChapter", sceneId, ChapterData.id )

	--公告....
	local PlayerName = GetName(sceneId, selfId)
	local str
	if type == 1 then
		str = format( "#{_INFOUSR%s}#PS� d鴑g #{_INFOMSG%s}#P,可以 餴琺播新春BOSS联欢会to� 鸬 绝大部分节目哦,Tinh彩不容错过�..�", PlayerName, needItemTransfer )
	elseif type == 2 then
		str = format( "#{_INFOUSR%s}#PS� d鴑g #{_INFOMSG%s}#P,新春BOSS联欢会节目随意 餴琺,Tinh彩不容错过哦�..�", PlayerName, needItemTransfer )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )

	--关闭对话框....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end
