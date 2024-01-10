--[[
Copyright 2023-2024 qtPy
BlacklistTracker is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this addon do not give permission to
redistribute and/or modify it.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the addon. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.

This file is part of BlacklistTracker.
--]]

BADACTORS = {
    {"Rubyx", "Scam"},
    {"Smegmafiend", "Scam"},
    {"Kajan", "Ninja"},
    {"Calleman", "Ninja"},
    {"Erkabus", "Ninja"},
    {"Tidruid", "Ninja"},
    {"Chocolovë", "Ninja"},
    {"Sithyn", "Ninja"},
    {"Nesrýo", "Scamming"},
    {"Kdog", "Ninja"},
    {"Zearck", "Ninja"},
    {"Dakistan", "Ninja"},
    {"Bigsword", "Ninja"},
    {"Yannicka", "Ninja"},
    {"Mgae", "Ninja"},
    {"Maimed", "Ninja"},
    {"Belvor", "Ninja"},
    {"Metts", "Ninja"},
    {"Ynot", "Ninja"},
    {"Rockzorr", "Ninja"},
    {"Outbreak", "Ninja"},
    {"Ozlo", "Ninja"},
    {"Icediablo", "Ninja"},
    {"Kavalan", "Ninja"},
    {"Starlord", "Ninja"},
    {"Iava", "Ninja"},
    {"Gamersixnine", "Ninja"},
    {"Swiftooga", "Ninja"},
    {"Aixi", "Ninja"},
    {"Sweatlord", "Ninja"},
    {"Perfectum", "Ninja"},
    {"Orochishaman", "Ninja"},
    {"Akakabuto", "Ninja"},
    {"Clynda", "Ninja"},
    {"Harryhotta", "Ninja"},
    {"Lushx", "Ninja"},
    {"Valoche", "Ninja"},
    {"Róadman", "Ninja"},
    {"Gahpabab", "Ninja"},
    {"Klaura", "Ninja"},
    {"Shelox", "Ninja"},
    {"Zappetizer", "Ninja"},
    {"Gigashotz", "Ninja"},
    {"Ottan", "Ninja"},
    {"Edentée", "Ninja"},
    {"Shunly", "Ninja"},
    {"Vannkjerring", "Ninja"},
    {"Shampion", "Ninja"},
    {"Syzlak", "Ninja"},
    {"Warhead", "Ninja"},
    {"Yobacrow", "Ninja"},
    {"Mosthofs", "Ninja"},
    {"Faustino", "Ninja"},
    {"Smissen", "Ninja"},
    {"Lysdexii", "Ninja"},
    {"Blazern", "Ninja"},
    {"Grimpöcket", "Ninja"},
    {"Chrizzy", "Ninja"},
    {"Muchentuchen", "Ninja"},
    {"Firechilli", "Ninja"},
    {"Pizzaman", "Ninja"},
    {"Lícht", "Ninja"},
    {"Shrimpis", "Ninja"},
    {"Eldre", "Ninja"},
    {"Maantzy", "Ninja"},
    {"Luzif", "Ninja"},
    {"Perfidious", "Ninja"},
    {"Wyand", "Ninja"},
    {"Bignogger", "Ninja"},
    {"Drfrost", "Ninja"},
    {"Alucàrd", "Ninja"},
    {"Riotstroke", "Ninja"},
    {"Leshanker", "Ninja"},
    {"Orcofbattle", "Grief"},
    {"Purekekdru", "Scamming"},
    {"Zaroph", "Ninja"},
    {"Litium", "Ninja"},
    {"Jayjigga", "Ninja"},
    {"Waywigga", "Ninja"},
    {"Danng", "Ninja"},
    {"Eiko", "Ninja"},
    {"Slaysatyx", "Ninja"},
    {"Milkboba", "Ninja"},
    {"Kindredi", "Ninja"},
    {"Lorosk", "Scamming"},
    {"Cofu", "Ninja"},
    {"Patopekin", "Ninja"},
    {"Baraddûr", "Ninja"},
    {"Warees", "Ninja"},
    {"Desastro", "Ninja"},
    {"Kimboslice", "Ninja"},
    {"Nakht", "Ninja"},
    {"Denlox", "Ninja"},
    {"Raeudiger", "Ninja"},
    {"Akjshaman", "Ninja"},
    {"Sotskalle", "Ninja"},
    {"Lichtfutz", "Ninja"},
    {"Votarax", "Ninja"},
    {"Seynaqt", "Ninja"},
    {"Letmehugyou", "Ninja"},
    {"Zelenk", "Ninja"},
    {"Myslbergsprk", "Ninja"},
    {"Rendtoni", "Ninja"},
    {"Syphyte", "Ninja"},
    {"Vazy", "Ninja"},
    {"Daidara", "Ninja"},
    {"Porf", "Ninja"},
    {"Porojames", "Ninja"},
    {"Infrar", "Ninja"},
    {"Spilly", "Ninja"},
    {"Miven", "Ninja"},
    {"Gdkpenjøyer", "Ninja"},
    {"Fnatik", "Ninja"},
    {"Vigør", "Scamming"},
    {"Zootycoon", "Ninja"},
    {"Foggypoison", "Scamming"},
    {"Veeko", "Ninja"},
    {"Nimeria", "Ninja"},
    {"Trollbolts", "Ninja"},
    {"Draxeros", "Ninja"},
    {"Casualx", "Ninja"},
    {"Wabulabdab", "Ninja"},
    {"Moishe", "Ninja"},
    {"Sleo", "Ninja"},
    {"Locktorwho", "Ninja"},
    {"Betrayal", "Ninja"},
    {"Tonicruanyes", "Ninja"},
    {"Daddelmaus", "Ninja"},
    {"Gokel", "Ninja"},
    {"Usynelig", "Ninja"},
    {"Poxsy", "Ninja"},
    {"Bogbrush", "Ninja"},
    {"Poniat", "Ninja"},
    {"Grumpymage", "Ninja"},
    {"Krimoo", "Ninja"},
    {"Chöpter", "Ninja"},
    {"Texte", "Ninja"},
    {"League", "Ninja"},
    {"Crydowed", "Ninja"},
    {"Parseorleave", "Ninja"},
    {"Røgue", "Ninja"},
    {"Karigaffel", "Ninja"},
    {"Yesmaster", "Ninja"},
    {"Udødelig", "Ninja"},
    {"Nyom", "Ninja"},
    {"Nesteagodx", "Ninja"},
    {"Schnödelschu", "Ninja"},
    {"Getosuguru", "Scamming"},
    {"Peefarm", "Ninja"},
    {"Gbodziog", "Ninja"},
    {"Soseb", "Ninja"},
    {"Huanted", "Ninja"},
    {"Stèv", "Ninja"},
    {"Peetea", "Ninja"},
    {"Cifrabubi", "Ninja"},
    {"Extacc", "Ninja"},
    {"Syladdnas", "Ninja"},
    {"Frostberg", "Ninja"},
    {"Drafyr", "Ninja"},
    {"Naid", "Ninja"}
};

