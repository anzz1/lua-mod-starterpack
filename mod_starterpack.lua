------------------------------------------------------------------------------------------------
-- STARTER PACK MOD
------------------------------------------------------------------------------------------------

local EnableModule = true
local AnnounceModule = true           -- Announce module on player login ?

local starter_spells = {30167}        -- Learn these spells on new characters
local starter_items = {23162, 23162}  -- Give these items to new characters

------------------------------------------------------------------------------------------------
-- END CONFIG
------------------------------------------------------------------------------------------------

if (not EnableModule) then return end
local FILE_NAME = string.match(debug.getinfo(1,'S').source, "[^/\\]*.lua$")

local function onLogin(event, player)
    player:SendBroadcastMessage("This server is running the |cff4CFF00StarterPack|r module.")
end

local function onFirstLogin(event, player)
    for _,v in pairs(starter_spells) do
        player:LearnSpell(v)
    end
    for _,v in pairs(starter_items) do
        player:AddItem(v)
    end
    if (AnnounceModule) then
        player:RegisterEvent((function(_,_,_,p) p:SendBroadcastMessage("[|cff4CFF00StarterPack|r] You got a welcome gift. Enjoy!") end), 3000)
    end
end

RegisterPlayerEvent(30, onFirstLogin) -- PLAYER_EVENT_ON_FIRST_LOGIN
if (AnnounceModule) then
    RegisterPlayerEvent(3, onLogin)   -- PLAYER_EVENT_ON_LOGIN
end

PrintInfo("["..FILE_NAME.."] StarterPack module loaded.")
