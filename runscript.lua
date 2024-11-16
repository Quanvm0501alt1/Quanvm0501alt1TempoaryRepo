--[[

		Gui2Lua™
		10zOfficial
		Version 1.0.0

]]

-- Libraries
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Instances

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local close = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Fly = Instance.new("TextButton")
local IY = Instance.new("TextButton")
local ComingSoon = Instance.new("TextButton")
local Toggle = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

-- Properties

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BorderColor3 = Color3.new(0, 0.666667, 1)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.215735555, 0, 0.277638197, 0)
Frame.Size = UDim2.new(0, 729, 0, 353)

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.BorderColor3 = Color3.new(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.312757194, 0, 0, 0)
Title.Size = UDim2.new(0, 272, 0, 50)
Title.Font = Enum.Font.Unknown
Title.Text = "Test Global Hub 1"
Title.TextColor3 = Color3.new(0, 0.666667, 1)
Title.TextSize = 25

close.Name = "close"
close.Parent = Frame
close.BackgroundColor3 = Color3.new(1, 0, 0)
close.BorderColor3 = Color3.new(0, 0, 0)
close.BorderSizePixel = 0
close.Position = UDim2.new(0.959049582, 0, 0, 0)
close.Size = UDim2.new(0, 29, 0, 32)
close.Font = Enum.Font.FredokaOne
close.Text = "X"
close.TextColor3 = Color3.new(0, 0, 0)
close.TextSize = 25

UICorner.Parent = close

Fly.Name = "Fly"
Fly.Parent = Frame
Fly.BackgroundColor3 = Color3.new(1, 1, 1)
Fly.BackgroundTransparency = 1
Fly.BorderColor3 = Color3.new(0, 0.666667, 1)
Fly.BorderSizePixel = 0
Fly.Position = UDim2.new(0.03745047, 0, 0.139319137, 0)
Fly.Size = UDim2.new(0, 200, 0, 50)
Fly.Font = Enum.Font.FredokaOne
Fly.Text = "Fly"
Fly.TextColor3 = Color3.new(0, 0.666667, 1)
Fly.TextSize = 30
Fly.MouseButton1Down: connect(function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end)

IY.Name = "IY"
IY.Parent = Frame
IY.BackgroundColor3 = Color3.new(1, 1, 1)
IY.BackgroundTransparency = 1
IY.BorderColor3 = Color3.new(0, 0.666667, 1)
IY.BorderSizePixel = 0
IY.Position = UDim2.new(0.36313349, 0, 0.139319137, 0)
IY.Size = UDim2.new(0, 200, 0, 50)
IY.Font = Enum.Font.FredokaOne
IY.Text = "Infinte Yield FE"
IY.TextColor3 = Color3.new(0, 0.666667, 1)
IY.TextSize = 30
Fly.MouseButton1Down: connect(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

ComingSoon.Name = "Coming Soon"
ComingSoon.Parent = Frame
ComingSoon.BackgroundColor3 = Color3.new(1, 1, 1)
ComingSoon.BackgroundTransparency = 1
ComingSoon.BorderColor3 = Color3.new(0, 0.666667, 1)
ComingSoon.BorderSizePixel = 0
ComingSoon.Position = UDim2.new(0.683329403, 0, 0.139319137, 0)
ComingSoon.Size = UDim2.new(0, 200, 0, 50)
ComingSoon.Font = Enum.Font.FredokaOne
ComingSoon.Text = "Coming soon"
ComingSoon.TextColor3 = Color3.new(0, 0.666667, 1)
ComingSoon.TextSize = 30
ComingSoon.MouseButton1Down: connect(function()
Rayfield:Notify({
   Title = "Notification Title",
   Content = "Notification Content",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons

      Ignore = { -- Duplicate this table (or remove it) to add and remove buttons to the notification.
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      },

},
})
end)

Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.new(1, 1, 1)
Toggle.BorderColor3 = Color3.new(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0.0334890969, 0, 0.402010053, 0)
Toggle.Size = UDim2.new(0, 64, 0, 50)
Toggle.Font = Enum.Font.LuckiestGuy
Toggle.Text = "Open"
Toggle.TextColor3 = Color3.new(0, 0, 0)
Toggle.TextSize = 14

UICorner_2.Parent = Toggle

-- Scripts

local function TFYZOOU_fake_script() -- close.LocalScript 
	local script = Instance.new('LocalScript', close)

	local player = game.Players.LocalPlayer
	script. Parent.MouseButton1Click: Connect(function()
		player.PlayerGui.ScreenGui.Frame.Visible = false
	end)
end
coroutine.wrap(TFYZOOU_fake_script)()
local function WHVREIV_fake_script() -- Toggle.LocalScript 
	local script = Instance.new('LocalScript', Toggle)

	local player = game.Players.LocalPlayer
	script. Parent.MouseButton1Click: Connect(function()
		player.PlayerGui.ScreenGui.Frame.Visible = true
	end)
end
coroutine.wrap(WHVREIV_fake_script)()
Rayfield:LoadConfiguration()
