--潘玄耕

--任务号
x009015_g_MissionId = 1060

x009015_g_scriptId=009015

function x009015_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	misIndex = GetMissionIndexByID(sceneId,selfId,x009015_g_MissionId)
	BeginEvent(sceneId)
		AddText(sceneId,"  G 疴y lu鬾 c鋗 th kh� l馽 kh鬾g 瘘.")
		if	IsHaveMission(sceneId,selfId,x009015_g_MissionId) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex,0) < 1  and  GetMissionParam( sceneId, selfId, misIndex,3) == 1 then
				AddNumText(sceneId,x009015_g_scriptId,"Cho ng呓i 姓i L馽 x� l�",8,0)
			end
		end
	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
end

function x009015_OnEventRequest( sceneId, selfId, targetId, eventId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x009015_g_MissionId)
	if	GetNumText()==0	then
		if	HaveItemInBag (  sceneId, selfId, 30202001)	 > 0  then
			DelItem (  sceneId, selfId, 30202001, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"C鋗 t� 姓i L馽 x� l� c黙 c醕 h�")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"Ho鄋 t nhi甿 v�!")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"姓i L馽 x� l�? � 疴u?")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end