COLOURS = {
	{
		title = 'LIGHTBLUE',
		color = 'cff00ccff',
	},
	{
		title = 'LIGHTRED',
		color = 'cffff6060',
	},
	{
		title = 'SPRINGGREEN',
		color = 'cff00FF7F',
	},
	{
		title = 'GREENYELLOW',
		color = 'cffADFF2F',
	},
	{
		title = 'BLUE',
		color = 'cff0000ff',
	},
	{
		title = 'PURPLE',
		color = 'cffDA70D6',
	},
	{
		title = 'GREEN',
		color = 'cff00ff00',
	},
	{
		title = 'RED',
		color = 'cffff0000',
	},
	{
		title = 'GOLD',
		color = 'cffffcc00',
	},
	{
		title = 'GOLD2',
		color = 'cffFFC125',
	},
	{
		title = 'GREY',
		color = 'cff888888',
	},
	{
		title = 'WHITE',
		color = 'cffffffff',
	},
	{
		title = 'SUBWHITE',
		color = 'cffbbbbbb',
	},
	{
		title = 'MAGENTA',
		color = 'cffff00ff',
	},
	{
		title = 'YELLOW',
		color = 'cffffff00',
	},
	{
		title = 'ORANGEY',
		color = 'cffFF4500',
	},
	{
		title = 'CHOCOLATE',
		color = 'cffCD661D',
	},
	{
		title = 'CYAN',
		color = 'cff00ffff',
	},
	{
		title = 'IVORY',
		color = 'cff8B8B83',
	},
	{
		title = 'LIGHTYELLOW',
		color = 'cffFFFFE0',
	},
	{
		title = 'SEXGREEN',
		color = 'cff71C671',
	},
	{
		title = 'SEXTEAL',
		color = 'cff388E8E',
	},
	{
		title = 'SEXPINK',
		color = 'cffC67171',
	},
	{
		title = 'SEXBLUE',
		color = 'cff00E5EE',
	},
	{
		title = 'SEXHOTPINK',
		color = 'cffFF6EB4'
	},
};

APP_AUTHOR = "qtPy";
APP_VERSION = "1.0.0";
APP_DATE = "10-01-2024";
APP_NAME = "BlacklistTracker";
APP_SUPPORTEDREALMS = "Lonewolf (EU)";

