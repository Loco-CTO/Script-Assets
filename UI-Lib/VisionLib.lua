--[[
 __      ___     _               _    _ _   _      _ _     
 \ \    / (_)   (_)             | |  | (_) | |    (_) |    
  \ \  / / _ ___ _  ___  _ __   | |  | |_  | |     _| |__  
   \ \/ / | / __| |/ _ \| '_ \  | |  | | | | |    | | '_ \ 
    \  /  | \__ \ | (_) | | | | | |__| | | | |____| | |_) |
     \/   |_|___/_|\___/|_| |_|  \____/|_| |______|_|_.__/ 
                                                           

    Discord: https://discord.gg/Bp7wFcZeUn
    
]]--                                               

-- Services
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse() 

-- Var
local Library = {
	DragSpeed = 0.1,
	LockDragging = false,
	MainFrameHover = false,
	Sliding = false,
	TweeningToggle = false
}

-- Lib
function Library:ToggleGui(toggle, frame)
	if toggle == true then
		frame.Visible = true
		
		Library:Tween(frame, {
			Length = 0.5, 
			Goal = {Size = UDim2.new(0, 431, 0, 506)}
		})
		
		Library:Tween(frame.DropShadowHolder.DropShadow, {
			Length = 0.5, 
			Goal = {ImageTransparency = 0.5}
		})
	else
		Library:Tween(frame.DropShadowHolder.DropShadow, {
			Length = 0.5, 
			Goal = {ImageTransparency = 1}
		})
		
		Library:Tween(frame, {
			Length = 0.5, 
			Goal = {Size = UDim2.new(0, 0, 0, 0)}
		})
		
		task.spawn(function()
			task.wait(0.5)
			frame.Visible = false
		end)
	end
	return
end

function Library:ToggleNav(toggle, frame)
	if toggle == true then
		frame.Position = UDim2.new(-0.455, 0,-0.004, 0)
		frame.Visible = true
		Library:Tween(frame, {Length = 0.7, Goal = {Position = UDim2.new(-0, 0,-0.004, 0)}})
	else
		frame.Position = UDim2.new(-0, 0,-0.004, 0)
		Library:Tween(frame, {Length = 0.7, Goal = {Position = UDim2.new(-0.455, 0,-0.004, 0)}})
	end
	
	return true
end

function Library:Tween(object, options, callback)
	local options = Library:Place_Defaults({
		Length = 2,
		Style = Enum.EasingStyle.Quint,
		Direction = Enum.EasingDirection.Out
	}, options)
	
	callback = callback or function() return end

	local tweeninfo = TweenInfo.new(options.Length, options.Style, options.Direction)

	local Tween = TweenService:Create(object, tweeninfo, options.Goal) 
	Tween:Play()

	Tween.Completed:Connect(function()
		callback()
	end)
	
	return Tween
end

function Library:ResizeCanvas(Tab)
	local NumChild = 0
	local ChildOffset = 0
	
	for i, v in pairs(Tab:GetChildren()) do
		if v:IsA("Frame") then
			NumChild += 1
			ChildOffset = ChildOffset + v.Size.Y.Offset
		end
	end
	
	local NumChildOffset = NumChild * 5
	
	local CanvasSizeY = NumChildOffset + ChildOffset + 14
	
	Library:Tween(Tab, {
		Length = 1,
		Goal = {CanvasSize = UDim2.new(0, 0, 0, CanvasSizeY)}
	})
end

function Library:Place_Defaults(defaults, options)
	defaults = defaults or {}
	options = options or {}
	for option, value in next, options do
		defaults[option] = value
	end
	
	return defaults
end

