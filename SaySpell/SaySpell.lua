-- Developed by Lord Syturio
-- WoTLK Patch 3.3.5
-- Version: 1.0

SaySpell = AceLibrary("AceAddon-2.0");

local SaySpellFrame = CreateFrame("Frame", "SaySpellFrame")
SaySpellFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
SaySpellFrame:SetScript("OnEvent", function() SaySpell:SaySpell_OnEvent(event) end)

function SaySpell:SaySpell_OnEvent()
	if(event == "COMBAT_LOG_EVENT_UNFILTERED"
	and arg4 == UnitName("player")
	and arg2 == "SPELL_CAST_SUCCESS") then
		local SpellName = arg10
		local SpellLink = GetSpellLink(SpellName)

		if (SpellName == "Starfall")								-- Druid
		or (SpellName == "Barkskin")
		or (SpellName == "Innervate") 
		or (SpellName == "Cyclone")
		or (SpellName == "Remove Curse") 
		or (SpellName == "Abolish Poison")
		or (SpellName == "Cure Poison") 
		or (SpellName == "Hibernate")
		or (SpellName == "Gift of the Naaru")				-- Shaman
		or (SpellName == "Medallion of the Alliance")
		or (SpellName == "Hex")
		or (SpellName == "Cure Toxins")
		or (SpellName == "Shield Wall")						-- Warrior
		then
		   SendChatMessage(""..SpellLink.." casted!", PARTY, nil, 1)
		end
	end
end