APP_WIDTH, APP_HEIGHT = 440, 150;
APP_MARGIN = 20;

APP_GITHUB = "github.com/qtPyDev/wow_BlacklistTracker"
APP_CURSEFORGE = "www.curseforge.com/wow/addons/blacklisttracker"

HOVER_LOCKED = false;
UNITHOVER_TIMER = 0.5;

GROUP_LOCKED = false;
GROUP_TIMER = 60;

local unitUpdateHoverFrame = CreateFrame("Frame", nil, UIParent);
unitUpdateHoverFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
unitUpdateHoverFrame:SetScript("OnEvent", UnitHoverHandler);

local groupUpdateFrame = CreateFrame("Frame", nil, UIParent);
groupUpdateFrame:RegisterEvent("GROUP_ROSTER_UPDATE");
groupUpdateFrame:SetScript("OnEvent", GroupUpdateHandler);

function SetColour(text, desiredColour)
	local startLine = '\124';
	local endLine = '\124r';
	for i = 1, #COLOURS do
        if COLOURS[i].title == desiredColour then
            return startLine .. COLOURS[i].color .. text .. endLine;
        end
	end
end

function GroupUpdateHandler()
    if not GROUP_LOCKED then
        GROUP_LOCKED = true;
        if IsInRaid() then
            for i=1,40 do
                local name = GetRaidRosterInfo(i);
                if name then
                    for j=1, #BADACTORS do
                        if BADACTORS[j][1] == name then
                            Group_ProcessBadActor(BADACTORS[j])
                        end
                    end
                end
            end
        elseif IsInGroup() then
            for i=1,5 do
                local name = GetRaidRosterInfo(i);
                if name then
                    for j=1, #BADACTORS do
                        if BADACTORS[j][1] == name then
                            Group_ProcessBadActor(BADACTORS[j])
                        end
                    end
                end
            end
        end
        C_Timer.After(GROUP_TIMER, function()
            GROUP_LOCKED = false;
        end)
    end
end

function UnitHoverHandler()
    if not HOVER_LOCKED then
        local name = UnitName("mouseover");
        if name then
            HOVER_LOCKED = true;
            for i=1, #BADACTORS do
                if BADACTORS[i][1] == name then
                    UnitFrame_ProcessBadActor(BADACTORS[i])
                end
            end
            C_Timer.After(UNITHOVER_TIMER, function()
                HOVER_LOCKED = false;
            end)
        end
    end
end

function UnitFrame_ProcessBadActor(badActor)
    local name = badActor[1];
    local reason = badActor[2];
    GameTooltip:AppendText(SetColour(" [Blacklisted]", "RED"));
    SendWarning(name, reason);
end

function Group_ProcessBadActor(badActor)
    local name = badActor[1];
    local reason = badActor[2];
    SendWarning(name, reason);
end

function SendWarning(name, reason)
    -- Prints a warning message to the chat window
    local warningMessage =  SetColour(
        name.. " is blacklisted for " ..reason, "RED");
    print("")
    print(SetColour("[WARNING]: ","LIGHTBLUE") ..warningMessage);

    local level = UnitLevel(name);
    local class = UnitClass(name);
    local race = UnitRace(name);

    -- Prints a note message relaying level, race and class info to the chat window
    print (
        SetColour(
            "[Info]: ","LIGHTBLUE") .."Level " ..level.. " " ..race.. " " ..class);

    -- Prints a note message relaying guild info to the chat window
    local guildName, guildRankName, guildRankIndex = GetGuildInfo(name);
    if guildName then
        local guildMessage = SetColour(
            name.. " is in <" ..guildName.. "> and is Rank: " ..guildRankName, "GREEN");
        print(SetColour("[Guild]: ","LIGHTBLUE") ..guildMessage);
        print("")
    else
        local guildMessage = SetColour(
            name.. " is not in a guild.", "GREEN");
        print(
            SetColour("[Guild]: " ,"LIGHTBLUE") ..guildMessage);
            print("")
    end
end

function CheckForBadActor(str, cmd)
    local name = ""
    if cmd == "search" then
        name = string.match(str, "search%s(.+)");
    elseif cmd == "find" then
        name = string.match(str, "find%s(.+)");
    end
    local found = false;
    for i=1, #BADACTORS do
        if BADACTORS[i][1] == name then
            found = true;
            SendWarning(BADACTORS[i][1], BADACTORS[i][2]);
        end
    end
    if not found then
        print(SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."No results found for " ..name);
    end
end

BlacklistTrackerUI = {};

