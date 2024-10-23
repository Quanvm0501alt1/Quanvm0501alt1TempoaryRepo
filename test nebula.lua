local Nebula = require(loadstring(game:HttpGet("https://raw.githubusercontent.com/Hunter-Infinity/Nebula-Library/refs/heads/main/Library")))
Nebula:Startup {
	Name = "Example Hub",
	Icon = "box"
} dock = Nebula:CreateDock() dock:CreateHomeTab() tab = dock:CreateTab({
	Name = "Player",
	Icon = "user",
	Gradient = 3
})
tab2 = dock:CreateTab()
tab:CreateSection("Section")
tab:CreateButton()
tab:CreateButton({
	Name = "Another Button",
	Callback = ""
})
tab:CreateButton({
	Name = "Yet another button",
	Description = "But this time with a description",
})
tab:CreateButton({
	Name = "Yet another button",
	Description = "But this time with a description again",
	Callback = ""
})
tab:CreateSection()
tab:CreateLabel({ Text = "This Is A Label" })
tab:CreateLabel {
	Style = 3,
	Text = "There Are 3 Types Of Labels. Info, Warning And Normal"
}
tab:CreateLabel({
	Style = 2,
	Text = "Labels Size Will Also Match The Bounds Of The Text Given. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
})
tab:CreateSection()
s = tab:CreateSlider({
	Gradient = 1,
	Callback = function(Value)
		print(Value)
	end,
})
tab:CreateButton({
	Name = "Slider Set Function Demonstration",
	Callback = function()
		s:Set(100)
	end,
})
tab:CreateSlider({
	Name = "Another Slider",
	Increment = 10,
	Gradient = 20,
	Callback = ""
})
tab:CreateToggle({
	Callback = function(v)
		print(v)
	end,
})
tab:CreateToggle({
	DefaultValue = true,
	Callback = "",
	Gradient = 18
})
tab:CreateDropdown({
	Name = "Dropdown - Multi Options",
	Options = {"Option 1","Option 2", "Option 3"},
	CurrentOption = {"Option 1"},
	MultipleOptions = true,
	Flag = "Dropdown1", 
	Callback = function(Option)
		-- Option returns a different variable depending whether you have multioptions enabled or not
		-- if you do, it returns a table of all active options (as strings)
		-- if you dont, it returns a string of the active option
		print(Option)
	end
})
tab:CreateDropdown({
	Name = "Dropdown - Callback Error Demo",
	Options = {"Option 1","Option 2", "Option 3"},
	CurrentOption = {},
	MultipleOptions = false,
	Flag = "Dropdown1", 
	Callback = ""
})
tab:CreateDropdown({
	Name = "Dropdown",
	Options = {"Option 1","Option 2", "Option 3"},
	CurrentOption = {"Option 1"},
	MultipleOptions = false,
	Flag = "Dropdown1", 
	Callback = function(Option)
		-- Option returns a different variable depending whether you have multioptions enabled or not
		-- if you do, it returns a table of all active options (as strings)
		-- if you dont, it returns a string of the active option
		print(Option)
	end
})
tab2:CreateSection()

tab2:CreateKeybind()

tab2:CreateKeybind({
	Name = "Another Keybind",
	Description = "But With A Description",
	CurrentKeybind = "E"	,
})

tab2:CreateKeybind({
	Name = "Another Keybind Again",
	Callback = "",
	CurrentKeybind = "C"
})

tab2:CreateKeybind({
	Name = "Another Keybind Once Again",
	Description = "But With A Description",
	CurrentKeybind = "Z",
	Callback = ""
})

tab2:CreateSection()

tab2:CreateTextbox({ 
	RemoveTextAfterFocusLost = true 
})

tab2:CreateTextbox({
	Name = "Another Dynamic Input",
	Description = "But With A Description"
})

tab2:CreateTextbox({
	Name = "Another Textbox Again",
	Callback = "",
	PlaceholderText = "Text"
})

tab2:CreateTextbox({
	Name = "Another Textbox Once Again",
	Description = "But With A Description",
	Callback = ""
})

tab2:CreateSection()

tab2:CreateColorPicker()

tab2:CreateColorPicker({
	Name = "Another Color Picker",
	Color = Color3.fromRGB(0, 255, 217),
	Flag = "ColorPicker2",
	Callback = ""
})
