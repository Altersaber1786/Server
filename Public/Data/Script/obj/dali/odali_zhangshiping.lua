--张世平

--脚本号
x002076_g_scriptId 				= 002076
x002076_g_shoptableindex	=	33
--**********************************
--事件交互入口
--**********************************
function x002076_OnDefaultEvent( sceneId, selfId,targetId )
	AddText( sceneId, "#{QZG_80919_1}" )
	AddNumText( sceneId, x002076_g_scriptId, "Gi緄 thi畊 th呓ng nh鈔", 11, 1 )
	AddNumText( sceneId, x002076_g_scriptId, "M� c豠 h鄋g", 7, 2 )
end


--**********************************
--事件列表选中m祎 项
--**********************************
function x002076_OnEventRequest( sceneId, selfId, targetId, eventId )
	--特产商店
	if GetNumText() == 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SHANGREN_JIESHAO_02}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		if(LuaFnGetAvailableItemCount(sceneId, selfId, 40002000) == 1 ) then
			DispatchShopItem( sceneId, selfId, targetId, x002076_g_shoptableindex )
		else
			BeginEvent(sceneId)
				AddText( sceneId, "C醕 h� kh鬾g c� ng鈔 phi猽 c黙 th呓ng nh鈔, giao d竎h gi鎍 ta v� c醕 h� l鄊 sao c� th� th馽 hi畁 疬㧟?" )		
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
end
