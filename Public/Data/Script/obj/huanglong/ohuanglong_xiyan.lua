--黄龙NPC
--夕颜
--普通

--**********************************
--事件交互入口
--**********************************
function x023003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  T読 h� ch� � v鄆 ng鄖 � tr Ho鄋g Long, nh遪g v鄆 ng鄖 痼 cho t読 h� c鋗 gi醕 v� c鵱g  醦 y阯 l鄋h. So v緄 cu礳 s痭g 鸶a ng鴆 tr呔c 疴y, th馽 s� l� t痶 h絥 kh鬾g bi猼 bao nhi陁 l.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
