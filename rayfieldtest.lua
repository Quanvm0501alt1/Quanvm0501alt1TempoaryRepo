local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
getgenv().SecureMode = true

local player = game.Players.LocalPlayer
local Window = Rayfield:CreateWindow({
    Name = "Test Example Window",
    LoadingTitle = "Test Interface Suite",
    LoadingSubtitle = "by @vmquanalt1",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = true,
        Invite = "mAEVA8d5", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

Rayfield:Notify({
    Title = "Done!",
    Content = "Script loaded!",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
        Ignore = {
            Name = "Close",
            Callback = function()
                print("Script loaded!")
            end
        },
    },
})

function Notify(title, content)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = 6.5,
        Image = 4483362458,
        Actions = { -- Notification Buttons
            Ignore = {
                Name = "Close",
                Callback = function()
                    print("Script loaded!")
                end
            },
        },
    })
end

local Main = Window:CreateTab("Tab Main", 4483362458)
local Config = Window:CreateTab("Tab Config", 112137803832061)
local Button = Main:CreateButton({
    Name = "Button Example",
    Callback = function()
        Notify("Notification", "Button pressed!")
    end,
})
local Toggle = Main:CreateToggle({
   Name = "Toggle Example",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   Notify("Toggle1", value)
   end,
})
Rayfield:LoadConfiguration()