function Library:Create(options)
	options = Library:Place_Defaults({
		Name = "UI Lib",
		ShadowColor = Color3.new(0, 0, 0),
		ToggleKey = Enum.KeyCode.RightShift
	}, options or {})
	
	local GUI = {
		Navagation = false,
		Visible = false,
		CurrentTab = nil,
		ToggleKey = options.ToggleKey
	}
	 
	-- BaseFrame
	do
		-- StarterGui.VisionLib
		GUI["1"] = Instance.new("ScreenGui")
		GUI["1"]["Parent"] = (RunService:IsStudio() and Player.PlayerGui) or game:GetService("CoreGui")
		GUI["1"]["Name"] = [[VisionLib]]
		GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	end
	
	-- Main Frame
	do
		-- StarterGui.VisionLib.MainFrame
		GUI["2"] = Instance.new("Frame", GUI["1"])
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41)
		GUI["2"]["Size"] = UDim2.new(0, 431, 0, 506)
		GUI["2"]["ClipsDescendants"] = true
		GUI["2"]["Position"] = UDim2.new(0.3449864089488983, 0, 0.09605705738067627, 0)
		GUI["2"]["Name"] = [[MainFrame]]

		-- StarterGui.VisionLib.MainFrame.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"])
		GUI["3"]["CornerRadius"] = UDim.new(0, 6)
		
		-- StarterGui.VisionLib.MainFrame.DropShadowHolder
		GUI["34"] = Instance.new("Frame", GUI["2"])
		GUI["34"]["ZIndex"] = 1
		GUI["34"]["BorderSizePixel"] = 0
		GUI["34"]["BackgroundTransparency"] = 1
		GUI["34"]["Size"] = UDim2.new(1, 0, 1, 0)
		GUI["34"]["Name"] = [[DropShadowHolder]]
		
		-- StarterGui.VisionLib.MainFrame.DropShadowHolder.DropShadow
		GUI["35"] = Instance.new("ImageLabel", GUI["34"])
		GUI["35"]["ZIndex"] = 0
		GUI["35"]["BorderSizePixel"] = 0
		GUI["35"]["SliceCenter"] = Rect.new(49, 49, 450, 450)
		GUI["35"]["ScaleType"] = Enum.ScaleType.Slice
		GUI["35"]["ImageColor3"] = Color3.fromRGB(0, 0, 0)
		GUI["35"]["ImageTransparency"] = 0.5
		GUI["35"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
		GUI["35"]["Image"] = [[rbxassetid://6014261993]]
		GUI["35"]["Size"] = UDim2.new(1, 47, 1, 47)
		GUI["35"]["Name"] = [[DropShadow]]
		GUI["35"]["BackgroundTransparency"] = 1
		GUI["35"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
		
		-- StarterGui.VisionLib.ShadowFrame
		GUI["b9"] = Instance.new("Frame", GUI["1"])
		GUI["b9"]["ZIndex"] = 0
		GUI["b9"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41)
		GUI["b9"]["BackgroundTransparency"] = 1
		GUI["b9"]["Size"] = UDim2.new(0, 431, 0, 506)
		GUI["b9"]["Position"] = UDim2.new(0.3449864089488983, 0, 0.09605705738067627, 0)
		GUI["b9"]["Name"] = [[ShadowFrame]]

		-- StarterGui.VisionLib.ShadowFrame.DropShadowHolder
		GUI["ba"] = Instance.new("Frame", GUI["b9"])
		GUI["ba"]["BorderSizePixel"] = 0
		GUI["ba"]["BackgroundTransparency"] = 1
		GUI["ba"]["Size"] = UDim2.new(1, 0, 1, 0)
		GUI["ba"]["Name"] = [[DropShadowHolder]]

		-- StarterGui.VisionLib.ShadowFrame.DropShadowHolder.DropShadow
		GUI["bb"] = Instance.new("ImageLabel", GUI["ba"])
		GUI["bb"]["ZIndex"] = 0
		GUI["bb"]["BorderSizePixel"] = 0
		GUI["bb"]["SliceCenter"] = Rect.new(49, 49, 450, 450)
		GUI["bb"]["ScaleType"] = Enum.ScaleType.Slice
		GUI["bb"]["ImageColor3"] = options.ShadowColor
		GUI["bb"]["ImageTransparency"] = 0.5
		GUI["bb"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
		GUI["bb"]["Image"] = [[rbxassetid://6014261993]]
		GUI["bb"]["Size"] = UDim2.new(1, 47, 1, 47)
		GUI["bb"]["Name"] = [[DropShadow]]
		GUI["bb"]["BackgroundTransparency"] = 1
		GUI["bb"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
	end

	-- TitleBar
	do
		-- StarterGui.VisionLib.MainFrame.TitleBar
		GUI["4"] = Instance.new("Frame", GUI["2"])
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
		GUI["4"]["Size"] = UDim2.new(0, 430, 0, 35)
		GUI["4"]["Position"] = UDim2.new(0, 0, -0.001381644164212048, 0)
		GUI["4"]["Name"] = [[TitleBar]]

		-- StarterGui.VisionLib.MainFrame.TitleBar.TextLabel
		GUI["5"] = Instance.new("TextLabel", GUI["4"])
		GUI["5"]["TextXAlignment"] = Enum.TextXAlignment.Left
		GUI["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		GUI["5"]["TextSize"] = 14
		GUI["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		GUI["5"]["Size"] = UDim2.new(0, 245, 0, 26)
		GUI["5"]["Text"] = options.Name
		GUI["5"]["Font"] = Enum.Font.GothamMedium
		GUI["5"]["BackgroundTransparency"] = 1
		GUI["5"]["Position"] = UDim2.new(0.13847187161445618, 0, 0.11800000071525574, 0)

		-- StarterGui.VisionLib.MainFrame.TitleBar.UICorner
		GUI["6"] = Instance.new("UICorner", GUI["4"])
		GUI["6"]["CornerRadius"] = UDim.new(0, 6)

		-- StarterGui.VisionLib.MainFrame.TitleBar.Open
		GUI["7"] = Instance.new("ImageButton", GUI["4"])
		GUI["7"]["BorderSizePixel"] = 0
		GUI["7"]["SliceScale"] = 0
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		GUI["7"]["Image"] = [[rbxassetid://11254241743]]
		GUI["7"]["Size"] = UDim2.new(0, 26, 0, 26)
		GUI["7"]["Name"] = [[Open]]
		GUI["7"]["Position"] = UDim2.new(0.0325581394135952, 0, 0.11428571492433548, 0)
		GUI["7"]["BackgroundTransparency"] = 1

		-- StarterGui.VisionLib.MainFrame.TitleBar.Seperator
		GUI["8"] = Instance.new("Frame", GUI["4"])
		GUI["8"]["BorderSizePixel"] = 0
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(45, 45, 45)
		GUI["8"]["BackgroundTransparency"] = 0.009999999776482582
		GUI["8"]["Size"] = UDim2.new(0, 430, 0, 2)
		GUI["8"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
		GUI["8"]["Position"] = UDim2.new(0.002320185536518693, 0, 0.9811705946922302, 0)
		GUI["8"]["Name"] = [[Seperator]]

		-- StarterGui.VisionLib.MainFrame.TitleBar.Hide
		GUI["9"] = Instance.new("ImageButton", GUI["4"])
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		GUI["9"]["Image"] = [[rbxassetid://11255032783]]
		GUI["9"]["Size"] = UDim2.new(0, 20, 0, 20)
		GUI["9"]["Name"] = [[Hide]]
		GUI["9"]["Position"] = UDim2.new(0.9348837733268738, 0, 0.20000000298023224, 0)
		GUI["9"]["BackgroundTransparency"] = 1

		-- StarterGui.VisionLib.MainFrame.TitleBar.Settings
		GUI["a"] = Instance.new("ImageButton", GUI["4"])
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		GUI["a"]["Image"] = [[rbxassetid://11254233757]]
		GUI["a"]["Size"] = UDim2.new(0, 20, 0, 20)
		GUI["a"]["Name"] = [[Settings]]
		GUI["a"]["Position"] = UDim2.new(0.8799999952316284, 0, 0.20000000298023224, 0)
		GUI["a"]["BackgroundTransparency"] = 1
	end
	
	-- NavagationBar
	do
		-- StarterGui.VisionLib.MainFrame.NavagationBar
		GUI["27"] = Instance.new("Frame", GUI["2"])
		GUI["27"]["ZIndex"] = 3
		GUI["27"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
		GUI["27"]["Size"] = UDim2.new(0, 196, 0, 504)
		GUI["27"]["Position"] = UDim2.new(0.002261430025100708, 0, -0.00020906329154968262, 0)
		GUI["27"]["Visible"] = false
		GUI["27"]["Name"] = [[NavagationBar]]

		-- StarterGui.VisionLib.MainFrame.NavagationBar.UICorner
		GUI["28"] = Instance.new("UICorner", GUI["27"])
		GUI["28"]["CornerRadius"] = UDim.new(0, 6)

		-- StarterGui.VisionLib.MainFrame.NavagationBar.Seperator
		GUI["29"] = Instance.new("Frame", GUI["27"])
		GUI["29"]["ZIndex"] = 2
		GUI["29"]["BorderSizePixel"] = 0
		GUI["29"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
		GUI["29"]["BackgroundTransparency"] = 0.009999999776482582
		GUI["29"]["Size"] = UDim2.new(0, 194, 0, 2)
		GUI["29"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
		GUI["29"]["Position"] = UDim2.new(0.007422310765832663, 0, 0.13464957475662231, 0)
		GUI["29"]["Name"] = [[Seperator]]

		-- StarterGui.VisionLib.MainFrame.NavagationBar.ScrollFrame
		GUI["2a"] = Instance.new("ScrollingFrame", GUI["27"])
		GUI["2a"]["Active"] = true
		GUI["2a"]["ZIndex"] = 2
		GUI["2a"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
		GUI["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		GUI["2a"]["BackgroundTransparency"] = 1
		GUI["2a"]["Size"] = UDim2.new(0, 166, 0, 427)
		GUI["2a"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
		GUI["2a"]["ScrollBarThickness"] = 0
		GUI["2a"]["Position"] = UDim2.new(0.07653061300516129, 0, 0.15427041053771973, 0)
		GUI["2a"]["Name"] = [[ScrollFrame]]

		-- StarterGui.VisionLib.MainFrame.NavagationBar.ScrollFrame.UIPadding
		GUI["2f"] = Instance.new("UIPadding", GUI["2a"])
		GUI["2f"]["PaddingTop"] = UDim.new(0, 3)
		GUI["2f"]["PaddingLeft"] = UDim.new(0, 23)

		-- StarterGui.VisionLib.MainFrame.NavagationBar.ScrollFrame.UIListLayout
		GUI["30"] = Instance.new("UIListLayout", GUI["2a"])
		GUI["30"]["SortOrder"] = Enum.SortOrder.LayoutOrder

		-- StarterGui.VisionLib.MainFrame.NavagationBar.Banner
		GUI["2f"] = Instance.new("ImageLabel", GUI["27"])
		GUI["2f"]["ZIndex"] = 2
		GUI["2f"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44)
		GUI["2f"]["ImageColor3"] = Color3.fromRGB(213, 213, 213)
		GUI["2f"]["Image"] = [[rbxassetid://11254912640]]
		GUI["2f"]["Size"] = UDim2.new(0, 182, 0, 54)
		GUI["2f"]["Name"] = [[Banner]]
		GUI["2f"]["Position"] = UDim2.new(0.0357142873108387, 0, 0.01587301678955555, 0)
		GUI["2f"]["BorderSizePixel"] = 0

		-- StarterGui.VisionLib.MainFrame.NavagationBar.Banner.UICorner
		GUI["32"] = Instance.new("UICorner", GUI["2f"])
		GUI["32"]["CornerRadius"] = UDim.new(0, 6)

		-- StarterGui.VisionLib.MainFrame.NavagationBar.Close
		GUI["33"] = Instance.new("ImageButton", GUI["27"])
		GUI["33"]["ZIndex"] = 3
		GUI["33"]["BorderSizePixel"] = 0
		GUI["33"]["SliceScale"] = 0
		GUI["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		GUI["33"]["Image"] = [[rbxassetid://11254839668]]
		GUI["33"]["Size"] = UDim2.new(0, 26, 0, 26)
		GUI["33"]["Name"] = [[Close]]
		GUI["33"]["Position"] = UDim2.new(0.04100000113248825, 0, 0.009999999776482582, 0)
		GUI["33"]["BackgroundTransparency"] = 1
	end
	
	function GUI:Tab(options)
		options = Library:Place_Defaults({
			Name = "Tab",
			Icon = "rbxassetid://11254763826",
			Hidden = false
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false,
			Hidden = options.Hidden
		}
		
		do
			if options.Hidden == false then
				-- StarterGui.VisionLib.MainFrame.NavagationBar.ScrollFrame.ButtonFrame
				Tab["29"] = Instance.new("Frame", GUI["2a"])
				Tab["29"]["ZIndex"] = 2
				Tab["29"]["BorderSizePixel"] = 0
				Tab["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Tab["29"]["BackgroundTransparency"] = 1
				Tab["29"]["Size"] = UDim2.new(0, 123, 0, 33)
				Tab["29"]["Position"] = UDim2.new(0.1265062391757965, 0, 0.011693159118294716, 0)
				Tab["29"]["Name"] = [[ButtonFrame]]

				-- StarterGui.VisionLib.MainFrame.NavagationBar.ScrollFrame.ButtonFrame.Button
				Tab["2a"] = Instance.new("TextButton", Tab["29"])
				Tab["2a"]["AutoButtonColor"] = false
				Tab["2a"]["ZIndex"] = 2
				Tab["2a"]["TextSize"] = 14
				Tab["2a"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
				Tab["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Tab["2a"]["Size"] = UDim2.new(0, 166, 0, 30)
				Tab["2a"]["Name"] = [[Button]]
				Tab["2a"]["Text"] = [[]]
				Tab["2a"]["Font"] = Enum.Font.Gotham
				Tab["2a"]["Position"] = UDim2.new(-0.17090019583702087, 0, -0.11897826939821243, 0)

				-- StarterGui.VisionLib.MainFrame.NavagationBar.ScrollFrame.ButtonFrame.Button.UICorner
				Tab["2b"] = Instance.new("UICorner", Tab["2a"])
				Tab["2b"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.NavagationBar.ScrollFrame.ButtonFrame.Button.TextLabel
				Tab["2c"] = Instance.new("TextLabel", Tab["2a"])
				Tab["2c"]["Text"] = options.Name
				Tab["2c"]["ZIndex"] = 5
				Tab["2c"]["BorderSizePixel"] = 0
				Tab["2c"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Tab["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Tab["2c"]["TextSize"] = 14
				Tab["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Tab["2c"]["Size"] = UDim2.new(0, 129, 0, 20)
				Tab["2c"]["Font"] = Enum.Font.Gotham
				Tab["2c"]["BackgroundTransparency"] = 1
				Tab["2c"]["Position"] = UDim2.new(0.2049439251422882, 0, 0.17399999499320984, 0)

				-- StarterGui.VisionLib.MainFrame.NavagationBar.ScrollFrame.ButtonFrame.Icon
				Tab["2d"] = Instance.new("ImageLabel", Tab["29"])
				Tab["2d"]["ZIndex"] = 3
				Tab["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Tab["2d"]["Image"] = options.Icon
				Tab["2d"]["Size"] = UDim2.new(0, 20, 0, 20)
				Tab["2d"]["Name"] = [[Icon]]
				Tab["2d"]["BackgroundTransparency"] = 1
				Tab["2d"]["Position"] = UDim2.new(-0.12800000607967377, 0, 0.019999999552965164, 0)

				Tab["2a"].MouseEnter:Connect(function()
					Tab.Hover = true

					Library:Tween(Tab["2c"], {
						Length = 0.2,
						Goal = {TextColor3 = Color3.fromRGB(136, 103, 177)}
					})
					Library:Tween(Tab["2d"], {
						Length = 0.2,
						Goal = {ImageColor3 = Color3.fromRGB(136, 103, 177)}
					})
				end)

				Tab["2a"].MouseLeave:Connect(function()
					Tab.Hover = false

					Library:Tween(Tab["2c"], {
						Length = 0.2,
						Goal = {TextColor3 = Color3.fromRGB(255, 255, 255)}
					})
					Library:Tween(Tab["2d"], {
						Length = 0.2,
						Goal = {ImageColor3 = Color3.fromRGB(255, 255, 255)}
					})
				end)

				Tab["2a"].MouseButton1Click:Connect(function()
					if not Tab.Active then
						Tab:Activate()
					end
				end)
			end
		end
		
		do
			Tab["b"] = Instance.new("ScrollingFrame", GUI["2"])
			Tab["b"]["Active"] = true
			Tab["b"]["BorderSizePixel"] = 0
			Tab["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Tab["b"]["BackgroundTransparency"] = 1
			Tab["b"]["Size"] = UDim2.new(0, 431, 0, 471)
			Tab["b"]["ScrollBarImageColor3"] = Color3.fromRGB(78, 78, 78)
			Tab["b"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
			Tab["b"]["ScrollBarThickness"] = 5
			Tab["b"]["Position"] = UDim2.new(0, 0, 0.06916996091604233, 0)
			Tab["b"]["Name"] = [[MainContainer]]
			Tab["b"]["CanvasSize"] = UDim2.new(0, 0, 0, 0)
			Tab["b"]["ClipsDescendants"] = true

			Tab["c"] = Instance.new("UIListLayout", Tab["b"])
			Tab["c"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
			Tab["c"]["Padding"] = UDim.new(0, 5)
			Tab["c"]["SortOrder"] = Enum.SortOrder.LayoutOrder

			Tab["d"] = Instance.new("UIPadding", Tab["b"])
			Tab["d"]["PaddingTop"] = UDim.new(0, 7)
			
			Tab["b"].Visible = false
		end
	
		-- Handler
		do	
			function Tab:Activate()
				if not Tab.Active then
					if GUI.CurrentTab ~= nil then
						GUI.CurrentTab:Deactivate()
					end
					
					Tab.Active = true
					
					if not Tab.Hidden then
						Library:Tween(Tab["2a"], {
							Length = 0.2,
							Goal = {BackgroundColor3 = Color3.fromRGB(3, 3, 3)}
						})
					end
					
					if GUI.Navagation then
						GUI.Navagation = false
						Library:ToggleNav(GUI.Navagation, GUI["27"])
					end
					
					Tab["b"].Visible = true
					GUI.CurrentTab = Tab
				end
			end
			
			function Tab:Deactivate()
				if Tab.Active then
					Tab.Active = false
					Tab.Hover = false
					
					Tab["b"].Visible = false
					
					if not options.Hidden then
						Library:Tween(Tab["2a"], {
							Length = 0.2,
							Goal = {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}
						})
					end
				end
			end
			
			if GUI.CurrentTab == nil then
				if not options.Hidden then
					Tab:Activate()
				end
			end
		end
		
		-- Sections
		function Tab:Section(options)
			options = Library:Place_Defaults({
				Name = "Section",
			}, options or {})

			local Section = {}

			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.SectionFrame
				Section["c"] = Instance.new("Frame", Tab["b"])
				Section["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Section["c"]["BackgroundTransparency"] = 1
				Section["c"]["Size"] = UDim2.new(0, 400, 0, 28)
				Section["c"]["Position"] = UDim2.new(0.03596287593245506, 0, 0, 0)
				Section["c"]["Name"] = [[SectionFrame]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.SectionFrame.TextLabel
				Section["d"] = Instance.new("TextLabel", Section["c"])
				Section["d"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Section["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Section["d"]["TextSize"] = 12
				Section["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Section["d"]["Size"] = UDim2.new(0, 400, 0, 19)
				Section["d"]["Text"] = options.Name
				Section["d"]["Font"] = Enum.Font.Gotham
				Section["d"]["BackgroundTransparency"] = 1
				Section["d"]["Position"] = UDim2.new(0, 0, 0.27272742986679077, 0)
			end

			function Section:SetText(name)
				Section["d"]["Text"] = name
			end
			
			Library:ResizeCanvas(Tab["b"])
			return Section
		end
		
		-- TextButton
		function Tab:Button(options)
			options = Library:Place_Defaults({
				Name = "Button",
				Callback = function() end
			}, options or {})
			
			local Button = {}
			
			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.ButtonFrame
				Button["14"] = Instance.new("Frame", Tab["b"])
				Button["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Button["14"]["BackgroundTransparency"] = 1
				Button["14"]["Size"] = UDim2.new(0, 400, 0, 30)
				Button["14"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
				Button["14"]["Position"] = UDim2.new(0.03596287593245506, 0, 0.10775861889123917, 0)
				Button["14"]["Name"] = [[ButtonFrame]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ButtonFrame.TextButton
				Button["15"] = Instance.new("TextButton", Button["14"])
				Button["15"]["TextSize"] = 14
				Button["15"]["AutoButtonColor"] = false
				Button["15"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Button["15"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Button["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Button["15"]["Size"] = UDim2.new(0, 400, 0, 30)
				Button["15"]["Text"] = "  "..options.Name
				Button["15"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.ButtonFrame.TextButton.UICorner
				Button["16"] = Instance.new("UICorner", Button["15"])
				Button["16"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ButtonFrame.TextButton.UIStroke
				Button["17"] = Instance.new("UIStroke", Button["15"])
				Button["17"]["Color"] = Color3.fromRGB(60, 60, 60)
				Button["17"]["Thickness"] = 0.699999988079071
				Button["17"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
				
				-- StarterGui.VisionLib.MainFrame.MainContainer.ButtonFrame.ImageLabel
				Button["18"] = Instance.new("ImageLabel", Button["14"])
				Button["18"]["ZIndex"] = 2
				Button["18"]["BorderSizePixel"] = 0
				Button["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Button["18"]["Image"] = [[rbxassetid://11255462876]]
				Button["18"]["Size"] = UDim2.new(0, 22, 0, 22)
				Button["18"]["BackgroundTransparency"] = 1
				Button["18"]["Position"] = UDim2.new(0.9249999523162842, 0, 0.13333334028720856, 0)
			end
			
			Button["15"].MouseEnter:Connect(function()
				Library:Tween(Button["15"], {
					Length = 0.2,
					Goal = {TextColor3 = Color3.fromRGB(136, 103, 177)}
				})
				
				Library:Tween(Button["17"], {
					Length = 0.2,
					Goal = {Color = Color3.fromRGB(136, 103, 177)}
				})
				
				Library:Tween(Button["18"], {
					Length = 0.2,
					Goal = {ImageColor3 = Color3.fromRGB(136, 103, 177)}
				})
			end)
			
			Button["15"].MouseLeave:Connect(function()
				Library:Tween(Button["15"], {
					Length = 0.2,
					Goal = {TextColor3 = Color3.fromRGB(255, 255, 255)}
				})
				
				Library:Tween(Button["17"], {
					Length = 0.2,
					Goal = {Color = Color3.fromRGB(59, 59, 59)}
				})
				
				Library:Tween(Button["18"], {
					Length = 0.2,
					Goal = {ImageColor3 = Color3.fromRGB(255, 255, 255)}
				})
			end)
			
			Button["15"].MouseButton1Click:Connect(function()
				task.spawn(function()
					Library:Tween(Button["15"], {
						Length = 0.1,
						Goal = {BackgroundColor3 = Color3.fromRGB(16, 16, 16)}
					})
					
					task.wait(0.1)
					
					Library:Tween(Button["15"], {
						Length = 0.1,
						Goal = {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
					})
				end)
				
				options.Callback()
			end)
			
			--Methods
			function Button:SetText(text)
				Button["15"]["Text"] = "  "..text
			end
			
			Library:ResizeCanvas(Tab["b"])
			return Button
		end
		
		-- TextLabel
		function Tab:TextLabel(options)
			options = Library:Place_Defaults({
				Name = "Label",
				Color = Color3.new(1, 1, 1)
			}, options or {})

			local TextLabel = {}

			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.LabelFrame
				TextLabel["10"] = Instance.new("Frame", Tab["b"])
				TextLabel["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				TextLabel["10"]["BackgroundTransparency"] = 1
				TextLabel["10"]["Size"] = UDim2.new(0, 400, 0, 30)
				TextLabel["10"]["Name"] = [[LabelFrame]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.LabelFrame.TextLabel
				TextLabel["11"] = Instance.new("TextLabel", TextLabel["10"])
				TextLabel["11"]["TextXAlignment"] = Enum.TextXAlignment.Left
				TextLabel["11"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 18)
				TextLabel["11"]["TextSize"] = 14
				TextLabel["11"]["TextColor3"] = options.Color
				TextLabel["11"]["Size"] = UDim2.new(0, 400, 0, 30)
				TextLabel["11"]["Text"] = "  "..options.Name
				TextLabel["11"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.LabelFrame.TextLabel.UICorner
				TextLabel["12"] = Instance.new("UICorner", TextLabel["11"])
				TextLabel["12"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.LabelFrame.TextLabel.UIStroke
				TextLabel["13"] = Instance.new("UIStroke", TextLabel["11"])
				TextLabel["13"]["Color"] = options.Color
				TextLabel["13"]["Thickness"] = 0.699999988079071
				TextLabel["13"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			end
			
			function TextLabel:SetText(name)
				TextLabel["11"]["Text"] = "  "..name
			end
			
			function TextLabel:SetColor(color)
				TextLabel["11"]["TextColor3"] = color
				TextLabel["13"]["Color"] = color
			end
			
			Library:ResizeCanvas(Tab["b"])
			return TextLabel
		end
		
		-- Toggle
		function Tab:Toggle(options)
			options = Library:Place_Defaults({
				Name = "Toggle",
				Default = false,
				Callback = function() return end,
			}, options or {})
			
			local Toggle = {
				Bool = options.Default
			}
			
			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.ToggleFrame
				Toggle["19"] = Instance.new("Frame", Tab["b"])
				Toggle["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Toggle["19"]["BackgroundTransparency"] = 1
				Toggle["19"]["Size"] = UDim2.new(0, 400, 0, 30)
				Toggle["19"]["Name"] = [[ToggleFrame]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ToggleFrame.TextButton
				Toggle["1a"] = Instance.new("TextButton", Toggle["19"])
				Toggle["1a"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Toggle["1a"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Toggle["1a"]["TextSize"] = 14
				Toggle["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Toggle["1a"]["Size"] = UDim2.new(0, 400, 0, 30)
				Toggle["1a"]["Text"] = "  "..options.Name
				Toggle["1a"]["Font"] = Enum.Font.Gotham
				Toggle["1a"]["AutoButtonColor"] = false

				-- StarterGui.VisionLib.MainFrame.MainContainer.ToggleFrame.TextButton.UICorner
				Toggle["1b"] = Instance.new("UICorner", Toggle["1a"])
				Toggle["1b"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ToggleFrame.TextButton.UIStroke
				Toggle["1c"] = Instance.new("UIStroke", Toggle["1a"])
				Toggle["1c"]["Color"] = Color3.fromRGB(60, 60, 60)
				Toggle["1c"]["Thickness"] = 0.699999988079071
				Toggle["1c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.ToggleFrame.ImageButton
				Toggle["1d"] = Instance.new("ImageButton", Toggle["19"])
				Toggle["1d"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16)
				Toggle["1d"]["Image"] = [[rbxassetid://10710517738]]
				Toggle["1d"]["Size"] = UDim2.new(0, 25, 0, 25)
				Toggle["1d"]["Position"] = UDim2.new(0.9225000143051147, 0, 0.06666667014360428, 0)
				Toggle["1d"]["AutoButtonColor"] = false

				-- StarterGui.VisionLib.MainFrame.MainContainer.ToggleFrame.ImageButton.UICorner
				Toggle["1e"] = Instance.new("UICorner", Toggle["1d"])
				Toggle["1e"]["CornerRadius"] = UDim.new(0, 6)
			end
			
			Toggle["1a"].MouseEnter:Connect(function()
				Library:Tween(Toggle["1a"], {
					Length = 0.2,
					Goal = {TextColor3 = Color3.fromRGB(136, 103, 177)}
				})

				Library:Tween(Toggle["1c"], {
					Length = 0.2,
					Goal = {Color = Color3.fromRGB(136, 103, 177)}
				})
			end)

			Toggle["1a"].MouseLeave:Connect(function()
				Library:Tween(Toggle["1a"], {
					Length = 0.2,
					Goal = {TextColor3 = Color3.fromRGB(255, 255, 255)}
				})

				Library:Tween(Toggle["1c"], {
					Length = 0.2,
					Goal = {Color = Color3.fromRGB(59, 59, 59)}
				})
			end)
			
			Toggle["1a"].MouseButton1Click:Connect(function()
				task.spawn(function()
					Library:Tween(Toggle["1a"], {
						Length = 0.1,
						Goal = {BackgroundColor3 = Color3.fromRGB(16, 16, 16)}
					})

					task.wait(0.1)

					Library:Tween(Toggle["1a"], {
						Length = 0.1,
						Goal = {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
					})
				end)
				
				if Toggle.Bool then
					Toggle.Bool = false
					
					Library:Tween(Toggle["1d"], {
						Length = 0.4,
						Goal = {BackgroundColor3 = Color3.fromRGB(15, 15, 15)}
					})
				else
					Toggle.Bool = true
					
					Library:Tween(Toggle["1d"], {
						Length = 0.4,
						Goal = {BackgroundColor3 = Color3.fromRGB(136, 103, 177)}
					})
				end

				options.Callback(Toggle.Bool)
			end)
			
			do
				if Toggle.Bool then
					options.Callback(Toggle.Bool)
				end
				
				if Toggle.Bool then
					Library:Tween(Toggle["1d"], {
						Length = 0.1,
						Goal = {BackgroundColor3 = Color3.fromRGB(136, 103, 177)}
					})
				else
					Library:Tween(Toggle["1d"], {
						Length = 0.1,
						Goal = {BackgroundColor3 = Color3.fromRGB(15, 15, 15)}
					})
				end
			end
			
			function Toggle:SetText(name)
				Toggle["1a"]["Text"] = "  "..name
			end
			
			Library:ResizeCanvas(Tab["b"])
			return Toggle
		end
		
		-- Slider
		function Tab:Slider(options)
			options = Library:Place_Defaults({
				Name = "Slider",
				Min = 0,
				Max = 100,
				Default = 1,
				Callback = function() end
			}, options or {})

			local Slider = {
				Hover = false,
				OldVal = options.Default
			}

			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame
				Slider["23"] = Instance.new("Frame", Tab["b"])
				Slider["23"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Slider["23"]["Size"] = UDim2.new(0, 400, 0, 30)
				Slider["23"]["Name"] = [[SliderFrame]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.UICorner
				Slider["24"] = Instance.new("UICorner", Slider["23"])
				Slider["24"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.UIStroke
				Slider["25"] = Instance.new("UIStroke", Slider["23"])
				Slider["25"]["Color"] = Color3.fromRGB(60, 60, 60)
				Slider["25"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.TextLabel
				Slider["26"] = Instance.new("TextLabel", Slider["23"])
				Slider["26"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Slider["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Slider["26"]["TextSize"] = 14
				Slider["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Slider["26"]["Size"] = UDim2.new(0, 400, 0, 10)
				Slider["26"]["Text"] = "  "..options.Name
				Slider["26"]["Font"] = Enum.Font.Gotham
				Slider["26"]["BackgroundTransparency"] = 1
				Slider["26"]["Position"] = UDim2.new(0, 0, 0.20000000298023224, 0)

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.SliderBackgorund
				Slider["27"] = Instance.new("Frame", Slider["23"])
				Slider["27"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16)
				Slider["27"]["Size"] = UDim2.new(0, 380, 0, 8)
				Slider["27"]["Position"] = UDim2.new(0.02500000037252903, 0, 0.6666666865348816, 0)
				Slider["27"]["Name"] = [[SliderBackgorund]]
				Slider["27"]["ClipsDescendants"] = true

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.SliderBackgorund.UICorner
				Slider["28"] = Instance.new("UICorner", Slider["27"])
				Slider["28"]["CornerRadius"] = UDim.new(1, 8)

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.SliderBackgorund.Slider
				Slider["29"] = Instance.new("Frame", Slider["27"])
				Slider["29"]["ZIndex"] = 4
				Slider["29"]["BackgroundColor3"] = Color3.fromRGB(71, 71, 71)
				Slider["29"]["Size"] = UDim2.new(0, 221, 0, 8)
				Slider["29"]["Name"] = [[Slider]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.SliderBackgorund.Slider.UICorner
				Slider["2a"] = Instance.new("UICorner", Slider["29"])
				Slider["2a"]["CornerRadius"] = UDim.new(1, 8)

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.TextBox
				Slider["2b"] = Instance.new("TextBox", Slider["23"])
				Slider["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Slider["2b"]["TextWrapped"] = true
				Slider["2b"]["TextSize"] = 11
				Slider["2b"]["TextScaled"] = false
				Slider["2b"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16)
				Slider["2b"]["Size"] = UDim2.new(0, 45, 0, 15)
				Slider["2b"]["Text"] = options.Default
				Slider["2b"]["Position"] = UDim2.new(0.8725000023841858, 0, 0.10000000149011612, 0)
				Slider["2b"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.SliderFrame.TextBox.UICorner
				Slider["2c"] = Instance.new("UICorner", Slider["2b"])
				Slider["2c"]["CornerRadius"] = UDim.new(0, 4)
			end
			
			-- Methods
			function Slider:SetValue(Value)
				Value = math.floor(Value)
				
				Library:Tween(Slider["29"], {
					Length = 1,
					Goal = {Size = UDim2.fromScale(((Value - options.Min) / (options.Max - options.Min)), 1)}
				})
				
				Slider["2b"]["Text"] = Value
				Slider.OldVal = Value
				options.Callback(Value)
			end
			
			function Slider:SetText(name)
				Slider["26"]["Name"] = "  "..name
			end
			
			do
				local MouseDown
				
				Slider["27"].MouseEnter:Connect(function()
					Slider.Hover = true
					
					Library:Tween(Slider["29"], {
						Length = 0.5,
						Goal = {BackgroundColor3 = Color3.new(0.403922, 0.403922, 0.403922)}
					})
				end)
				
				Slider["27"].MouseLeave:Connect(function()
					Slider.Hover = false
					
					Library:Tween(Slider["29"], {
						Length = 0.5,
						Goal = {BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)}
					})
				end)
				
				Slider["2b"].Focused:Connect(function()
					Slider["2b"].Text = ""
				end)
				
				Slider["2b"].FocusLost:Connect(function()
					local success = pcall(function()
						local NumVal = tonumber(Slider["2b"].Text)
						if NumVal <= options.Max and NumVal >= options.Min then
							Slider.OldVal = NumVal
							Slider:SetValue(NumVal)
						else
							Slider["2b"].Text = Slider.OldVal
						end
					end)
					
					if not success then
						Slider["2b"].Text = Slider.OldVal
					end
				end)
				
				UserInputService.InputBegan:connect(function(key)
					if key.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Library.Sliding = true
						MouseDown = true
						
						Library:Tween(Slider["29"], {
							Length = 0.5,
							Goal = {BackgroundColor3 = Color3.new(0.780392, 0.780392, 0.780392)}
						})
					
						while MouseDown do
							local percentage = math.clamp((Mouse.X - Slider["27"].AbsolutePosition.X) / (Slider["27"].AbsoluteSize.X), 0, 1)
							local value = ((options.Max - options.Min) * percentage) + options.Min
							value = math.floor(value)
							Slider.OldVal = value
							Slider["2b"].Text = value
							options.Callback(value)
							Library:Tween(Slider["29"], {
								Length = 0.06,
								Goal = {Size = UDim2.fromScale(percentage, 1)}
							})
							task.wait()
						end
						Library.Sliding = false
						
						if Slider.Hover then
							Library:Tween(Slider["29"], {
								Length = 0.5,
								Goal = {BackgroundColor3 = Color3.new(0.403922, 0.403922, 0.403922)}
							})
						end
					end
				end)
				
				UserInputService.InputEnded:connect(function(key)
					if key.UserInputType == Enum.UserInputType.MouseButton1 then
						MouseDown = false
					end
				end)
				
				RunService:BindToRenderStep("visionslider_"..options.Name, Enum.RenderPriority.Input.Value, function()
					
				end)
			end
			
			Slider:SetValue(options.Default)
			
			Library:ResizeCanvas(Tab["b"])
			return Slider
		end
		
		-- Dropdown
		function Tab:Dropdown(options)
			options = Library:Place_Defaults({
				Name = "Dropdown",
				Items = {},
				Callback = function(item) return end
			}, options or {})

			local Dropdown = {
				Items = options.Items,
				SelectedItem = "nil",
				ContainerOpened = false,
				NameText = options.Name
			}
			
			function Dropdown:Toggle()
				if Dropdown.ContainerOpened then
					Library:Tween(Dropdown["2d"], {
						Length = 0.2,
						Goal = {Size = UDim2.fromOffset(400, 30)}
					})
					
					Library:Tween(Dropdown["42"], {
						Length = 0.2,
						Goal = {Transparency = 1}
					})
					
					Dropdown.ContainerOpened = false
				else
					Dropdown:ResizeOpenedFrame()
					
					Library:Tween(Dropdown["42"], {
						Length = 0.2,
						Goal = {Transparency = 0}
					})
					
					Dropdown.ContainerOpened = true
				end
				
				task.spawn(function()
					task.wait(0.2)
					Library:ResizeCanvas(Tab["b"])
				end)
			end
			
			function Dropdown:ResizeOpenedFrame()
				local NumChild = 0
				
				for i, v in pairs(Dropdown["32"]:GetChildren()) do
					if v:IsA("TextButton") then
						NumChild += 1
					end
				end
				
				local FrameYOffset = 20 * NumChild + 3 * NumChild + 30 + 5
				
				Library:Tween(Dropdown["2d"], {
					Length = 0.2,
					Goal = {Size = UDim2.fromOffset(400, FrameYOffset)}
				})
			end
			
			function Dropdown:ResizeContainer()
				local NumChild = 0

				for i, v in pairs(Dropdown["32"]:GetChildren()) do
					if v:IsA("TextButton") then
						NumChild += 1
					end
				end

				local FrameYOffset = 20 * NumChild + 3 * NumChild

				Library:Tween(Dropdown["32"], {
					Length = 0.1,
					Goal = {Size = UDim2.fromOffset(400, FrameYOffset)}
				})
			end

			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame
				Dropdown["2d"] = Instance.new("Frame", Tab["b"])
				Dropdown["2d"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Dropdown["2d"]["Size"] = UDim2.new(0, 400, 0, 30)
				Dropdown["2d"]["Position"] = UDim2.new(0.03596287593245506, 0, 0.125, 0)
				Dropdown["2d"]["Name"] = [[DropdownFrame]]
				Dropdown["2d"]["ClipsDescendants"] = true

				-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.TextLabel
				Dropdown["2e"] = Instance.new("TextLabel", Dropdown["2d"])
				Dropdown["2e"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Dropdown["2e"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Dropdown["2e"]["TextSize"] = 14
				Dropdown["2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Dropdown["2e"]["Size"] = UDim2.new(0, 400, 0, 30)
				Dropdown["2e"]["Text"] = "  "..options.Name.." > nil"
				Dropdown["2e"]["Font"] = Enum.Font.Gotham
				Dropdown["2e"]["BackgroundTransparency"] = 1

				-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.ImageButton
				Dropdown["2f"] = Instance.new("ImageButton", Dropdown["2d"])
				Dropdown["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Dropdown["2f"]["Image"] = [[rbxassetid://11280363344]]
				Dropdown["2f"]["Size"] = UDim2.new(0, 17, 0, 17)
				Dropdown["2f"]["Position"] = UDim2.new(0.9325000047683716, 0, 0, 6)
				Dropdown["2f"]["BackgroundTransparency"] = 1

				-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.UICorner
				Dropdown["30"] = Instance.new("UICorner", Dropdown["2d"])
				Dropdown["30"]["CornerRadius"] = UDim.new(0, 4)

				-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.UIStroke
				Dropdown["31"] = Instance.new("UIStroke", Dropdown["2d"])
				Dropdown["31"]["Color"] = Color3.fromRGB(60, 60, 60)
				Dropdown["31"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.Container
				Dropdown["32"] = Instance.new("Frame", Dropdown["2d"])
				Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Dropdown["32"]["BackgroundTransparency"] = 1
				Dropdown["32"]["Size"] = UDim2.new(0, 400, 0, 161)
				Dropdown["32"]["Position"] = UDim2.new(0, 0, 0, 32)
				Dropdown["32"]["Name"] = [[Container]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.Container.UIListLayout
				Dropdown["33"] = Instance.new("UIListLayout", Dropdown["32"])
				Dropdown["33"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
				Dropdown["33"]["Padding"] = UDim.new(0, 3)
				Dropdown["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder

				-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.Seperator
				Dropdown["42"] = Instance.new("Frame", Dropdown["2d"])
				Dropdown["42"]["BorderSizePixel"] = 0
				Dropdown["42"]["BackgroundColor3"] = Color3.fromRGB(45, 45, 45)
				Dropdown["42"]["BackgroundTransparency"] = 0.009999999776482582
				Dropdown["42"]["Size"] = UDim2.new(0, 400, 0, 2)
				Dropdown["42"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
				Dropdown["42"]["Position"] = UDim2.new(-0.00017981277778744698, 0, 0, 27)
				Dropdown["42"]["Name"] = [[Seperator]]
				Dropdown["42"]["Transparency"] = 1
			end
			
			-- Create button
			do
				function Dropdown:CreateButton(Value)
					local DropdownButton = {
						ItemValue = Value
					}
					
					-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.Container.TextButton
					DropdownButton["34"] = Instance.new("TextButton", Dropdown["32"])
					DropdownButton["34"]["TextSize"] = 14
					DropdownButton["34"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
					DropdownButton["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					DropdownButton["34"]["Text"] = tostring(Value)
					DropdownButton["34"]["Size"] = UDim2.new(0, 380, 0, 20)
					DropdownButton["34"]["Font"] = Enum.Font.Gotham
					DropdownButton["34"]["AutoButtonColor"] = false

					-- StarterGui.VisionLib.MainFrame.MainContainer.DropdownFrame.Container.TextButton.UICorner
					DropdownButton["35"] = Instance.new("UICorner", DropdownButton["34"])
					DropdownButton["35"]["CornerRadius"] = UDim.new(0, 3)
					
					DropdownButton["34"].MouseEnter:Connect(function()
						Library:Tween(DropdownButton["34"], {
							Length = 0.1,
							Goal = {BackgroundColor3 = Color3.fromRGB(27, 27, 27)}
						})
					end)
					
					DropdownButton["34"].MouseLeave:Connect(function()
						Library:Tween(DropdownButton["34"], {
							Length = 0.1,
							Goal = {BackgroundColor3 = Color3.fromRGB(36, 36, 36)}
						})
					end)
					
					DropdownButton["34"].MouseButton1Click:Connect(function()
						Library:Tween(DropdownButton["34"], {
							Length = 0.1,
							Goal = {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}
						})
						
						pcall(function()
							options.Callback(DropdownButton.ItemValue)
						end)
						
						Dropdown.SelectedItem = tostring(DropdownButton.ItemValue)
						Dropdown["2e"]["Text"] = "  "..Dropdown.NameText.." > "..tostring(Dropdown.SelectedItem)
						
						task.wait(0.1)
						Library:Tween(DropdownButton["34"], {
							Length = 0.1,
							Goal = {BackgroundColor3 = Color3.fromRGB(36, 36, 36)}
						})
					end)
				end
			end
			
			-- Methods
			do
				function Dropdown:UpdateList(options)
					options = Library:Place_Defaults({
						Items = {},
						Replace = true
					}, options or {})
					
					if options.Replace then
						for i, v in pairs(Dropdown["32"]:GetChildren()) do
							if v:IsA("TextButton") then
								v:Destroy()
							end
						end
					end
					
					for i, v in pairs(options.Items) do
						Dropdown:CreateButton(v)
					end
					
					if Dropdown.ContainerOpened then
						Dropdown:ResizeOpenedFrame()
					end
					Dropdown:ResizeContainer()
				end
				
				function Dropdown:ClearList()
					for i, v in pairs(Dropdown["32"]:GetChildren()) do
						if v:IsA("TextButton") then
							v:Destroy()
						end
					end

					if Dropdown.ContainerOpened then
						Dropdown:ResizeOpenedFrame()
					end
					Dropdown:ResizeContainer()
				end
				
				function Dropdown:AddItem(Item)
					Dropdown:CreateButton(Item)

					if Dropdown.ContainerOpened then
						Dropdown:ResizeOpenedFrame()
					end
					Dropdown:ResizeContainer()
				end
				
				function Dropdown:SetText(Text)
					Dropdown["2e"]["Text"] = "  "..Text.." > "..tostring(Dropdown.SelectedItem)
					Dropdown.NameText = Text
				end
			end
			
			-- Handler 
			do
				Dropdown["2f"].MouseEnter:Connect(function()
					Library:Tween(Dropdown["2f"], {
						Length = 0.2,
						Goal = {ImageColor3 = Color3.fromRGB(136, 103, 177)}
					})
				end)
				
				Dropdown["2f"].MouseLeave:Connect(function()
					Library:Tween(Dropdown["2f"], {
						Length = 0.2,
						Goal = {ImageColor3 = Color3.fromRGB(255, 255, 255)}
					})
				end)
				
				Dropdown["2f"].MouseButton1Click:Connect(function()
					Dropdown:Toggle()
				end)
			end
			
			Dropdown:UpdateList({
				Items = options.Items,
				Replace = true
			})
			
			Library:ResizeCanvas(Tab["b"])
			return Dropdown
		end
		
		-- Colorpicker
		function Tab:Colorpicker(options)
			options = Library:Place_Defaults({
				Name = "Colorpicker",
				DefaultColor = Color3.new(1, 1, 1),
				Callback = function() return end
			}, options or {})

			local Colorpicker = {
				HueHover = false,
				SatHover = false,
				LightHover = false,
				HueVal = 0,
				SatVal = 0,
				LightVal = 0,
				ColorVal = options.DefaultColor
			}
			
			local dh, ds ,dv = options.DefaultColor:ToHSV()
			
			Colorpicker.HueVal = dh
			Colorpicker.SatVal = ds
			Colorpicker.LightVal = dv

			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame
				Colorpicker["6e"] = Instance.new("Frame", Tab["b"])
				Colorpicker["6e"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Colorpicker["6e"]["Size"] = UDim2.new(0, 400, 0, 161)
				Colorpicker["6e"]["Position"] = UDim2.new(0.003480277955532074, 0, 0.6021980047225952, 0)
				Colorpicker["6e"]["Name"] = [[ColorPickerFrame]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.UICorner
				Colorpicker["6f"] = Instance.new("UICorner", Colorpicker["6e"])
				Colorpicker["6f"]["CornerRadius"] = UDim.new(0, 4)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.UIStroke
				Colorpicker["70"] = Instance.new("UIStroke", Colorpicker["6e"])
				Colorpicker["70"]["Color"] = Color3.fromRGB(60, 60, 60)
				Colorpicker["70"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker
				Colorpicker["71"] = Instance.new("Frame", Colorpicker["6e"])
				Colorpicker["71"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["71"]["BackgroundTransparency"] = 1
				Colorpicker["71"]["Size"] = UDim2.new(0, 400, 0, 86)
				Colorpicker["71"]["Position"] = UDim2.new(0, 0, 0.23499999940395355, 0)
				Colorpicker["71"]["Name"] = [[ColorPicker]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Hue
				Colorpicker["72"] = Instance.new("ImageLabel", Colorpicker["71"])
				Colorpicker["72"]["ScaleType"] = Enum.ScaleType.Crop
				Colorpicker["72"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["72"]["Image"] = [[rbxassetid://11362678635]]
				Colorpicker["72"]["Size"] = UDim2.new(0, 380, 0, 25)
				Colorpicker["72"]["Position"] = UDim2.new(0.030000001192092896, 0, 0.04329953342676163, 0)
				Colorpicker["72"]["LayoutOrder"] = 0
				Colorpicker["72"]["Name"] = [[Hue]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Hue.UICorner
				Colorpicker["73"] = Instance.new("UICorner", Colorpicker["72"])
				Colorpicker["73"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Hue.Frame
				Colorpicker["74"] = Instance.new("Frame", Colorpicker["72"])
				Colorpicker["74"]["BackgroundColor3"] = Color3.fromRGB(255, 48, 48)
				Colorpicker["74"]["Size"] = UDim2.new(0, 5, 0, 25)
				Colorpicker["74"]["Position"] = UDim2.new(0.2631579041481018, 0, 0, 0)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Hue.Frame.UICorner
				Colorpicker["75"] = Instance.new("UICorner", Colorpicker["74"])
				Colorpicker["75"]["CornerRadius"] = UDim.new(0, 3)
				
				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Hue.Frame.UIStroke
				Colorpicker["1c"] = Instance.new("UIStroke", Colorpicker["74"])
				Colorpicker["1c"]["Color"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["1c"]["Thickness"] = 1
				Colorpicker["1c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Saturation
				Colorpicker["76"] = Instance.new("Frame", Colorpicker["71"])
				Colorpicker["76"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["76"]["Size"] = UDim2.new(0, 380, 0, 25)
				Colorpicker["76"]["Position"] = UDim2.new(0.02500000037252903, 0, 0.3109756112098694, 0)
				Colorpicker["76"]["Name"] = [[Saturation]]
				Colorpicker["76"]["LayoutOrder"] = 1

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Saturation.UICorner
				Colorpicker["77"] = Instance.new("UICorner", Colorpicker["76"])
				Colorpicker["77"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Saturation.UIGradient
				Colorpicker["78"] = Instance.new("UIGradient", Colorpicker["76"])
				Colorpicker["78"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 0, 0))}

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Saturation.Frame
				Colorpicker["79"] = Instance.new("Frame", Colorpicker["76"])
				Colorpicker["79"]["BackgroundColor3"] = Color3.fromRGB(181, 181, 181)
				Colorpicker["79"]["Size"] = UDim2.new(0, 5, 0, 25)
				Colorpicker["79"]["Position"] = UDim2.new(0.17368420958518982, 0, 0, 0)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Saturation.Frame.UICorner
				Colorpicker["7a"] = Instance.new("UICorner", Colorpicker["79"])
				Colorpicker["7a"]["CornerRadius"] = UDim.new(0, 3)
				
				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Saturation.Frame.UIStroke
				Colorpicker["1d"] = Instance.new("UIStroke", Colorpicker["79"])
				Colorpicker["1d"]["Color"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["1d"]["Thickness"] = 1
				Colorpicker["1d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Brightness
				Colorpicker["7b"] = Instance.new("Frame", Colorpicker["71"])
				Colorpicker["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["7b"]["Size"] = UDim2.new(0, 380, 0, 25)
				Colorpicker["7b"]["Position"] = UDim2.new(0.02500000037252903, 0, 0.3109756112098694, 0)
				Colorpicker["7b"]["Name"] = [[Brightness]]
				Colorpicker["7b"]["LayoutOrder"] = 2

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Brightness.UICorner
				Colorpicker["7c"] = Instance.new("UICorner", Colorpicker["7b"])
				Colorpicker["7c"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Brightness.UIGradient
				Colorpicker["7d"] = Instance.new("UIGradient", Colorpicker["7b"])
				Colorpicker["7d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 0, 0))}

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Brightness.Frame
				Colorpicker["7e"] = Instance.new("Frame", Colorpicker["7b"])
				Colorpicker["7e"]["BackgroundColor3"] = Color3.fromRGB(181, 181, 181)
				Colorpicker["7e"]["Size"] = UDim2.new(0, 5, 0, 25)
				Colorpicker["7e"]["Position"] = UDim2.new(0.15526315569877625, 0, 0, 0)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Brightness.Frame.UICorner
				Colorpicker["7f"] = Instance.new("UICorner", Colorpicker["7e"])
				Colorpicker["7f"]["CornerRadius"] = UDim.new(0, 3)
				
				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.Brightness.Frame.UIStroke
				Colorpicker["1e"] = Instance.new("UIStroke", Colorpicker["7e"])
				Colorpicker["1e"]["Color"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["1e"]["Thickness"] = 1
				Colorpicker["1e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.UIListLayout
				Colorpicker["80"] = Instance.new("UIListLayout", Colorpicker["71"])
				Colorpicker["80"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
				Colorpicker["80"]["Padding"] = UDim.new(0, 5)
				Colorpicker["80"]["SortOrder"] = Enum.SortOrder.LayoutOrder

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorPicker.UIPadding
				Colorpicker["81"] = Instance.new("UIPadding", Colorpicker["71"])


				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.TextLabel
				Colorpicker["82"] = Instance.new("TextLabel", Colorpicker["6e"])
				Colorpicker["82"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Colorpicker["82"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Colorpicker["82"]["TextSize"] = 14
				Colorpicker["82"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["82"]["Size"] = UDim2.new(0, 400, 0, 30)
				Colorpicker["82"]["Text"] = "  "..options.Name
				Colorpicker["82"]["Font"] = Enum.Font.Gotham
				Colorpicker["82"]["BackgroundTransparency"] = 1

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.Seperator
				Colorpicker["83"] = Instance.new("Frame", Colorpicker["6e"])
				Colorpicker["83"]["BorderSizePixel"] = 0
				Colorpicker["83"]["BackgroundColor3"] = Color3.fromRGB(45, 45, 45)
				Colorpicker["83"]["BackgroundTransparency"] = 0.009999999776482582
				Colorpicker["83"]["Size"] = UDim2.new(0, 400, 0, 2)
				Colorpicker["83"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
				Colorpicker["83"]["Position"] = UDim2.new(-0.00017981277778744698, 0, 0.18113110959529877, 0)
				Colorpicker["83"]["Name"] = [[Seperator]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorDisplay
				Colorpicker["84"] = Instance.new("Frame", Colorpicker["6e"])
				Colorpicker["84"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["84"]["Size"] = UDim2.new(0, 22, 0, 22)
				Colorpicker["84"]["Position"] = UDim2.new(0.9325000047683716, 0, 0.019999999552965164, 0)
				Colorpicker["84"]["Name"] = [[ColorDisplay]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.ColorDisplay.UICorner
				Colorpicker["85"] = Instance.new("UICorner", Colorpicker["84"])
				Colorpicker["85"]["CornerRadius"] = UDim.new(0, 4)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder
				Colorpicker["86"] = Instance.new("Frame", Colorpicker["6e"])
				Colorpicker["86"]["BorderSizePixel"] = 0
				Colorpicker["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["86"]["BackgroundTransparency"] = 1
				Colorpicker["86"]["Size"] = UDim2.new(0, 400, 0, 36)
				Colorpicker["86"]["Position"] = UDim2.new(0, 0, 0.76295006275177, 0)
				Colorpicker["86"]["Name"] = [[RGBHolder]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Hue
				Colorpicker["87"] = Instance.new("Frame", Colorpicker["86"])
				Colorpicker["87"]["BorderSizePixel"] = 0
				Colorpicker["87"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["87"]["BackgroundTransparency"] = 1
				Colorpicker["87"]["Size"] = UDim2.new(0, 91, 0, 37)
				Colorpicker["87"]["Name"] = [[Hue]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Hue.TextLabel
				Colorpicker["88"] = Instance.new("TextLabel", Colorpicker["87"])
				Colorpicker["88"]["TextWrapped"] = true
				Colorpicker["88"]["BorderSizePixel"] = 0
				Colorpicker["88"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["88"]["TextSize"] = 11
				Colorpicker["88"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["88"]["Size"] = UDim2.new(0, 45, 0, 25)
				Colorpicker["88"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
				Colorpicker["88"]["Text"] = [[Hue]]
				Colorpicker["88"]["Font"] = Enum.Font.Gotham
				Colorpicker["88"]["BackgroundTransparency"] = 1
				Colorpicker["88"]["Position"] = UDim2.new(-0.0012891516089439392, 0, 0.13513514399528503, 0)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Hue.TextBox
				Colorpicker["89"] = Instance.new("TextBox", Colorpicker["87"])
				Colorpicker["89"]["CursorPosition"] = -1
				Colorpicker["89"]["ZIndex"] = 5
				Colorpicker["89"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["89"]["TextWrapped"] = true
				Colorpicker["89"]["TextSize"] = 11
				Colorpicker["89"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16)
				Colorpicker["89"]["Size"] = UDim2.new(0, 42, 0, 18)
				Colorpicker["89"]["Text"] = [[256]]
				Colorpicker["89"]["Position"] = UDim2.new(0.4914590120315552, 0, 0.25, 0)
				Colorpicker["89"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Hue.TextBox.UICorner
				Colorpicker["8a"] = Instance.new("UICorner", Colorpicker["89"])
				Colorpicker["8a"]["CornerRadius"] = UDim.new(0, 4)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.UIListLayout
				Colorpicker["8b"] = Instance.new("UIListLayout", Colorpicker["86"])
				Colorpicker["8b"]["FillDirection"] = Enum.FillDirection.Horizontal
				Colorpicker["8b"]["SortOrder"] = Enum.SortOrder.LayoutOrder

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Value
				Colorpicker["8c"] = Instance.new("Frame", Colorpicker["86"])
				Colorpicker["8c"]["BorderSizePixel"] = 0
				Colorpicker["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["8c"]["BackgroundTransparency"] = 1
				Colorpicker["8c"]["Size"] = UDim2.new(0, 91, 0, 37)
				Colorpicker["8c"]["Name"] = [[Value]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Value.TextLabel
				Colorpicker["8d"] = Instance.new("TextLabel", Colorpicker["8c"])
				Colorpicker["8d"]["TextWrapped"] = true
				Colorpicker["8d"]["BorderSizePixel"] = 0
				Colorpicker["8d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["8d"]["TextSize"] = 11
				Colorpicker["8d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["8d"]["Size"] = UDim2.new(0, 45, 0, 25)
				Colorpicker["8d"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
				Colorpicker["8d"]["Text"] = [[Value]]
				Colorpicker["8d"]["Font"] = Enum.Font.Gotham
				Colorpicker["8d"]["BackgroundTransparency"] = 1
				Colorpicker["8d"]["Position"] = UDim2.new(-0.0012891516089439392, 0, 0.13513514399528503, 0)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Value.TextBox
				Colorpicker["8e"] = Instance.new("TextBox", Colorpicker["8c"])
				Colorpicker["8e"]["ZIndex"] = 5
				Colorpicker["8e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["8e"]["TextWrapped"] = true
				Colorpicker["8e"]["TextSize"] = 11
				Colorpicker["8e"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16)
				Colorpicker["8e"]["Size"] = UDim2.new(0, 42, 0, 18)
				Colorpicker["8e"]["Text"] = [[256]]
				Colorpicker["8e"]["Position"] = UDim2.new(0.4914590120315552, 0, 0.25, 0)
				Colorpicker["8e"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Value.TextBox.UICorner
				Colorpicker["8f"] = Instance.new("UICorner", Colorpicker["8e"])
				Colorpicker["8f"]["CornerRadius"] = UDim.new(0, 4)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Sat
				Colorpicker["90"] = Instance.new("Frame", Colorpicker["86"])
				Colorpicker["90"]["BorderSizePixel"] = 0
				Colorpicker["90"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["90"]["BackgroundTransparency"] = 1
				Colorpicker["90"]["Size"] = UDim2.new(0, 91, 0, 37)
				Colorpicker["90"]["Name"] = [[Sat]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Sat.TextLabel
				Colorpicker["91"] = Instance.new("TextLabel", Colorpicker["90"])
				Colorpicker["91"]["TextWrapped"] = true
				Colorpicker["91"]["BorderSizePixel"] = 0
				Colorpicker["91"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["91"]["TextSize"] = 11
				Colorpicker["91"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["91"]["Size"] = UDim2.new(0, 45, 0, 25)
				Colorpicker["91"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
				Colorpicker["91"]["Text"] = [[Sat]]
				Colorpicker["91"]["Font"] = Enum.Font.Gotham
				Colorpicker["91"]["BackgroundTransparency"] = 1
				Colorpicker["91"]["Position"] = UDim2.new(-0.0012891516089439392, 0, 0.13513514399528503, 0)

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Sat.TextBox
				Colorpicker["92"] = Instance.new("TextBox", Colorpicker["90"])
				Colorpicker["92"]["ZIndex"] = 5
				Colorpicker["92"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Colorpicker["92"]["TextWrapped"] = true
				Colorpicker["92"]["TextSize"] = 11
				Colorpicker["92"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16)
				Colorpicker["92"]["Size"] = UDim2.new(0, 42, 0, 18)
				Colorpicker["92"]["Text"] = [[256]]
				Colorpicker["92"]["Position"] = UDim2.new(0.4914590120315552, 0, 0.25, 0)
				Colorpicker["92"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.ColorPickerFrame.RGBHolder.Sat.TextBox.UICorner
				Colorpicker["93"] = Instance.new("UICorner", Colorpicker["92"])
				Colorpicker["93"]["CornerRadius"] = UDim.new(0, 4)
			end
			
			do
				-- Hue
				Colorpicker["72"].MouseEnter:Connect(function()
					Colorpicker.HueHover = true
				end)
				
				-- Sat
				Colorpicker["76"].MouseEnter:Connect(function()
					Colorpicker.SatHover = true
				end)
				
				-- Light
				Colorpicker["7b"].MouseEnter:Connect(function()
					Colorpicker.LightHover = true
				end)
				
				Colorpicker["72"].MouseLeave:Connect(function()
					Colorpicker.HueHover = false
				end)

				Colorpicker["76"].MouseLeave:Connect(function()
					Colorpicker.SatHover = false
				end)

				Colorpicker["7b"].MouseLeave:Connect(function()
					Colorpicker.LightHover = false
				end)
			end
			
			-- Methods
			do
				local function updateTextboxVal()
					Colorpicker["89"]["Text"] = math.floor(Colorpicker.HueVal*256)
					Colorpicker["92"]["Text"] = math.floor(Colorpicker.SatVal*256)
					Colorpicker["8e"]["Text"] = math.floor(Colorpicker.LightVal*256)
				end
				
				local MouseDown
				
				UserInputService.InputBegan:connect(function(key)
					if key.UserInputType == Enum.UserInputType.MouseButton1 and Colorpicker.HueHover then
						Library.Sliding = true
						MouseDown = true

						while RunService.RenderStepped:wait() and MouseDown do
							local percentage = math.clamp((Mouse.X - Colorpicker["72"].AbsolutePosition.X) / (Colorpicker["72"].AbsoluteSize.X), 0, 1)
							local value = ((255 - 0) * percentage) + 0
							
							value = math.floor(value)
							Colorpicker.HueVal = percentage
							local huecolor = Color3.fromHSV(Colorpicker.HueVal, 1, 1)
							local satcolor = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, 1)
							local lightcolor = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)
							
							Library:Tween(Colorpicker["74"], {
								Length = 0.06,
								Goal = {Position = UDim2.new((percentage-0.007), 0, 0, 0)}
							})
							
							Library:Tween(Colorpicker["74"], {
								Length = 0.06,
								Goal = {BackgroundColor3 = huecolor}
							})
							
							Library:Tween(Colorpicker["79"], {
								Length = 0.06,
								Goal = {BackgroundColor3 = satcolor}
							})
							
							Library:Tween(Colorpicker["7e"], {
								Length = 0.06,
								Goal = {BackgroundColor3 = lightcolor}
							})
							
							Colorpicker["78"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, huecolor)}
							Colorpicker["7d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(1.000, satcolor)}
							
							Colorpicker.ColorVal = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)
							Colorpicker["84"]["BackgroundColor3"] = Colorpicker.ColorVal
							options.Callback(Colorpicker.ColorVal)
							updateTextboxVal()
						end
					elseif key.UserInputType == Enum.UserInputType.MouseButton1 and Colorpicker.SatHover then
						Library.Sliding = true
						MouseDown = true

						while RunService.RenderStepped:wait() and MouseDown do
							local percentage = math.clamp((Mouse.X - Colorpicker["76"].AbsolutePosition.X) / (Colorpicker["76"].AbsoluteSize.X), 0, 1)
							local value = ((255 - 0) * percentage) + 0

							value = math.floor(value)
							Colorpicker.SatVal = percentage
							local satcolor = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, 1)
							local lightcolor = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)
							

							Library:Tween(Colorpicker["79"], {
								Length = 0.06,
								Goal = {Position = UDim2.new((percentage-0.007), 0, 0, 0)}
							})

							Library:Tween(Colorpicker["79"], {
								Length = 0.06,
								Goal = {BackgroundColor3 = satcolor}
							})
							
							Library:Tween(Colorpicker["7e"], {
								Length = 0.06,
								Goal = {BackgroundColor3 = lightcolor}
							})
							
							Colorpicker["7d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(1.000, satcolor)}
							
							Colorpicker.ColorVal = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)
							Colorpicker["84"]["BackgroundColor3"] = Colorpicker.ColorVal
							options.Callback(Colorpicker.ColorVal)
							updateTextboxVal()
						end
					elseif key.UserInputType == Enum.UserInputType.MouseButton1 and Colorpicker.LightHover then
						Library.Sliding = true
						MouseDown = true

						while RunService.RenderStepped:wait() and MouseDown do
							local percentage = math.clamp((Mouse.X - Colorpicker["76"].AbsolutePosition.X) / (Colorpicker["76"].AbsoluteSize.X), 0, 1)
							local value = ((255 - 0) * percentage) + 0

							value = math.floor(value)
							Colorpicker.LightVal = percentage
							local lightcolor = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)


							Library:Tween(Colorpicker["7e"], {
								Length = 0.06,
								Goal = {Position = UDim2.new((percentage-0.007), 0, 0, 0)}
							})

							Library:Tween(Colorpicker["7e"], {
								Length = 0.06,
								Goal = {BackgroundColor3 = lightcolor}
							})
							
							Colorpicker.ColorVal = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)
							Colorpicker["84"]["BackgroundColor3"] = Colorpicker.ColorVal
							options.Callback(Colorpicker.ColorVal)
							updateTextboxVal()
						end
					end
					Library.Sliding = false
					
					Colorpicker.ColorVal = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)
					Colorpicker["84"]["BackgroundColor3"] = Colorpicker.ColorVal
					options.Callback(Colorpicker.ColorVal)
					updateTextboxVal()
				end)

				UserInputService.InputEnded:connect(function(key)
					if key.UserInputType == Enum.UserInputType.MouseButton1 then
						MouseDown = false
					end
				end)
				
				function Colorpicker:SetText(Text)
					Colorpicker["82"]["Text"] = "  "..Text
				end
				
				function Colorpicker:SetColor(Color)
					local NewH, NewS ,NewV = Color:ToHSV()

					Colorpicker.HueVal = NewH
					Colorpicker.SatVal = NewS
					Colorpicker.LightVal = NewV
					
					do
						local huecolor = Color3.fromHSV(Colorpicker.HueVal, 1, 1)

						Library:Tween(Colorpicker["74"], {
							Length = 1,
							Goal = {Position = UDim2.new((Colorpicker.HueVal-0.007), 0, 0, 0)}
						})

						Library:Tween(Colorpicker["74"], {
							Length = 1,
							Goal = {BackgroundColor3 = huecolor}
						})

						Colorpicker["78"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, huecolor)}
					end
					
					do
						local satcolor = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, 1)


						Library:Tween(Colorpicker["79"], {
							Length = 1,
							Goal = {Position = UDim2.new((Colorpicker.SatVal-0.007), 0, 0, 0)}
						})

						Library:Tween(Colorpicker["79"], {
							Length = 1,
							Goal = {BackgroundColor3 = satcolor}
						})

						Colorpicker["7d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(1.000, satcolor)}
					end
					
					do
						local lightcolor = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)


						Library:Tween(Colorpicker["7e"], {
							Length = 1,
							Goal = {Position = UDim2.new((Colorpicker.LightVal-0.007), 0, 0, 0)}
						})

						Library:Tween(Colorpicker["7e"], {
							Length = 1,
							Goal = {BackgroundColor3 = lightcolor}
						})
					end
					
					Colorpicker.ColorVal = Color3.fromHSV(Colorpicker.HueVal, Colorpicker.SatVal, Colorpicker.LightVal)
					Colorpicker["84"]["BackgroundColor3"] = Colorpicker.ColorVal
					updateTextboxVal()
				end
				
				Colorpicker:SetColor(options.DefaultColor)
			end
			
			Library:ResizeCanvas(Tab["b"])
			return Colorpicker
		end
		
		-- Keybind
		function Tab:Keybind(options)
			options = Library:Place_Defaults({
				Name = "Keybind",
				Default = Enum.KeyCode.Return,
				Callback = function() return end,
				UpdateKeyCallback = function() return end
			}, options or {})

			local Keybind = {
				Focused = false,
				Keybind = options.Default
			}

			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.KeybindFrame
				Keybind["93"] = Instance.new("Frame", Tab["b"])
				Keybind["93"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Keybind["93"]["BackgroundTransparency"] = 1
				Keybind["93"]["Size"] = UDim2.new(0, 400, 0, 30)
				Keybind["93"]["Name"] = [[KeybindFrame]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.KeybindFrame.TextLabel
				Keybind["94"] = Instance.new("TextLabel", Keybind["93"])
				Keybind["94"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Keybind["94"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Keybind["94"]["TextSize"] = 14
				Keybind["94"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Keybind["94"]["Size"] = UDim2.new(0, 400, 0, 30)
				Keybind["94"]["Text"] = "  "..options.Name
				Keybind["94"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.KeybindFrame.TextLabel.UICorner
				Keybind["95"] = Instance.new("UICorner", Keybind["94"])
				Keybind["95"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.KeybindFrame.TextLabel.UIStroke
				Keybind["96"] = Instance.new("UIStroke", Keybind["94"])
				Keybind["96"]["Color"] = Color3.fromRGB(60, 60, 60)
				Keybind["96"]["Thickness"] = 0.699999988079071
				Keybind["96"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.KeybindFrame.TextButton
				Keybind["97"] = Instance.new("TextButton", Keybind["93"])
				Keybind["97"]["AutoLocalize"] = false
				Keybind["97"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Keybind["97"]["TextWrapped"] = true
				Keybind["97"]["TextSize"] = 11
				Keybind["97"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16)
				Keybind["97"]["Size"] = UDim2.new(0, 85, 0, 20)
				Keybind["97"]["Position"] = UDim2.new(0, 310, 0, 5)
				Keybind["97"]["Font"] = Enum.Font.Gotham
				Keybind["97"]["AutoButtonColor"] = false
				
				local keybindText = string.gsub(tostring(Keybind.Keybind), "Enum.KeyCode.", "")

				Keybind["97"]["Text"] = keybindText

				-- StarterGui.VisionLib.MainFrame.MainContainer.KeybindFrame.TextButton.UICorner
				Keybind["98"] = Instance.new("UICorner", Keybind["97"])
				Keybind["98"]["CornerRadius"] = UDim.new(0, 4)
			end
			
			-- Methods
			do
				Keybind["97"].MouseEnter:Connect(function()
					Library:Tween(Keybind["97"], {
						Length = 0.2,
						Goal = {BackgroundColor3 = Color3.fromRGB(56, 56, 56)}
					})
				end)

				Keybind["97"].MouseLeave:Connect(function()
					Library:Tween(Keybind["97"], {
						Length = 0.2,
						Goal = {BackgroundColor3 = Color3.fromRGB(16, 16, 16)}
					})
				end)
				
				Keybind["97"].MouseButton1Click:Connect(function()
					Keybind.Focused = true
					
					Keybind["97"]["Text"] = "..."
				end)

				UserInputService.InputBegan:Connect(function(input, GameProcess)
					if input.UserInputType == Enum.UserInputType.Keyboard then
						if input.KeyCode == Keybind.Keybind then
							pcall(function()
								options.Callback()
							end)
						end
						
						if Keybind.Focused then
							Keybind.Keybind = input.KeyCode
							local keybindText = string.gsub(tostring(Keybind.Keybind), "Enum.KeyCode.", "")
							Keybind["97"]["Text"] = keybindText
							pcall(function()
								options.UpdateKeyCallback(input.KeyCode)
							end)
							
							Keybind.Focused = false
						end
					end
				end)
				
				function Keybind:SetText(name)
					Keybind["94"]["Text"] = "  "..name
				end
			end

			Library:ResizeCanvas(Tab["b"])
			return Keybind
		end
		
		-- Keybind
		function Tab:Textbox(options)
			options = Library:Place_Defaults({
				Name = "Textbox",
				PlaceholderText = "Input...",
				Callback = function() return end,
			}, options or {})

			local Textbox = {
				PlaceholderText = options.PlaceholderText
			}

			do
				-- StarterGui.VisionLib.MainFrame.MainContainer.TextBoxFrame
				Textbox["1d"] = Instance.new("Frame", Tab["b"])
				Textbox["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Textbox["1d"]["BackgroundTransparency"] = 1
				Textbox["1d"]["Size"] = UDim2.new(0, 400, 0, 30)
				Textbox["1d"]["Name"] = [[TextBoxFrame]]

				-- StarterGui.VisionLib.MainFrame.MainContainer.TextBoxFrame.TextLabel
				Textbox["1e"] = Instance.new("TextLabel", Textbox["1d"])
				Textbox["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Textbox["1e"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
				Textbox["1e"]["TextSize"] = 14
				Textbox["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Textbox["1e"]["Size"] = UDim2.new(0, 400, 0, 30)
				Textbox["1e"]["Text"] = "  "..options.Name
				Textbox["1e"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.TextBoxFrame.TextLabel.UICorner
				Textbox["1f"] = Instance.new("UICorner", Textbox["1e"])
				Textbox["1f"]["CornerRadius"] = UDim.new(0, 6)

				-- StarterGui.VisionLib.MainFrame.MainContainer.TextBoxFrame.TextLabel.UIStroke
				Textbox["20"] = Instance.new("UIStroke", Textbox["1e"])
				Textbox["20"]["Color"] = Color3.fromRGB(60, 60, 60)
				Textbox["20"]["Thickness"] = 0.699999988079071
				Textbox["20"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

				-- StarterGui.VisionLib.MainFrame.MainContainer.TextBoxFrame.TextBox
				Textbox["21"] = Instance.new("TextBox", Textbox["1d"])
				Textbox["21"]["CursorPosition"] = -1
				Textbox["21"]["AutoLocalize"] = false
				Textbox["21"]["TextWrapped"] = true
				Textbox["21"]["TextSize"] = 13
				Textbox["21"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16)
				Textbox["21"]["Size"] = UDim2.new(0, 45, 0, 22)
				Textbox["21"]["TextColor3"] = Color3.fromRGB(103, 103, 103)
				Textbox["21"]["Text"] = options.PlaceholderText
				Textbox["21"]["Position"] = UDim2.new(0, 350, 0, 4)
				Textbox["21"]["Font"] = Enum.Font.Gotham

				-- StarterGui.VisionLib.MainFrame.MainContainer.TextBoxFrame.TextBox.UICorner
				Textbox["22"] = Instance.new("UICorner", Textbox["21"])
				Textbox["22"]["CornerRadius"] = UDim.new(0, 4)
			end

			-- Methods
			do
				Textbox["21"].Focused:Connect(function()
					Textbox["21"].Text = ""
					Textbox["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					
					Library:Tween(Textbox["21"], {
						Length = 0.7,
						Goal = {Position = UDim2.new(0, 311,0, 4)}
					})

					Library:Tween(Textbox["21"], {
						Length = 0.7,
						Goal = {Size = UDim2.new(0, 84,0, 22)}
					})
				end)

				Textbox["21"].FocusLost:Connect(function()
					Library:Tween(Textbox["21"], {
						Length = 0.7,
						Goal = {Position = UDim2.new(0, 350,0, 4)}
					})
					
					Library:Tween(Textbox["21"], {
						Length = 0.7,
						Goal = {Size = UDim2.new(0, 45,0, 22)}
					})
					
					local nospacestr = string.gsub(Textbox["21"].Text, " ", "")
					
					if nospacestr == "" then
						Textbox["21"]["TextColor3"] = Color3.fromRGB(103, 103, 103)
						Textbox["21"]["Text"] = Textbox.PlaceholderText
					end
					
					pcall(function()
						options.Callback(Textbox["21"]["Text"])
					end)
				end)
				
				function Textbox:SetText(name)
					Textbox["1e"]["Text"] = "  "..name
				end
			end

			Library:ResizeCanvas(Tab["b"])
			return Textbox
		end
		
		return Tab
	end
	
	-- Gui Handles
	-- Nav Close
	do
		local function titleBarHover(button, hover)
			if hover then
				Library:Tween(button, {
					Length = 0.2,
					Goal = {ImageColor3 = Color3.fromRGB(136, 103, 177)}
				})
			else
				Library:Tween(button, {
					Length = 0.2,
					Goal = {ImageColor3 = Color3.fromRGB(255, 255, 255)}
				})
			end
		end
		
		-- Title bar settings
		do
			local SettingTab = GUI:Tab({
				Name = "Settings",
				Icon = "rbxassetid://11254763826",
				Hidden = true
			})
			
			
			GUI["a"].MouseEnter:Connect(function()			
				titleBarHover(GUI["a"], true)
			end)

			GUI["a"].MouseLeave:Connect(function()
				titleBarHover(GUI["a"], false)
			end)
			
			GUI["a"].MouseButton1Click:Connect(function()
				SettingTab:Activate()
			end)
			
			SettingTab:Section({
				Name = "Credits",
			})

			SettingTab:TextLabel({
				Name = "Scripted by Loco_CTO, BruhOOFBoi",
				Color = Color3.fromRGB(136, 103, 177)
			})
			SettingTab:TextLabel({
				Name = "Gui Designed by BruhOOFBoi",
				Color = Color3.fromRGB(136, 103, 177)
			})
			
			SettingTab:Section({
				Name = "Settings",
			})
			
			SettingTab:Toggle({
				Name = "Lock Dragging",
				Default = false,
				Callback = function(bool)
					Library.LockDragging = bool
				end
			})
			
			SettingTab:Slider({
				Name = "Drag Speed",
				Min = 0,
				Max = 100,
				Default = 10,
				Callback = function(val)
					Library.DragSpeed = val/100
				end
			})
			
			SettingTab:Keybind({
				Name = "Keybind",
				Default = Enum.KeyCode.RightShift,
				Callback = function() return end,
				UpdateKeyCallback = function(key)
					GUI.ToggleKey = key
				end
			})
		end
		
		-- Nav bar close
		GUI["33"].MouseEnter:Connect(function()			
			titleBarHover(GUI["33"], true)
		end)

		GUI["33"].MouseLeave:Connect(function()
			titleBarHover(GUI["33"], false)
		end)

		GUI["33"].MouseButton1Click:Connect(function()
			GUI.Navagation = false
			Library:ToggleNav(GUI.Navagation, GUI["27"])
		end)

		--Nav Open
		GUI["7"].MouseEnter:Connect(function()
			titleBarHover(GUI["7"], true)
		end)

		GUI["7"].MouseLeave:Connect(function()
			titleBarHover(GUI["7"], false)
		end)

		GUI["7"].MouseButton1Click:Connect(function()
			if not GUI.Navagation then
				GUI.Navagation = true
				Library:ToggleNav(GUI.Navagation, GUI["27"])
			end
		end)
		
		-- UI Toggle
		GUI["9"].MouseEnter:Connect(function()
			titleBarHover(GUI["9"], true)
		end)
		
		GUI["9"].MouseLeave:Connect(function()
			titleBarHover(GUI["9"], false)
		end)
		
		GUI["9"].MouseButton1Click:Connect(function()
			if not Library.TweeningToggle then
				Library.TweeningToggle = true
				GUI.Visible = false
				Library:ToggleGui(GUI.Visible, GUI["2"])
				Library:ToggleGui(GUI.Visible, GUI["b9"])
				
				task.wait(0.52)
				Library.TweeningToggle = false
			end
		end)
		
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == GUI.ToggleKey then
				if not Library.TweeningToggle then
					Library.TweeningToggle = true
					
					if GUI.Visible then
						GUI.Visible = false
						Library:ToggleGui(GUI.Visible, GUI["2"])
						Library:ToggleGui(GUI.Visible, GUI["b9"])
					else
						GUI.Visible = true
						Library:ToggleGui(GUI.Visible, GUI["2"])
						Library:ToggleGui(GUI.Visible, GUI["b9"])
					end
					
					task.wait(0.52)
					Library.TweeningToggle = false
				end
			end
		end)
	end
	
	-- Drag handle
	do		
		GUI["2"].MouseEnter:Connect(function()
			Library.MainFrameHover = true
		end)

		GUI["2"].MouseLeave:Connect(function()
			Library.MainFrameHover = false
		end)
		
		UserInputService.InputBegan:Connect(function(input)
			if Library.MainFrameHover then
				if input.UserInputType == Enum.UserInputType.MouseButton1 and not Library.Sliding then
					local ObjectPosition = Vector2.new(Mouse.X - GUI["2"].AbsolutePosition.X, Mouse.Y - GUI["2"].AbsolutePosition.Y)
					while RunService.RenderStepped:wait() and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						if not Library.Sliding then
							if Library.LockDragging then
								local FrameX, FrameY = math.clamp(Mouse.X - ObjectPosition.X, 0, GUI["1"].AbsoluteSize.X - GUI["2"].AbsoluteSize.X), math.clamp(Mouse.Y - ObjectPosition.Y, 0, GUI["1"].AbsoluteSize.Y - GUI["2"].AbsoluteSize.Y)
								Library:Tween(GUI["2"], {
									Goal = {Position = UDim2.fromOffset(FrameX + (GUI["2"].Size.X.Offset * GUI["2"].AnchorPoint.X), FrameY + (GUI["2"].Size.Y.Offset * GUI["2"].AnchorPoint.Y))},
									Style = Enum.EasingStyle.Linear,
									Direction = Enum.EasingDirection.InOut,
									Length = Library.DragSpeed
								})

								Library:Tween(GUI["b9"], {
									Goal = {Position = UDim2.fromOffset(FrameX + (GUI["2"].Size.X.Offset * GUI["2"].AnchorPoint.X), FrameY + (GUI["2"].Size.Y.Offset * GUI["2"].AnchorPoint.Y))},
									Style = Enum.EasingStyle.Linear,
									Direction = Enum.EasingDirection.InOut,
									Length = Library.DragSpeed
								})
							else
								Library:Tween(GUI["2"], {
									Goal = {Position = UDim2.fromOffset(Mouse.X - ObjectPosition.X + (GUI["2"].Size.X.Offset * GUI["2"].AnchorPoint.X), Mouse.Y - ObjectPosition.Y + (GUI["2"].Size.Y.Offset * GUI["2"].AnchorPoint.Y))},
									Style = Enum.EasingStyle.Linear,
									Direction = Enum.EasingDirection.InOut,
									Length = Library.DragSpeed	
								})

								Library:Tween(GUI["b9"], {
									Goal = {Position = UDim2.fromOffset(Mouse.X - ObjectPosition.X + (GUI["2"].Size.X.Offset * GUI["2"].AnchorPoint.X), Mouse.Y - ObjectPosition.Y + (GUI["2"].Size.Y.Offset * GUI["2"].AnchorPoint.Y))},
									Style = Enum.EasingStyle.Linear,
									Direction = Enum.EasingDirection.InOut,
									Length = Library.DragSpeed	
								})
							end	
						end
					end
				end
			end
		end)
	end
	
	return GUI
end

return Library
