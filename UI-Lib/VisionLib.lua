--Services
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse() 

--Var
local Library = {
	DragSpeed = 0.1,
	LockDragging = true,
	MainFrameHover = false
}
local ViewPortSize = workspace.CurrentCamera.ViewportSize

--Lib
function Library:ToggleGui(toggle, frame)
	if toggle == true then
		frame.Visible = true
	else
		frame.Visible = false
	end

	return true
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
		Name = "UI Lib"
	}, options or {})
	
	local GUI = {
		Navagation = false,
		NavagationToggleHover = false,
		NavagationCloseHover = false,
		Visible = false,
		CurrentTab = nil
	}
	 
	--BaseFrame
	do
		-- StarterGui.VisionLib
		GUI["1"] = Instance.new("ScreenGui", game.CoreGui)
		GUI["1"]["Name"] = [[VisionLib]]
		GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	end
	
	--Main Frame
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
		
		-- StarterGui.VisionLib.ShadowFrame
		GUI["s1"] = Instance.new("Frame", GUI["1"])
		GUI["s1"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41)
		GUI["s1"]["Size"] = UDim2.new(0, 431, 0, 506)
		GUI["s1"]["ClipsDescendants"] = false
		GUI["s1"]["Position"] = UDim2.new(0.3449864089488983, 0, 0.09605705738067627, 0)
		GUI["s1"]["Name"] = [[ShadowFrame]]
		GUI["s1"]["BackgroundTransparency"] = 1
		GUI["s1"]["ZIndex"] = 0
		
		-- StarterGui.VisionLib.MainFrame.DropShadowHolder
		GUI["34"] = Instance.new("Frame", GUI["s1"])
		GUI["34"]["ZIndex"] = 0
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
	end

	--TitleBar
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
	
	--NavagationBar
	do
		-- StarterGui.VisionLib.MainFrame.NavagationBar
		GUI["27"] = Instance.new("Frame", GUI["2"])
		GUI["27"]["ZIndex"] = 3
		GUI["27"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
		GUI["27"]["Size"] = UDim2.new(0, 196, 0, 504);
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
			Icon = "rbxassetid://11254763826"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		do
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

			Tab["c"] = Instance.new("UIListLayout", Tab["b"])
			Tab["c"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
			Tab["c"]["Padding"] = UDim.new(0, 5)
			Tab["c"]["SortOrder"] = Enum.SortOrder.LayoutOrder

			Tab["d"] = Instance.new("UIPadding", Tab["b"])
			Tab["d"]["PaddingTop"] = UDim.new(0, 7)
			
			Tab["b"].Visible = false
		end
		
		--Handler
		do
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
			
			function Tab:Activate()
				if not Tab.Active then
					if GUI.CurrentTab ~= nil then
						GUI.CurrentTab:Deactivate()
					end
					
					Tab.Active = true
					
					Library:Tween(Tab["2a"], {
						Length = 0.2,
						Goal = {BackgroundColor3 = Color3.fromRGB(3, 3, 3)}
					})
					
					GUI.Navagation = false
					Library:ToggleNav(GUI.Navagation, GUI["27"])
					
					Tab["b"].Visible = true
					GUI.CurrentTab = Tab
				end
			end
			
			function Tab:Deactivate()
				if Tab.Active then
					Tab.Active = false
					Tab.Hover = false
					
					Tab["b"].Visible = false
					Library:Tween(Tab["2a"], {
						Length = 0.2,
						Goal = {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}
					})
				end
			end
			
			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		--TextButton
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
			
			return Button
		end
		
		--TextLabel
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

			return TextLabel
		end
		
		function Tab:Toggle(options)
			options = Library:Place_Defaults({
				Name = "Toggle",
				Default = false,
				Callback = function() end
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
			
			return Toggle
		end
		
		return Tab
	end
	
	--Gui Handles
	--Nav Close
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
		
		GUI["33"].MouseEnter:Connect(function()
			GUI.NavagationCloseHover = true
			
			titleBarHover(GUI["33"], true)
		end)

		GUI["33"].MouseLeave:Connect(function()
			GUI.NavagationCloseHover = false

			titleBarHover(GUI["33"], false)
		end)

		GUI["33"].MouseButton1Click:Connect(function()
			if GUI.Navagation then
				GUI.Navagation = false
				Library:ToggleNav(GUI.Navagation, GUI["27"])
			end
		end)

		--Nav Open
		GUI["7"].MouseEnter:Connect(function()
			GUI.NavagationToggleHover = true

			titleBarHover(GUI["7"], true)
		end)

		GUI["7"].MouseLeave:Connect(function()
			GUI.NavagationToggleHover = false

			titleBarHover(GUI["7"], false)
		end)

		GUI["7"].MouseButton1Click:Connect(function()
			if not GUI.Navagation then
				GUI.Navagation = true
				Library:ToggleNav(GUI.Navagation, GUI["27"])
			end
		end)
		
		GUI["9"].MouseEnter:Connect(function()
			titleBarHover(GUI["9"], true)
		end)
		
		GUI["9"].MouseLeave:Connect(function()
			titleBarHover(GUI["9"], false)
		end)
		
		GUI["9"].MouseButton1Click:Connect(function()
			GUI.Visible = false
			Library:ToggleGui(GUI.Visible, GUI["2"])
		end)
		
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.RightShift then
				if GUI.Visible then
					GUI.Visible = false
					Library:ToggleGui(GUI.Visible, GUI["2"])
				else
					GUI.Visible = true
					Library:ToggleGui(GUI.Visible, GUI["2"])
				end
			end
		end)
	end
	
	--Drag handle
	do		
		GUI["2"].MouseEnter:Connect(function()
			Library.MainFrameHover = true
		end)

		GUI["2"].MouseLeave:Connect(function()
			Library.MainFrameHover = false
		end)
		
		UserInputService.InputBegan:Connect(function(input)
			if Library.MainFrameHover then
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					local ObjectPosition = Vector2.new(Mouse.X - GUI["2"].AbsolutePosition.X, Mouse.Y - GUI["2"].AbsolutePosition.Y)
					while RunService.RenderStepped:wait() and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						if Library.LockDragging then
							local FrameX, FrameY = math.clamp(Mouse.X - ObjectPosition.X, 0, GUI["1"].AbsoluteSize.X - GUI["2"].AbsoluteSize.X), math.clamp(Mouse.Y - ObjectPosition.Y, 0, GUI["1"].AbsoluteSize.Y - GUI["2"].AbsoluteSize.Y)
							Library:Tween(GUI["2"], {
								Goal = {Position = UDim2.fromOffset(FrameX + (GUI["2"].Size.X.Offset * GUI["2"].AnchorPoint.X), FrameY + (GUI["2"].Size.Y.Offset * GUI["2"].AnchorPoint.Y))},
								Style = Enum.EasingStyle.Linear,
								Direction = Enum.EasingDirection.InOut,
								Length = Library.DragSpeed
							})
							
							Library:Tween(GUI["s1"], {
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
							
							Library:Tween(GUI["s1"], {
								Goal = {Position = UDim2.fromOffset(Mouse.X - ObjectPosition.X + (GUI["2"].Size.X.Offset * GUI["2"].AnchorPoint.X), Mouse.Y - ObjectPosition.Y + (GUI["2"].Size.Y.Offset * GUI["2"].AnchorPoint.Y))},
								Style = Enum.EasingStyle.Linear,
								Direction = Enum.EasingDirection.InOut,
								Length = Library.DragSpeed	
							})
						end	
					end
				end
			end
		end)
	end
	
	return GUI
end

return Library
