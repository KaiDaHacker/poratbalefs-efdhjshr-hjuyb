local sped = false
local walksped = 16
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__newindex


function teleportto(cframe)
	local plyr = game.Players.LocalPlayer;
	if plyr.Character then
	plyr.Character.HumanoidRootPart.CFrame = cframe
	end
end

function createSound(id, volume, parent)
	volume = volume or 1 --1 is the default volume
	parent = parent or workspace --workspace is the default parent
	local Sound = Instance.new("Sound") 
	Sound.SoundId = "rbxassetid://"..id 
	Sound.Volume = volume 
	Sound.Parent = parent 
	return Sound 
end
   
function spedy(walkspeed)
    _G.ws = walkspeed
    mt.__newindex = newcclosure(function(o, k, v)
        if tostring(o) == "Humanoid" and tostring(k) == "WalkSpeed" then
          return old(o, k, _G.ws)
        end       
        return old(o, k, v)       
      end)
end 

local gottagofast = createSound("196096298") -- gotta go fast
local windowserror = createSound("7930024055") -- windows error
local vineboom = createSound("6308606116") -- vine boom
local seeyouagain = createSound("6251939571") -- pub see you again
local deeznuts = createSound("6138144190") -- deez nuts
local howwhat = createSound("5978550333") -- how what
local ahhdie = createSound("7772283448") -- ahh disapearing into the distance
local beegfard = createSound("6445594239") -- big poop
local tacobell = createSound("6832470734") -- taco bell
local flying = createSound("9061674082") -- oeoeao wooohoaoaoo flying
local bruh = createSound("6349641063") -- bruh
local windowsstartup = createSound("9094546337") -- windows startup

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local window = lib.CreateLib("poratbalefs efdhjshr hjuyb", "Ocean")
windowsstartup:Play()
local tab = window:NewTab("a tab")
local newsec = tab:NewSection("a section ")
newsec:NewButton("deez nuts", "deez nuts", function()
    deeznuts:Play()
end)
newsec:NewToggle("clicck to up", "it ups you", function(state)
    if state then
        flying:Play()
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = 100
    else
        bruh:Play()
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
    end
end)
newsec:NewToggle("speed", "it turns on and off speed", function(state)
    if state then
        spedy(walksped)
        gottagofast:Play()
        sped = true
    else
        spedy(16)
        sped = false
    end
end)
newsec:NewSlider("Set speed", "this sets your characters speed", 500, 16, function(walkspeed) 
    walksped = walkspeed
    if sped then
        spedy(walksped)
    end
end)
newsec:NewToggle("clicck to joomp heigh", "it joomp heighs you", function(state)
    if state then
        ahhdie:Play()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 250
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)
newsec:NewButton("click to big fard (loud)", "you just fard, thats it", function()
    beegfard:Play()
    game.Players.LocalPlayer.Character.Humanoid.Sit = true
end)



local t = window:NewTab("a tab part 2")
local sec = t:NewSection("a section part 2")

sec:NewKeybind("Toggle GUI", "it toggles the gui", Enum.KeyCode.RightShift, function()
    windowserror:Play()
	lib:ToggleUI()
end)
sec:NewDropdown("Pick a number any number", "this does nothing", {"1", "2", "3","4","5"}, function(currentOption)
    howwhat:Play()
end)
sec:NewColorPicker("pick a color any color", "this does nothing", Color3.fromRGB(0,0,0), function(color)
    -- Second argument is the default color
end)
