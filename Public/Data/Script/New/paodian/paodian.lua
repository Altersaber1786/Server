--�����ݵ�


--�ű���
x898989_g_scriptId = 898989

x898989_g_NormalExpBuffID = 5905	--��ͨ ��þ������Ч....
x898989_g_MoreExpBuffID = 5904		--���� ��þ������Ч....

x898989_g_ExpTbl = {
	[10]=100,[11]=111,[12]=130,[13]=140,[14]=150,
	[15]=180,[16]=220,[17]=250,[18]=300,[19]=320,
	[20]=350,[21]=380,[22]=400,[23]=430,[24]=450,
	[25]=500,[26]=550,[27]=600,[28]=650,[29]=700,
	[30]=765,[31]=787,[32]=810,[33]=832,[34]=855,
	[35]=10000,[36]=10000,[37]=10000,[38]=10000,[39]=10000,
	[40]=20000,[41]=20000,[42]=20000,[43]=20000,[44]=20000,
	[45]=30000,[46]=30000,[47]=30000,[48]=30000,[49]=30000,
	[50]=40000,[51]=40000,[52]=40000,[53]=40000,[54]=40000,
	[55]=50000,[56]=50000,[57]=50000,[58]=50000,[59]=50000,
	[60]=60000,[61]=60000,[62]=60000,[63]=60000,[64]=60000,
	[65]=70000,[66]=70000,[67]=70000,[68]=70000,[69]=70000,
	[70]=80000,[71]=80000,[72]=80000,[73]=80000,[74]=80000,
	[75]=90000,[76]=90000,[77]=90000,[78]=90000,[79]=90000,
	[80]=100000,[81]=100000,[82]=100000,[83]=100000,[84]=100000,
	[85]=200000,[86]=200000,[87]=200000,[88]=200000,[89]=200000,
	[90]=300000,[91]=300000,[92]=300000,[93]=300000,[94]=300000,
	[95]=400000,[96]=400000,[97]=400000,[98]=400000,[99]=400000,
	[100]=500000,[101]=500000,[102]=500000,[103]=500000,[104]=500000,
	[105]=600000,[106]=600000,[107]=600000,[108]=600000,[109]=600000,
	[110]=700000,[111]=700000,[112]=700000,[113]=700000,[114]=700000,
	[115]=800000,[116]=800000,[117]=800000,[118]=800000,[119]=800000,
	[120]=900000,[121]=900000,[122]=900000,[123]=900000,[124]=900000,
	[125]=1000000,[126]=1000000,[127]=1000000,[128]=600000,[129]=1000000,
	[130]=2000000,[131]=2000000,[132]=2000000,[133]=2000000,[134]=2000000,
	[135]=3000000,[136]=3000000,[137]=3000000,[118]=3000000,[139]=3000000,
	[140]=4000000,[141]=4000000,[142]=4000000,[143]=4000000,[144]=4000000,
	[145]=5000000,[146]=5000000,[147]=5000000,[148]=5000000,[149]=5000000,

}

--**********************************
-- OnTime
--**********************************
function x898989_OnSceneTimer(sceneId)

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		x898989_DoHanYuLogic( sceneId, nHumanId )
	end

end

--**********************************
-- �һ��Ӿ����߼�
--**********************************
function x898989_DoHanYuLogic( sceneId, selfId )

	--if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
	--	return
	--end

	--if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
	--	return
	--end

	--��þ���....
	local IsMoreExp = 0
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	local CurExp = x898989_g_ExpTbl[CurLevel]
	--if CurExp and CurExp > 0 then

		--�������5%���ʸ�2������....
			if random(100) <= 5 then
				CurExp = CurExp * 2
				IsMoreExp = 1
			end
	
		LuaFnAddExp( sceneId, selfId, CurExp)

	--�������
	if CurLevel > 99 then
		YuanBao(sceneId,selfId,-1,1, 1 )
	end
	--end

	--����þ����buff....
	if 1 == IsMoreExp then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x898989_g_MoreExpBuffID, 0)
	else
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x898989_g_NormalExpBuffID, 0)
	end

end
--**********************************
-- ��ȡĳ�ȼ��ľ���
--**********************************
function x898989_GetPreExpOfThisLevel( sceneId, level )

	local Exp = x898989_g_ExpTbl[level]
	if Exp then
		return Exp
	else
		return 0
	end

end