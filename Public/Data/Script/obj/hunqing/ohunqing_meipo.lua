--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155003_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"Anh h鵱g ch遖 c� � trung nh鈔 sao? N猽 ch遖 c�, 瓞 ta gi緄 thi畊 1 ng叨i nh�?");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

