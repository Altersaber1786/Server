--÷��NPC
--Th�nh ph� ������1
x033030_g_scriptId=033030

x033030_g_city0 = 214
x033030_g_city1 = 232
x033030_g_city2 = 606
x033030_g_city3 = 624

--**********************************

--�¼��������

--**********************************

function x033030_OnDefaultEvent( sceneId, selfId,targetId )

	strCity0Name = CityGetCityName(sceneId, selfId, x033030_g_city0)
	strCity1Name = CityGetCityName(sceneId, selfId, x033030_g_city1)
	strCity2Name = CityGetCityName(sceneId, selfId, x033030_g_city2)
	strCity3Name = CityGetCityName(sceneId, selfId, x033030_g_city3)


	BeginEvent(sceneId)

		AddText(sceneId,"C� g� ta c� th� gi�p ���c ng߽i kh�ng?")
		
		if(strCity0Name ~= "") then AddNumText(sceneId,x033030_g_scriptId,"Th�nh ph� 1  "..strCity0Name,9,0) end
		if(strCity1Name ~= "") then AddNumText(sceneId,x033030_g_scriptId,"Th�nh ph� 2  "..strCity1Name,9,1) end
		if(strCity2Name ~= "") then AddNumText(sceneId,x033030_g_scriptId,"Th�nh ph� 3  "..strCity2Name,9,2) end
		if(strCity3Name ~= "") then AddNumText(sceneId,x033030_g_scriptId,"Th�nh ph� 4  "..strCity3Name,9,3) end

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************

--�¼��б�ѡ��m�t ��

--**********************************

function x033030_OnEventRequest( sceneId, selfId, targetId, eventId )

	if	(GetNumText()==0)	then	CityMoveToScene(sceneId, selfId, x033030_g_city0, 99, 152)
	elseif	(GetNumText()==1)	then	CityMoveToScene(sceneId, selfId, x033030_g_city1, 99, 152)
	elseif	(GetNumText()==2)	then	CityMoveToScene(sceneId, selfId, x033030_g_city2, 99, 152)
	elseif	(GetNumText()==3)	then	CityMoveToScene(sceneId, selfId, x033030_g_city3, 99, 152)
	end

end