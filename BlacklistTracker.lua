--[[
Copyright 2023-2024 qtPy
BlacklistTracker is distributed under the terms of the All Rights Reserved License.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

This file is part of BlacklistTracker.
--]]

local addon = {};
local addonName = "BlacklistTracker";
_G[addonName] = addon;

local blacklistTrackerUI = {};
local blacklistTrackerFunctions = {};
local badActors = {};

local colours = {
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

local appAuthor = "qtPy";
local appVersion = "1.0.2";
local appDate = "14-01-2024";
local appName = "BlacklistTracker";
local appSupportedRealms = "Lonewolf (EU), Chaos Bolt (EU)";

local appWidth, appHeight = 440, 150;
local appMargin = 20;

local appGithub = "github.com/qtPyDev/wow_BlacklistTracker"
local appCurseforge = "www.curseforge.com/wow/addons/blacklisttracker"

local unithoverLock = false;
local unithoverTimer = 0.5;

local groupLock = false;
local groupTimer = 60;

local unitUpdateHoverFrame = CreateFrame("Frame", nil, UIParent);
unitUpdateHoverFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
unitUpdateHoverFrame:SetScript("OnEvent", blacklistTrackerFunctions.UnitHoverHandler);

local groupUpdateFrame = CreateFrame("Frame", nil, UIParent);
groupUpdateFrame:RegisterEvent("GROUP_ROSTER_UPDATE");
groupUpdateFrame:SetScript("OnEvent", blacklistTrackerFunctions.GroupUpdateHandler);

function blacklistTrackerUI.InitToolbar()
    local BlacklistTrackerToolbar = CreateFrame(
        "Frame", "BlacklistTrackerToolbar", UIParent, "BasicFrameTemplate");
    local toolbarWidth, toolbarHeight = 200, 40;
    BlacklistTrackerToolbar:SetSize(toolbarWidth, toolbarHeight);
    BlacklistTrackerToolbar:SetPoint("CENTER", UIParent, "CENTER");
    BlacklistTrackerToolbar:Hide();
    BlacklistTrackerToolbar:SetMovable(true);
    BlacklistTrackerToolbar:EnableMouse(true)
    BlacklistTrackerToolbar:RegisterForDrag("LeftButton")
    BlacklistTrackerToolbar:SetScript("OnDragStart", BlacklistTrackerToolbar.StartMoving)
    BlacklistTrackerToolbar:SetScript("OnDragStop", BlacklistTrackerToolbar.StopMovingOrSizing)

    BlacklistTrackerToolbar.title = BlacklistTrackerToolbar:CreateFontString(nil, "OVERLAY");
    BlacklistTrackerToolbar.title:SetFontObject("GameFontHighlight");
    BlacklistTrackerToolbar.title:SetPoint("LEFT", BlacklistTrackerToolbar.TitleBg, "LEFT", 5, 0);
    BlacklistTrackerToolbar.title:SetText(appName .." Toolbar");

    BlacklistTrackerToolbar.grabGUIDButton = CreateFrame(
        "Button", nil, BlacklistTrackerToolbar, "UIPanelButtonTemplate");
    BlacklistTrackerToolbar.grabGUIDButton:SetSize(100, 20);
    BlacklistTrackerToolbar.grabGUIDButton:SetPoint("TOPLEFT", BlacklistTrackerToolbar, "TOPLEFT", 0, -20);
    BlacklistTrackerToolbar.grabGUIDButton:SetText("Grab GUID");
    BlacklistTrackerToolbar.grabGUIDButton:SetScript("OnClick", blacklistTrackerFunctions.GrabGUID);

    BlacklistTrackerToolbar.toggleAppInfoButton = CreateFrame(
        "Button", nil, BlacklistTrackerToolbar, "UIPanelButtonTemplate");
    BlacklistTrackerToolbar.toggleAppInfoButton:SetSize(100, 20);
    BlacklistTrackerToolbar.toggleAppInfoButton:SetPoint("TOPLEFT", BlacklistTrackerToolbar, "TOPLEFT", 100, -20);
    BlacklistTrackerToolbar.toggleAppInfoButton:SetText("About...");
    BlacklistTrackerToolbar.toggleAppInfoButton:SetScript("OnClick", blacklistTrackerUI.ToggleAppInfo);

    return BlacklistTrackerToolbar;
end

function blacklistTrackerUI.InitAppInfo()
    local BlacklistTrackerFrame = CreateFrame(
        "Frame", "BlacklistTrackerFrame", UIParent, "BasicFrameTemplateWithInset");
    BlacklistTrackerFrame:SetSize(appWidth, appHeight);
    BlacklistTrackerFrame:SetPoint("CENTER", UIParent, "CENTER");
    BlacklistTrackerFrame:Hide();
    BlacklistTrackerFrame:SetMovable(false);

    BlacklistTrackerFrame.title = BlacklistTrackerFrame:CreateFontString(nil, "OVERLAY");
    BlacklistTrackerFrame.title:SetFontObject("GameFontHighlight");
    BlacklistTrackerFrame.title:SetPoint("LEFT", BlacklistTrackerFrame.TitleBg, "LEFT", 5, 0);
    BlacklistTrackerFrame.title:SetText(appName);

    BlacklistTrackerFrame.version = BlacklistTrackerFrame:CreateFontString(nil, "OVERLAY");
    BlacklistTrackerFrame.version:SetFontObject("GameFontHighlight");
    BlacklistTrackerFrame.version:SetPoint("RIGHT", BlacklistTrackerFrame.TitleBg, "RIGHT", -5, 0);
    BlacklistTrackerFrame.version:SetText("Version " ..appVersion);

    BlacklistTrackerFrame.authorLabel = blacklistTrackerUI.CreateTextObject(
        "Author: ", BlacklistTrackerFrame, "TOPLEFT", appMargin, -35);

    BlacklistTrackerFrame.author = blacklistTrackerUI.CreateTextObject(
        appAuthor, BlacklistTrackerFrame, "TOPLEFT", appMargin+100, -35);

    BlacklistTrackerFrame.dateLabel = blacklistTrackerUI.CreateTextObject(
        "Last Updated: ", BlacklistTrackerFrame, "TOPLEFT", appMargin, -55);

    BlacklistTrackerFrame.date = blacklistTrackerUI.CreateTextObject(
        appDate, BlacklistTrackerFrame, "TOPLEFT", appMargin+100, -55);

    BlacklistTrackerFrame.githubLabel = blacklistTrackerUI.CreateTextObject(
        "GitHub: ", BlacklistTrackerFrame, "TOPLEFT", appMargin, -75);

    local githubLink = "|HurlIndex:25|h|cff006995".. appGithub .."|r|h"
    BlacklistTrackerFrame.githubLink = blacklistTrackerUI.CreateEditBox(
        githubLink, BlacklistTrackerFrame, "TOPLEFT", appMargin+100, -75, 300, 13);

    BlacklistTrackerFrame.curseforgeLabel = blacklistTrackerUI.CreateTextObject(
        "Curseforge: ", BlacklistTrackerFrame, "TOPLEFT", appMargin, -95);

    local curseforgeLink = "|HurlIndex:25|h|cff006995".. appCurseforge .."|r|h"
    BlacklistTrackerFrame.curseforgeLink = blacklistTrackerUI.CreateEditBox(
        curseforgeLink, BlacklistTrackerFrame, "TOPLEFT", appMargin+100, -95, 300, 13);

    BlacklistTrackerFrame.supportedRealmsLabel = blacklistTrackerUI.CreateTextObject(
        "Realms: ", BlacklistTrackerFrame, "TOPLEFT", appMargin, -115);

    BlacklistTrackerFrame.supportedRealms = blacklistTrackerUI.CreateTextObject(
        appSupportedRealms, BlacklistTrackerFrame, "TOPLEFT", appMargin+100, -115);

    return BlacklistTrackerFrame;
end

function blacklistTrackerUI.InitGUIDDialog(guid)
    local Dialog = CreateFrame(
        "Frame", "BlacklistTrackerGUIDGrabDialog", UIParent, "BasicFrameTemplate");
    local toolbarWidth, toolbarHeight = 200, 60;
    Dialog:SetSize(toolbarWidth, toolbarHeight);
    Dialog:SetPoint("CENTER", UIParent, "CENTER");
    Dialog:Hide();
    Dialog:SetMovable(true);
    Dialog:EnableMouse(true)
    Dialog:RegisterForDrag("LeftButton")
    Dialog:SetScript("OnDragStart", Dialog.StartMoving)
    Dialog:SetScript("OnDragStop", Dialog.StopMovingOrSizing)

    Dialog.title = Dialog:CreateFontString(nil, "OVERLAY");
    Dialog.title:SetFontObject("GameFontHighlight");
    Dialog.title:SetPoint("LEFT", Dialog.TitleBg, "LEFT", 5, 0);
    Dialog.title:SetText(appName .." GrabGUID");

    Dialog.guidLabel = blacklistTrackerUI.CreateTextObject(
        blacklistTrackerFunctions.SetColour("Player GUID (Copy Here): ", "LIGHTBLUE"), Dialog, "TOPLEFT", 5, -25);

    local guidLink = "|HurlIndex:25|h|cff006995".. guid .."|r|h"
    Dialog.guidLink = blacklistTrackerUI.CreateEditBox(
        guidLink, Dialog, "TOPLEFT", 5, -40, 195, 20);

    return Dialog;
end

function blacklistTrackerUI.CreateTextObject(text, frame, point, x, y)
    local textObject = frame:CreateFontString(nil, "OVERLAY");
    textObject:SetFontObject("GameFontHighlight");
    textObject:SetPoint(point, frame, point, x, y);
    textObject:SetText(text);
    return textObject;
end

function blacklistTrackerUI.CreateEditBox(text, frame, point, x, y, sizeX, sizeY)
    local editBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate");
    editBox:SetSize(sizeX, sizeY);
    editBox:SetPoint(point, frame, point, x, y);
    editBox:SetText(text);
    editBox:SetAutoFocus(false);
    return editBox;
end

function blacklistTrackerUI.ToggleAppInfo()
    local BlacklistTrackerFrame =  blacklistTrackerUI.InitAppInfo();
    BlacklistTrackerFrame.SetShown(
        BlacklistTrackerFrame, not BlacklistTrackerFrame:IsShown());
end

function blacklistTrackerUI.ToggleToolbar()
    local BlacklistTrackerToolbar =  blacklistTrackerUI.InitToolbar();
    BlacklistTrackerToolbar.SetShown(
        BlacklistTrackerToolbar, not BlacklistTrackerToolbar:IsShown());
end

function blacklistTrackerUI.ToggleGUIDGrabDialog(guid)
    if guid then
        local BlacklistTrackerGUIDDialog = blacklistTrackerUI.InitGUIDDialog(guid);
        BlacklistTrackerGUIDDialog.SetShown(
            BlacklistTrackerGUIDDialog, not BlacklistTrackerGUIDDialog:IsShown());
    end
end

function blacklistTrackerFunctions.HandleSlashCommands(str)
    if (str == "toggle") or (str == "") then
        blacklistTrackerUI.ToggleToolbar();
    elseif (str == "info") or (str == "about") then
        blacklistTrackerUI.ToggleAppInfo();
    elseif (str == "version") then
        print(blacklistTrackerFunctions.SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."Version " ..appVersion);
    elseif string.match(str, "search") then
        blacklistTrackerFunctions.CheckForBadActor(str, "search");
    elseif string.match(str, "find") then
        blacklistTrackerFunctions.CheckForBadActor(str, "find");
    elseif (str == "grab") then
        blacklistTrackerFunctions.GrabGUID();
    elseif (str == "help") then
        print("");
        print("BlacklistTracker: /BL OR /BL toggle - Toggles the BlacklistTracker menu.");
        print("BlacklistTracker: /BL info OR /BL about - Shows information about the addon.");
        print("BlacklistTracker: /BL version - Shows the current version of the addon.");
        print("BlacklistTracker: /BL search <name> - Searches for a player in the blacklist.");
        print("BlacklistTracker: /BL find <name> - Searches for a player in the blacklist.");
        print("BlacklistTracker: /BL grab - Grabs the GUID of the current target.");
        print("BlacklistTracker: /BL help - Shows a help message.");
        print("");
    else
        print("BlacklistTracker: Invalid command, use /BL help for a list of commands.");
    end
end

function blacklistTrackerFunctions.GrabGUID()
    local name = UnitName("target");
    if name then
        C_FriendList.AddFriend(name);
        C_Timer.After(1, function()
            local guid = C_FriendList.GetFriendInfo(name).guid;
            print(blacklistTrackerFunctions.SetColour(guid.. " |||| " ..name, "LIGHTBLUE"));
            blacklistTrackerUI.ToggleGUIDGrabDialog(guid);
            C_FriendList.RemoveFriend(name);
        end)
    else
        print(blacklistTrackerFunctions.SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."No target selected.");
    end
end

function blacklistTrackerFunctions.LoadRealmData()
    print(blacklistTrackerFunctions.SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."Loading Realm Data... ")
    if GetRealmName() == "Lone Wolf" then
        badActors = BadActorsData.lonewolfEUData
        print(blacklistTrackerFunctions.SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."BlacklistTracker loaded for " ..GetRealmName());
    elseif GetRealmName() == "Chaos Bolt" then
        badActors = BadActorsData.chaosboltEUData
        print(blacklistTrackerFunctions.SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."BlacklistTracker loaded for " ..GetRealmName());
    else
        print(blacklistTrackerFunctions.SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."BlacklistTracker is not supported on " ..GetRealmName());
    end
end

function blacklistTrackerFunctions.SetColour(text, desiredColour)
	local startLine = '\124';
	local endLine = '\124r';
	for i = 1, #colours do
        if colours[i].title == desiredColour then
            return startLine .. colours[i].color .. text .. endLine;
        end
	end
end

function blacklistTrackerFunctions.GroupUpdateHandler()
    if not groupLock then
        groupLock = true;
        if IsInRaid() then
            for i=1,40 do
                local name = GetRaidRosterInfo(i);
                if name then
                    for j=1, #badActors do
                        if badActors[j][1] == name then
                            blacklistTrackerFunctions.Group.ProcessBadActor(badActors[j])
                        end
                    end
                end
            end
        elseif IsInGroup() then
            for i=1,5 do
                local name = GetRaidRosterInfo(i);
                if name then
                    for j=1, #badActors do
                        if badActors[j][1] == name then
                            blacklistTrackerFunctions.Group.ProcessBadActor(badActors[j])
                        end
                    end
                end
            end
        end
        C_Timer.After(groupTimer, function()
            groupLock = false;
        end)
    end
end

function blacklistTrackerFunctions.UnitHoverHandler()
    if not unithoverLock then
        local name = UnitName("mouseover");
        if name then
            unithoverLock = true;
            for i=1, #badActors do
                if badActors[i][1] == name then
                    blacklistTrackerFunctions.UnitFrame.ProcessBadActor(badActors[i])
                end
            end
            C_Timer.After(unithoverTimer, function()
                unithoverLock = false;
            end)
        end
    end
end

blacklistTrackerFunctions.UnitFrame = {};

function blacklistTrackerFunctions.UnitFrame.ProcessBadActor(badActor)
    local name = badActor[1];
    local reason = badActor[2];
    GameTooltip:AppendText(blacklistTrackerFunctions.SetColour(" [Blacklisted]", "RED"));
    blacklistTrackerFunctions.SendWarning(name, reason);
end

blacklistTrackerFunctions.Group = {};

function blacklistTrackerFunctions.Group.ProcessBadActor(badActor)
    local name = badActor[1];
    local reason = badActor[2];
    blacklistTrackerFunctions.SendWarning(name, reason);
end

function blacklistTrackerFunctions.SendWarning(name, reason)
    -- Prints a warning message to the chat window
    local warningMessage =  blacklistTrackerFunctions.SetColour(
        name.. " is blacklisted for " ..reason, "RED");
    print("")
    print(blacklistTrackerFunctions.SetColour("[WARNING]: ","LIGHTBLUE") ..warningMessage);

    local level = UnitLevel(name);
    local class = UnitClass(name);
    local race = UnitRace(name);

    -- Prints a note message relaying level, race and class info to the chat window
    print (
        blacklistTrackerFunctions.SetColour(
            "[Info]: ","LIGHTBLUE") .."Level " ..level.. " " ..race.. " " ..class);

    -- Prints a note message relaying guild info to the chat window
    local guildName, guildRankName, guildRankIndex = GetGuildInfo(name);
    if guildName then
        local guildMessage = blacklistTrackerFunctions.SetColour(
            name.. " is in <" ..guildName.. "> and is Rank: " ..guildRankName, "GREEN");
        print(blacklistTrackerFunctions.SetColour("[Guild]: ","LIGHTBLUE") ..guildMessage);
        print("")
    else
        local guildMessage = blacklistTrackerFunctions.SetColour(
            name.. " is not in a guild.", "GREEN");
        print(
            blacklistTrackerFunctions.SetColour("[Guild]: " ,"LIGHTBLUE") ..guildMessage);
            print("")
    end
end

function blacklistTrackerFunctions.CheckForBadActor(str, cmd)
    local name = ""
    if cmd == "search" then
        name = string.match(str, "search%s(.+)");
    elseif cmd == "find" then
        name = string.match(str, "find%s(.+)");
    end
    local found = false;
    for i=1, #badActors do
        if string.lower(badActors[i][1]) == string.lower(name) then
            found = true;
            blacklistTrackerFunctions.SendWarning(badActors[i][1], badActors[i][2]);
        end
    end
    if not found then
        print(blacklistTrackerFunctions.SetColour("[BlacklistTracker]: ", "LIGHTBLUE") .."No results found for " ..name);
    end
end

function BlacklistTracker_OnLoad()
    blacklistTrackerFunctions.LoadRealmData();
    blacklistTrackerUI.ToggleToolbar();
    SlashCmdList["BlacklistTracker"] = blacklistTrackerFunctions.HandleSlashCommands;
    SLASH_BlacklistTracker1= "/BlacklistTracker";
    SLASH_BlacklistTracker2= "/BL";
end
