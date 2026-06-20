--[[
	Example 2 — full feature tour
	Multiple tabs, lucide icons on tabs and inside modules,
	plus showcasing every header control.
]]

local Library = https://raw.githubusercontent.com/Nail120212/europhiav2/refs/heads/main/europhiav2.txt

local UI = Library:init({
	title = 'NexxTO Hub',
	logo  = 'rbxassetid://105054285909188',                 -- shown in header AND on the floating icon when minimized
	size  = UDim2.new(0, 420, 0, 350)   -- starting size; size-button cycles through presets from there
})

-- ===== Combat tab =====
local Combat = UI:create_tab('Combat', 'sword')

local AimbotModule = Combat:create_module({
	title = 'Aimbot',
	default = false,
	callback = function(state)
		print('aimbot:', state)
	end
})

AimbotModule:create_slider({
	title = 'FOV',
	minimum = 10,
	maximum = 200,
	default = 80,
	rounding = 0,
	callback = function(value) print('fov ->', value) end
})

AimbotModule:create_checkbox({
	title = 'Visible Check',
	default = true,
	callback = function(state) print('visible check ->', state) end
})

Combat:create_divider('Misc')

Combat:create_button({
	title = 'Reset Camera',
	callback = function() print('camera reset') end
})

-- ===== Visuals tab =====
local Visuals = UI:create_tab('Visuals', 'eye')

Visuals:create_checkbox({
	title = 'ESP',
	default = false,
	callback = function(state) print('esp:', state) end
})

Visuals:create_dropdown({
	title = 'ESP Mode',
	options = {'Box', 'Skeleton', 'Both'},
	default = 'Box',
	callback = function(value) print('esp mode ->', value) end
})

-- ===== Settings tab =====
local Settings = UI:create_tab('Settings', 'settings')

Settings:create_textbox({
	title = 'Webhook URL',
	placeholder = 'https://...',
	callback = function(text) print('webhook ->', text) end
})

Settings:create_button({
	title = 'Close UI',
	callback = function()
		UI:toggle_window(true) -- demonstrates minimizing from a button instead of the header
	end
})

UI:notify({
	title = 'Nex Hub',
	content = 'Try the size button to cycle window sizes, minimize to dock a draggable icon, or hit X to exit.',
	duration = 5,
	notify_type = 'normal'
})