function BlacklistTrackerUI.Initialize()
    local BlacklistTrackerFrame = CreateFrame(
        "Frame", "BlacklistTrackerFrame", UIParent, "BasicFrameTemplateWithInset");
    BlacklistTrackerFrame:SetSize(APP_WIDTH, APP_HEIGHT);
    BlacklistTrackerFrame:SetPoint("CENTER", UIParent, "CENTER");
    BlacklistTrackerFrame:Hide();
    BlacklistTrackerFrame:SetMovable(false);

    BlacklistTrackerFrame.title = BlacklistTrackerFrame:CreateFontString(nil, "OVERLAY");
    BlacklistTrackerFrame.title:SetFontObject("GameFontHighlight");
    BlacklistTrackerFrame.title:SetPoint("LEFT", BlacklistTrackerFrame.TitleBg, "LEFT", 5, 0);
    BlacklistTrackerFrame.title:SetText(APP_NAME);

    BlacklistTrackerFrame.version = BlacklistTrackerFrame:CreateFontString(nil, "OVERLAY");
    BlacklistTrackerFrame.version:SetFontObject("GameFontHighlight");
    BlacklistTrackerFrame.version:SetPoint("RIGHT", BlacklistTrackerFrame.TitleBg, "RIGHT", -5, 0);
    BlacklistTrackerFrame.version:SetText("Version " ..APP_VERSION);

    BlacklistTrackerFrame.authorLabel = BlacklistTrackerUI.CreateTextObject(
        "Author: ", BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN, -35);

    BlacklistTrackerFrame.author = BlacklistTrackerUI.CreateTextObject(
        APP_AUTHOR, BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN+100, -35);

    BlacklistTrackerFrame.dateLabel = BlacklistTrackerUI.CreateTextObject(
        "Last Updated: ", BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN, -55);

    BlacklistTrackerFrame.date = BlacklistTrackerUI.CreateTextObject(
        APP_DATE, BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN+100, -55);

    BlacklistTrackerFrame.githubLabel = BlacklistTrackerUI.CreateTextObject(
        "GitHub: ", BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN, -75);

    local githubLink = "|HurlIndex:25|h|cff006995".. APP_GITHUB .."|r|h"
    BlacklistTrackerFrame.githubLink = BlacklistTrackerUI.CreateTextObject(
        githubLink, BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN+100, -75);

    BlacklistTrackerFrame.curseforgeLabel = BlacklistTrackerUI.CreateTextObject(
        "Curseforge: ", BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN, -95);

    local curseforgeLink = "|HurlIndex:25|h|cff006995".. APP_CURSEFORGE .."|r|h"
    BlacklistTrackerFrame.curseforgeLink = BlacklistTrackerUI.CreateTextObject(
        curseforgeLink, BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN+100, -95);

    BlacklistTrackerFrame.supportedRealmsLabel = BlacklistTrackerUI.CreateTextObject(
        "Realms: ", BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN, -115);

    BlacklistTrackerFrame.supportedRealms = BlacklistTrackerUI.CreateTextObject(
        APP_SUPPORTEDREALMS, BlacklistTrackerFrame, "TOPLEFT", APP_MARGIN+100, -115);

    return BlacklistTrackerFrame;
end

function BlacklistTrackerUI.CreateTextObject(text, frame, point, x, y)
    local textObject = frame:CreateFontString(nil, "OVERLAY");
    textObject:SetFontObject("GameFontHighlight");
    textObject:SetPoint(point, frame, point, x, y);
    textObject:SetText(text);
    return textObject;
end

function BlacklistTracker_Toggle()
    local BlacklistTrackerFrame =  BlacklistTrackerUI.Initialize();
    if (BlacklistTrackerFrame:IsShown()) then
        BlacklistTrackerFrame:Hide();
    else
        BlacklistTrackerFrame:Show();
    end
end

function HandleSlashCommands(str)
    if (str == "toggle") or (str == "") then
        BlacklistTracker_Toggle();
    elseif (str == "version") then
        print(SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."Version " ..APP_VERSION);
    elseif string.match(str, "search") then
        CheckForBadActor(str, "search");
    elseif string.match(str, "find") then
        CheckForBadActor(str, "find");
    elseif (str == "help") then
        print("");
        print("BlacklistTracker: /BL OR /BL toggle - Toggles the BlacklistTracker menu.");
        print("BlacklistTracker: /BL help - Shows a help message.");
        print("");
    else
        print("BlacklistTracker: Invalid command, use /BL help for a list of commands.");
    end
end

function BlacklistTracker_OnLoad()
    SlashCmdList["BlacklistTracker"] = HandleSlashCommands;
    SLASH_BlacklistTracker1= "/BlacklistTracker";
    SLASH_BlacklistTracker2= "/BL";
    this:RegisterEvent("VARIABLES_LOADED");
end
