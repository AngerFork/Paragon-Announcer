local addon = ...

local AnnounceAdd = {};

-------------
-- Main Interface Window Builder
-------------
AnnounceAdd.panel = CreateFrame( "Frame", "AnnounceAdd", UIParent );	-- Create the Panel
AnnounceAdd.panel.name = L_APPTITLE;		-- Name the Panel
local mainParagonCategory = Settings.RegisterCanvasLayoutCategory(AnnounceAdd.panel, L_APPTITLE)
Settings.RegisterAddOnCategory(mainParagonCategory)
AnnounceAdd.panel:RegisterEvent("PLAYER_LOGIN")		-- Trigger an event when the player logs in..
AnnounceAdd.panel:RegisterEvent("ADDON_LOADED")		-- Trigger an event when this addon loads.
AnnounceAdd.panel:SetScript("OnEvent", function(self, event, ...)
	if (event == "ADDON_LOADED") then
		-- Register Generic Addon Settings
		AnnounceAdd:RegisterDefaultGenericSetting("ShowAlert", true) -- Should we show an alert window?
		AnnounceAdd:RegisterDefaultGenericSetting("ShowChat", true) -- Should we show a chat message?
		AnnounceAdd:RegisterDefaultGenericSetting("CheckBagsOnStart", false) -- Should we show all available paragon bags on start?
		AnnounceAdd:RegisterDefaultGenericSetting("NullCheckBox", false) -- This check box does nothing. We should save it anyway.
	
		-- Register Legion Paragon Settings
		--AnnounceAdd:RegisterQuest(L_EXPANSION06, "46293", true, "Test Function") -- Test function.
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "46743", true, L_LG_HIGHMTN) -- Supplies From Highmountain
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "46745", true, L_LG_FARONDIS) -- Supplies From the Court
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "46746", true, L_LG_VALAJAR) -- Supplies From the Valarjar
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "46747", true, L_LG_DREAMWVR) -- Supplies From the Dreamweavers
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "46748", true, L_LG_NIGHTFLN)	-- Supplies From the Nightfallen
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "46749", true, L_LG_WARDENS)	-- Supplies From the Wardens
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "46777", true, L_LG_LEGIONFL) -- The Bounties of Legionfall
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "46800", true, L_LG_WARDENSOLD) -- Paragon of the Wardens
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "48976", true, L_LG_ARGUSRCH) -- Supplies From the Argussian Reach
		AnnounceAdd:RegisterQuest(L_EXPANSION06, "48977", true, L_LG_ARMYLIGHT) -- Supplies From the Army of the Light
		
		-- Register BfA Paragon Settings
		--AnnounceAdd:RegisterQuest(L_EXPANSION07, "46293", true, "Test Function") -- Test function.
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54453", true, L_BA_CHAMPIONS) -- Supplies from Magni
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54451", true, L_BA_TORTOLLAN) -- Baubles from the Seekers
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "55348", true, L_BA_RUSTBOLT) -- Supplies from the Rustbolt Resistance
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "58096", true, L_BA_RAJANI) -- Supplies from the Rajani
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "58097", true, L_BA_ULDUM) -- Supplies from the Uldum Accord
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54454", true, L_BA_SEVENTH) -- Supplies from the 7th Legion
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54456", true, L_BA_EMBERS) -- Supplies from the Order of Embers
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54457", true, L_BA_STORMSWK) -- Supplies from Storm's Wake
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54458", true, L_BA_PROUDMOORE) -- Supplies from the Proudmoore Admiralty
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "55976", true, L_BA_ANKOAN) -- Supplies From the Waveblade Ankoan
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54455", true, L_BA_HONORBND) -- Supplies from the Honorbound
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54461", true, L_BA_VOLDUNAI) -- Supplies from the Voldunai
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54462", true, L_BA_ZANDALARI) -- Supplies from the Zandalari Empire
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "54460", true, L_BA_TALANJI) -- Supplies from Talanji's Expedition
		AnnounceAdd:RegisterQuest(L_EXPANSION07, "53982", true, L_BA_UNSHACKLED) -- Supplies From The Unshackled
		
		-- Register Shadowlands Paragon Settings
		--AnnounceAdd:RegisterQuest(L_EXPANSION08, "46293", true, "Test Function") -- Test function.
		AnnounceAdd:RegisterQuest(L_EXPANSION08, "61097", true, L_SL_ASCENDED) -- Supplies from the Ascended
		AnnounceAdd:RegisterQuest(L_EXPANSION08, "61100", true, L_SL_HARVESTERS) -- Baubles from the Court of Harvesters
		AnnounceAdd:RegisterQuest(L_EXPANSION08, "61095", true, L_SL_UNDYING) -- Supplies from the Undying Army
		AnnounceAdd:RegisterQuest(L_EXPANSION08, "61098", true, L_SL_WILDHUNT) -- Supplies from the Wild Hunt
		AnnounceAdd:RegisterQuest(L_EXPANSION08, "64267", true, L_SL_VENARI) -- Mysterious Gifts from Venari
		AnnounceAdd:RegisterQuest(L_EXPANSION08, "64012", true, L_SL_DEATHADV) -- Supplies from Death's Advance
		AnnounceAdd:RegisterQuest(L_EXPANSION08, "64266", true, L_SL_CODEX) -- Supplies from Archivist's Codex
		AnnounceAdd:RegisterQuest(L_EXPANSION08, "64867", true, L_SL_ENLIGHTENED) -- Supplies from The Enlightened
		
		-- Register Dragonflight Paragon Settings
		--AnnounceAdd:RegisterQuest(L_EXPANSION09, "46293", true, "Test Function") -- Test function.
		AnnounceAdd:RegisterQuest(L_EXPANSION09, "66156", true, L_DF_DRAGONSCALE) -- Overflowing Dragonscale Expedition Supply Pack
		AnnounceAdd:RegisterQuest(L_EXPANSION09, "66511", true, L_DF_ISKAARA) -- Overflowing Iskaara Tuskarr Supply Pack
		AnnounceAdd:RegisterQuest(L_EXPANSION09, "65606", true, L_DF_MARUUK) -- Overflowing Maruuk Centaur Supply Pack
		AnnounceAdd:RegisterQuest(L_EXPANSION09, "71023", true, L_DF_VALDRAKKEN) -- Overflowing Valdrakken Accord Supply Pack
		AnnounceAdd:RegisterQuest(L_EXPANSION09, "75290", true, L_DF_LOAMM) -- Brimming Loamm Niffen Supply Satchel
		AnnounceAdd:RegisterQuest(L_EXPANSION09, "76425", true, L_DF_DREAMWARDENS) -- Overflowing Dream Warden Trove
		
		-- Register The War Within Paragon Settings
		--AnnounceAdd:RegisterQuest(L_EXPANSION10, "46293", true, "Test Function") -- Test function.
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "79220", true, L_WW_ASSEMBLY) -- Overflowing Trove of the Deeps
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "79219", true, L_WW_DORNOGAL) -- Overflowing Council of Dornogal Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "79218", true, L_WW_ARATHI) -- Overflowing Hallowfall Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "79196", true, L_WW_THREADS) -- Overflowing Severed Threads Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "83738", true, L_WW_WEAVER) -- The Weaver's Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "83739", true, L_WW_GENERAL) -- The General's Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "83740", true, L_WW_VIZIER) -- The Vizier's Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "85805", true, L_WW_CARTELS) -- Cartels of Undermine
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "85806", true, L_WW_BILGEWTR) -- Bilgewater Cartel
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "85807", true, L_WW_BLACKWTR) -- Blackwater Cartel
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "85808", true, L_WW_DARKFUSE) -- Darkfuse Solutions
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "85809", true, L_WW_STEAMWDL) -- Steamwheedle Cartel
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "85810", true, L_WW_VENTURE) -- Venture Co.
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "89515", true, L_WW_RADIANCE) -- Flames Radiance
		AnnounceAdd:RegisterQuest(L_EXPANSION10, "85109", true, L_WW_KARESH) -- K'aresh Trust
		
		-- Register Midnight Paragon Settings
		--AnnounceAdd:RegisterQuest(L_EXPANSION11, "46293", true, "Test Function") -- Test function.
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "92411", true, L_MN_BLOODKNIGHTS) -- Overflowing Silvermoon Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "94212", true, L_MN_FARSTRIDERS) -- Overflowing Silvermoon Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "92410", true, L_MN_MAGISTERS) -- Overflowing Silvermoon Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "93811", true, L_MN_SMCOURT) -- Overflowing Silvermoon Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "93566", true, L_MN_AMANI) -- Overflowing Amani Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "89035", true, L_MN_HARATI) -- Overflowing Hara`ti Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "92413", true, L_MN_SHADES) -- Overflowing Silvermoon Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "93798", true, L_MN_ZULJARRA) -- Overflowing Hash'ura Trove
		AnnounceAdd:RegisterQuest(L_EXPANSION11, "94492", true, L_MN_SLAYERS) -- Slayer's Duellum Trove

		AnnounceAdd.panel:UnregisterEvent("ADDON_LOADED")
    end

	-- OnLogin check to see if we have current paragon bags. Works from first login or on reload.	
	if (event == "PLAYER_LOGIN") then
		if ParagonSettings.CheckBagsOnStart then
			AnnounceAdd:CheckCurrentParagonBags()
		end
	end
end)

-------------
-- Checkbox Creation function used throughout the AddOn.
-------------
function AnnounceAdd:CreateCheckBox(name, parent, label, tooltip, relativeTo, x, y, disableInCombat)
    local checkBox = CreateFrame("CheckButton", name, parent, "InterfaceOptionsCheckButtonTemplate")
    checkBox:SetPoint("TOPLEFT", relativeTo, "BOTTOMLEFT", x, y)
    checkBox.Text:SetText(label)

    if (tooltip) then
        checkBox.tooltipText = tooltip
    end

    return checkBox
end

-------------
-- Generic Registration Panel
-------------
function AnnounceAdd:RegisterDefaultGenericSetting(key, value)
    if (ParagonSettings == nil) then
        ParagonSettings = {}
    end
   if (ParagonSettings[key] == nil) then
        ParagonSettings[key] = value
   end
end

-------------
-- Main Interface Window Checkboxes
-------------
AnnounceAdd.panel:Hide()
AnnounceAdd.panel:SetScript("OnShow", function()
    local Title = AnnounceAdd.panel:CreateFontString("Title", "ARTWORK", "GameFontNormalLarge")
    Title:SetPoint("TOPLEFT", AnnounceAdd.panel, 16, -16)
	Title:SetText(L_APPTITLE)

	local ShowAlert = AnnounceAdd:CreateCheckBox("ShowAlert", AnnounceAdd.panel, L_SHOWALERTS, nil, Title, 0, -30, false)
    ShowAlert:SetScript("OnClick", function(self)
        local checked = not not self:GetChecked()
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
		ParagonSettings.ShowAlert = checked
    end)

    local ShowChat = AnnounceAdd:CreateCheckBox("ShowChat", AnnounceAdd.panel, L_SHOWCHATMESSAGES, nil, ShowAlert, 0, -5, false)
    ShowChat:SetScript("OnClick", function(self)
        local checked = not not self:GetChecked()
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
        ParagonSettings.ShowChat = checked
    end)
	
	local CheckBagsOnStart = AnnounceAdd:CreateCheckBox("CheckBagsOnStart", AnnounceAdd.panel, L_CHECKONLOAD, nil, ShowChat, 0, -5, false)
    CheckBagsOnStart:SetScript("OnClick", function(self)
        local checked = not not self:GetChecked()
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
        ParagonSettings.CheckBagsOnStart = checked
    end)

    local NullCheckBox = AnnounceAdd:CreateCheckBox("NullCheckBox", AnnounceAdd.panel, L_CHECKBOXBLANK, nil, CheckBagsOnStart, 0, -5, false)
    NullCheckBox:SetScript("OnClick", function(self)
        local checked = not not self:GetChecked()
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
        ParagonSettings.NullCheckBox = checked
    end)

    function AnnounceAdd:Refresh()
        ShowAlert:SetChecked(ParagonSettings.ShowAlert)
        ShowChat:SetChecked(ParagonSettings.ShowChat)
        CheckBagsOnStart:SetChecked(ParagonSettings.CheckBagsOnStart)
        NullCheckBox:SetChecked(ParagonSettings.NullCheckBox)
    end

    AnnounceAdd:Refresh()
    AnnounceAdd.panel:SetScript("OnShow", nil)
end)
 
-------------
-- Legion Registration Panel
-------------
function AnnounceAdd:RegisterQuest(expansion, key, value, qName)
	if (QuestNames == nil) then
		QuestNames = {}
	end
	if (QuestNames[key] == nil) then
        QuestNames[key] = qName
	end
	if (expansion == L_EXPANSION06) then 			-- Legion
		if (QuestTableLegion == nil) then
			QuestTableLegion = {}
		end
		if (QuestTableLegion[key] == nil) then
			QuestTableLegion[key] = value
		end
	elseif (expansion == L_EXPANSION07) then			-- BfA
		if (QuestTableBFA == nil) then
			QuestTableBFA = {}
		end
		if (QuestTableBFA[key] == nil) then
			QuestTableBFA[key] = value
		end	
	elseif (expansion == L_EXPANSION08) then 	-- Shadowlands
		if (QuestTableShadowlands == nil) then
			QuestTableShadowlands = {}
		end
		if (QuestTableShadowlands[key] == nil) then
			QuestTableShadowlands[key] = value
		end
	elseif (expansion == L_EXPANSION09) then	-- Dragonflight 
		if (QuestTableDragonflight == nil) then
			QuestTableDragonflight = {}
		end
		if (QuestTableDragonflight[key] == nil) then
			QuestTableDragonflight[key] = value
		end
	elseif (expansion == L_EXPANSION10) then	-- The War Within 
		if (QuestTableWarWithin == nil) then
			QuestTableWarWithin = {}
		end
		if (QuestTableWarWithin[key] == nil) then
			QuestTableWarWithin[key] = value
		end
	elseif (expansion == L_EXPANSION11) then	-- Midnight 
		if (QuestTableMidnight == nil) then
			QuestTableMidnight = {}
		end
		if (QuestTableMidnight[key] == nil) then
			QuestTableMidnight[key] = value
		end
	end
	
end

-------------
-- Panel On Use Function
------------- 
function AnnounceAdd:PanelUse(panelName, sentPanel, questTable) 
    local Title = sentPanel:CreateFontString("Title", "ARTWORK", "GameFontNormalLarge")
    Title:SetPoint("TOPLEFT", sentPanel, 16, -16)
	Title:SetText(L_APPTITLE .. " - " .. panelName)
	
	local lastPanel = Title		-- Stores our last panel for alignment use.
	local buttonStorage = {}	-- Stores our checkboxes for updated calls.
		
	for key,value in pairs(questTable) do
		local title, level, _, _, _, _, _, questID = C_QuestLog.GetTitleForLogIndex(key)
		local questKey = AnnounceAdd:CreateCheckBox(key, sentPanel, QuestNames[key], nil, lastPanel, 0, -10, false)
		questKey:SetScript("OnClick", function(self)
			local checked = not not self:GetChecked()
			PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
			questTable[key] = checked
		end)
		lastPanel = questKey
	 	buttonStorage[key] = questKey
	end
	
	function AnnounceAdd:Refresh()
		for key,value in pairs(buttonStorage) do
			value:SetChecked(questTable[key])
		end
	end

    AnnounceAdd:Refresh()
    sentPanel:SetScript("OnShow", nil)
end


-------------
-- Panel Design
-------------
function AnnounceAdd:PanelDesign(panelName, sentPanel)
	sentPanel.name = panelName;
	sentPanel:SetParent(AnnounceAdd.panel); -- Shows that this is a child panel instead of top level
	local subcategory = Settings.RegisterCanvasLayoutSubcategory(mainParagonCategory, sentPanel, panelName)

	sentPanel:Hide()
	sentPanel:SetScript("OnShow", function(self) 
		questTable = {}
		if (panelName == L_EXPANSION11) then questTable = QuestTableMidnight
		elseif (panelName == L_EXPANSION10) then questTable = QuestTableWarWithin
		elseif (panelName == L_EXPANSION09) then questTable = QuestTableDragonflight
		elseif (panelName == L_EXPANSION08) then questTable = QuestTableShadowlands
		elseif (panelName == L_EXPANSION07) then questTable = QuestTableBFA
		elseif (panelName == L_EXPANSION06) then questTable = QuestTableLegion end

		AnnounceAdd:PanelUse(panelName, sentPanel, questTable) 
	end)
end

-------------
-- Check Paragon Bags Function.  Use this to let the player see what paragon bags are available.  
-------------
function AnnounceAdd:CheckCurrentParagonBags()
	local text = format("")
	local counter = 0
	print(text)
	
	for _,questTable in ipairs({ QuestTableLegion, QuestTableBFA, QuestTableShadowlands, QuestTableDragonflight, QuestTableWarWithin, QuestTableMidnight }) do
		for key,value in pairs(questTable) do
			local isOnQuest = C_QuestLog.IsOnQuest(key)
			if ((isOnQuest) and (questTable[key])) then
				local title = nil
				title = C_QuestLog.GetTitleForQuestID(key)
				if (title ~= nil) then 
					text = text .. format(title .." (" ..key.. ")\n")
				end
				counter = counter + 1
			end
		end
	end
	
	local returnIntro = format("You have " ..counter.. " Paragon Bags available right now.\n\n")
	print(returnIntro)
	if (counter > 0) then
		if ParagonSettings.ShowAlert then
			StaticPopupDialogs["NewAlert_Popup"] = {
				text = returnIntro .. text,
				button1 = "Got it, thanks!",
				OnAccept = function() end,
				timeout = 0,
				whileDead = true,
				hideOnEscape = true,
				preferredIndex = 3,
			}
			StaticPopup_Show ("NewAlert_Popup")
			PlaySound(888)
			--message(text)
		end
        if ParagonSettings.ShowChat then
			print(text)
		end
	end
end 

-------------
-- Quest Cache Function.  Use this to let the player know that they have a new rep cache waiting for them.  
-------------
local QuestFrame = CreateFrame("Frame")
QuestFrame:RegisterEvent("QUEST_ACCEPTED")
QuestFrame:SetScript("OnEvent", function(self, event, questIndex)
    local title = C_QuestLog.GetTitleForQuestID(questIndex)
    if QuestTableLegion[tostring(questIndex)] or QuestTableBFA[tostring(questIndex)] or QuestTableShadowlands[tostring(questIndex)] or QuestTableDragonflight[tostring(questIndex)] or QuestTableWarWithin[tostring(questIndex)] or QuestTableMidnight[tostring(questIndex)] then
		local text = format("New Cache Quest added to your log:\n" ..title.. "\n\nID #:" ..questIndex)
        if ParagonSettings.ShowAlert then
		StaticPopupDialogs["NewAlert_Popup"] = {
			text = text,
			button1 = "Got it, thanks!",
			OnAccept = function() end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3,
		}
		StaticPopup_Show ("NewAlert_Popup")
		PlaySound(888)
		--message(text)
		end
        if ParagonSettings.ShowChat then
			print(text)
		end
    end
end)

-------------
-- Actual Panel Creation
-------------
AnnounceAdd.childpanelMidnight = CreateFrame( "Frame", "MidnightChild", AnnounceAdd.panel)
AnnounceAdd:PanelDesign(L_EXPANSION11, AnnounceAdd.childpanelMidnight)

AnnounceAdd.childpanelWarWithin = CreateFrame( "Frame", "WarWithinChild", AnnounceAdd.panel)
AnnounceAdd:PanelDesign(L_EXPANSION10, AnnounceAdd.childpanelWarWithin)

AnnounceAdd.childpanelDragonflight = CreateFrame( "Frame", "DragonflightChild", AnnounceAdd.panel)
AnnounceAdd:PanelDesign(L_EXPANSION09, AnnounceAdd.childpanelDragonflight)

AnnounceAdd.childpanelShadowlands = CreateFrame( "Frame", "ShadowlandsChild", AnnounceAdd.panel);
AnnounceAdd:PanelDesign(L_EXPANSION08, AnnounceAdd.childpanelShadowlands)

AnnounceAdd.childpanelBattle = CreateFrame( "Frame", "BattleChild", AnnounceAdd.panel);
AnnounceAdd:PanelDesign(L_EXPANSION07, AnnounceAdd.childpanelBattle)

AnnounceAdd.childpanelLegion = CreateFrame( "Frame", "LegionChild", AnnounceAdd.panel);
AnnounceAdd:PanelDesign(L_EXPANSION06, AnnounceAdd.childpanelLegion)

-------------
-- Console Shortcuts
-------------
SLASH_PARANNOUNCER1 = "/paragonannouncer"
SLASH_PARANNOUNCER2 = "/pa"
SlashCmdList["PARANNOUNCER"] = function()
	SettingsPanel:Open(); 
	SettingsPanel:SelectCategory(mainParagonCategory, true);
end 

SLASH_PARANNOUNCERCHECK1 = "/pa-check"
SlashCmdList["PARANNOUNCERCHECK"] = function()
	AnnounceAdd:CheckCurrentParagonBags()
end 