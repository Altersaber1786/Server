-- ������� (�ĳ���ȷT�n)
-- ���ӳ�������ֵ

-- ����ͨ�ù��ܽű�
x334634_g_petCommonId = PETCOMMON

--******************************************************************************
-- ���²���C�n ��ngC�n �޸�to� � ����
--******************************************************************************

--�ű��� (�ĳ���ȷ�ű���)
x334634_g_scriptId = 334634

-- ����ֵ (����Ҫ���д������ֵ)
x334634_g_HPValue = 5332			-- ����ֵ����ֵ
x334634_g_MaxHPValue = 0		-- �������ֵ����ֵ
x334634_g_LifeValue = 0			-- ��������ֵ
x334634_g_HappinessValue = 0	-- ���ֶ�����ֵ

--��׼Ч��ID (�ĳɳ���Գ���to� � ��Ч)
--g_ImpactID = 0

--******************************************************************************
-- ���ϲ���C�n ��ngC�n �޸�to� � ����
--******************************************************************************

--�ű�

--**********************************
--����Tr� v� 1 ������ȷִ����������
--**********************************
function x334634_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--����������: 
--H� th�ng��T�i ���ܼ��to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �������ͨ��,���Լ���ִ�У�Tr� v�0: �������th�t b�i,�жϺ���ִ��.
--**********************************
function x334634_OnConditionCheck( sceneId, selfId )
	--У��ʹ��to� � ��Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	--  �i�m����ǰ��T�i ʹ��to� � ��Ʒto� � tr� tay n�i
	nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	ret = CallScriptFunction( x334634_g_petCommonId, "IsPetCanUseFood", sceneId, selfId, nIndex )
	return ret
end

--**********************************
--���ļ�⼰�������: 
--H� th�ng��T�i ��������to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: ���Ĵ���ͨ��,���Լ���ִ�У�Tr� v�0: ���ļ��th�t b�i,�жϺ���ִ��.
--ע��: �ⲻ�⸺������to� � ���Ҳ��������to� � ִ��.
--**********************************
function x334634_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--ֻ��ִ��m�t �����: 
--������˲�����ܻ�T�i ������ɺ����C�i n�y �ӿ�(�����������Ҹ���������Th�a m�nto� � ʱ��),������
--����Ҳ��T�i ������ɺ����C�i n�y �ӿ�(����to� � m�t ��ʼ,���ĳɹ�ִ��֮��).
--Tr� v�1: �����ɹ���Tr� v�0: ����th�t b�i.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334634_OnActivateOnce( sceneId, selfId )
	if x334634_g_HPValue > 0 then
		CallScriptFunction( x334634_g_petCommonId, "IncPetHP", sceneId, selfId, x334634_g_HPValue )
	end

	if x334634_g_MaxHPValue > 0 then
		CallScriptFunction( x334634_g_petCommonId, "IncPetMaxHP", sceneId, selfId, x334634_g_MaxHPValue )
	end

	if x334634_g_LifeValue > 0 then
		CallScriptFunction( x334634_g_petCommonId, "IncPetLife", sceneId, selfId, x334634_g_LifeValue )
	end

	if x334634_g_HappinessValue > 0 then
		CallScriptFunction( x334634_g_petCommonId, "IncPetHappiness", sceneId, selfId, x334634_g_HappinessValue )
	end

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--���������������: 
--�������ܻ�T�i ÿ����������ʱ����C�i n�y �ӿ�.
--Tr� v�: 1�����´�������0: �ж�����.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334634_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- C�i n�y ����û��ʲô��,����ng������
function x334634_CancelImpacts( sceneId, selfId )
	return 0
end