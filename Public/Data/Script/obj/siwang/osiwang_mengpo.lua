--死亡场景NPC
--孟婆
--普通

x077001_g_scriptId=077001

--**********************************
--事件交互入口
--**********************************
function x077001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ng叨i tr� tu眎, t誱 bi畉! T誱 bi畉 t裞 l� kh鬾g g n鎍, v� r癷 m鱥 th� ph鋓 c th, ng呓i mu痭 餴 疴u?")
		
		if  GetLevel( sceneId, selfId)<10	then			
			AddNumText(sceneId,x077001_g_scriptId,"姓i L�",9,2)
		end
		
		if	GetLevel( sceneId, selfId)>=10	then			
			AddNumText(sceneId,x077001_g_scriptId,"L誧 D呓ng",9,0)
			AddNumText(sceneId,x077001_g_scriptId,"T� Ch鈛",9,1)
			AddNumText(sceneId,x077001_g_scriptId,"姓i L�",9,2)		
		end
		
		if	GetLevel( sceneId, selfId)>=20	then
			AddNumText(sceneId,x077001_g_scriptId,"Th鷆 H� C� Tr",9,4)
		end
		
		if	GetLevel( sceneId, selfId)>=75	then
			AddNumText(sceneId,x077001_g_scriptId,"L鈛 Lan",9,5)
		end
		
		AddNumText(sceneId,x077001_g_scriptId,"#{DFBZ_081016_01}",11,3)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x077001_OnEventRequest( sceneId, selfId, targetId, eventId )

	-- L誧 D呓ng
	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFunc", sceneId, selfId, 0,132,183, 10)
			
	-- T� Ch鈛
	elseif	GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc", sceneId, selfId, 1,114,162, 10)
	
	-- 姓i L�
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFunc", sceneId, selfId, 2,160,164)

	-- L鈛 Lan
	elseif	GetNumText()==5	then
		CallScriptFunction((400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
	end
	
	if	GetNumText()==3	then
		BeginEvent(sceneId)
			AddText( sceneId, "#{DFBZ_081016_02}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return	
	end
	
	-- Th鷆 H� C� Tr
	if	GetNumText()==4	then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x077001_g_scriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Th鷆 H� C� Tr l� n絠 PK s� kh鬾g b� s醫 kh�. Xin ch� � an to鄋. C醕 h� c� x醕 nh ti猲 v鄌 kh鬾g?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
end

--**********************************
--传送至Th鷆 H� C� Tr
--**********************************
function x077001_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 420, 200, 211, 20 );
	return
end

