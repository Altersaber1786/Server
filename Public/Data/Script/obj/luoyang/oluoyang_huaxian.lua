--L誧 D呓ngNPC
--花仙
--普通

--**********************************
--事件交互入口
--**********************************
function x000094_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
 	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h� "
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  D呓ng li璾 thanh thanh giang thu� b靚h #rV lang giang th唼ng s呔ng ca thanh #r恤ng bi阯 nh xu t鈟 bi阯 v�#r 姓o th� v� t靚h kh呔c h鎢 t靚h.#r"..PlayerName.." "..PlayerSex..", c� th韈h cu礳 s痭g ch� l鄊 uy阯 呓ng kh鬾g l鄊 ti阯 kh鬾g?")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
