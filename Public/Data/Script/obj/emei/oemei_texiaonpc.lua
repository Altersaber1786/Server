--NPC演示技能特效用
--演示NPC
--普通
--C醝 n鄖 NPC最好喧ng不会还手,可攻击,但喧ng不会受到任何伤害
--脚本号
x801005_g_ScriptId = 801005;

--要演示to� 鸬 技能列表 
x801005_g_DemoSkills = {};
--声明方法:   x801005_g_DemoSkills[技能to� 鸬 编号] = "技能to� 鸬 T阯"; 注: 后面会把技能to� 鸬 编号当事件号使用 

x801005_g_DemoSkills[816]="Ho鄋 Ph鴑g Quy H皀";
x801005_g_DemoSkills[818]="C豼 耺 B誧h C痶 Tr鋙";
x801005_g_DemoSkills[819]="Th醝 A 袖o Tr�";
x801005_g_DemoSkills[820]="Ph Quang Ph� Chi猽";
x801005_g_DemoSkills[821]="Kim Ch鈓 械 Ki猵";
x801005_g_DemoSkills[822]="Ninh Tinh Chi V�";
x801005_g_DemoSkills[823]="Xung H� D咿ng Kh�";
x801005_g_DemoSkills[824]="Di畊 B鷗 Sinh Hoa";
x801005_g_DemoSkills[825]="Kh穒 T� H癷 Sinh";
x801005_g_DemoSkills[826]="Kinh M誧h Ngh竎h H鄋h";
x801005_g_DemoSkills[827]="Di H皀 姓i Ph醦";
x801005_g_DemoSkills[828]="D竎h C鈔 衞課 C痶";
x801005_g_DemoSkills[829]="V課 Nh誧 Tri玼 T鬾g";
x801005_g_DemoSkills[830]="Di阯 Ni阯 蚦h Th�";
x801005_g_DemoSkills[831]="Sinh M畁h Chi Tuy玭";

--所拥有to� 鸬 事件Id列表
x801005_g_eventList={816,818,819,820,821,822,823,824,825,826,827,828,829,830,831};
--**********************************
--事件交互入口
--**********************************
function x801005_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan");
--	for i=1,getn(x801005_g_eventList) do 
	for nIdx, nEvent in x801005_g_eventList do
		--添加演示技能to� 鸬 按钮 
		AddNumText(sceneId, nEvent, x801005_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x801005_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别喧ng什么to� 鸬 ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801005, "LuaFnUnitUseSkill",sceneId, selfId,eventId ,targetId);
	--return;
end
