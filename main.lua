repeat
    task.wait(1)
until game:IsLoaded()

--Libraries/Require
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/Jailbreak-Vision/main/UI-Lib/Custom-Mercury.lua"))()
local tweenService = game:GetService("TweenService")

--Folders Handle
local assetFolder = Instance.new("Folder")
assetFolder.Name = "JailbreakVision"
assetFolder.Parent = game.Workspace

--Preload Assets
--Screen GUI
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
ScreenGui0 = Instance.new("ScreenGui")
Frame1 = Instance.new("Frame")
Frame2 = Instance.new("Frame")
TextLabel3 = Instance.new("TextLabel")
UIAspectRatioConstraint4 = Instance.new("UIAspectRatioConstraint")
TextLabel5 = Instance.new("TextLabel")
UIAspectRatioConstraint6 = Instance.new("UIAspectRatioConstraint")
TextLabel7 = Instance.new("TextLabel")
UIAspectRatioConstraint8 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint9 = Instance.new("UIAspectRatioConstraint")
Frame10 = Instance.new("Frame")
Frame11 = Instance.new("Frame")
Frame12 = Instance.new("Frame")
Frame13 = Instance.new("Frame")
UIAspectRatioConstraint14 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint15 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint16 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint17 = Instance.new("UIAspectRatioConstraint")
UIPadding18 = Instance.new("UIPadding")
UIAspectRatioConstraint19 = Instance.new("UIAspectRatioConstraint")
ScreenGui0.Name = "ScreenGui"
ScreenGui0.Parent = mas
ScreenGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Frame1.Name = "Speedometer"
Frame1.Parent = ScreenGui0
Frame1.Position = UDim2.new(0.743211806, 0, 0.751252115, 0)
Frame1.Size = UDim2.new(0.249804839, 0, 0.228714526, 0)
Frame1.BackgroundColor = BrickColor.new("Institutional white")
Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
Frame1.BackgroundTransparency = 1
Frame2.Name = "Top"
Frame2.Parent = Frame1
Frame2.Position = UDim2.new(0.278125018, 0, 0.197080299, 0)
Frame2.Size = UDim2.new(0.593511343, 0, 0.545633733, 0)
Frame2.BackgroundColor = BrickColor.new("Olivine")
Frame2.BackgroundColor3 = Color3.new(0.333333, 1, 0.498039)
Frame2.BackgroundTransparency = 1
TextLabel3.Name = "Speed"
TextLabel3.Parent = Frame2
TextLabel3.Position = UDim2.new(0.162012488, 0, -0.240115777, 0)
TextLabel3.Size = UDim2.new(0.663265288, 0, 1.40259731, 0)
TextLabel3.BackgroundColor = BrickColor.new("Institutional white")
TextLabel3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Font = Enum.Font.SourceSansLight
TextLabel3.FontSize = Enum.FontSize.Size96
TextLabel3.Text = "<i>000</i>"
TextLabel3.TextColor = BrickColor.new("Institutional white")
TextLabel3.TextColor3 = Color3.new(1, 1, 1)
TextLabel3.TextScaled = true
TextLabel3.TextSize = 100
TextLabel3.TextTransparency = 0.5
TextLabel3.TextWrap = true
TextLabel3.TextWrapped = true
TextLabel3.RichText = true
UIAspectRatioConstraint4.Parent = TextLabel3
UIAspectRatioConstraint4.AspectRatio = 0.9688636660575867
TextLabel5.Name = "Format"
TextLabel5.Parent = Frame2
TextLabel5.Position = UDim2.new(0.790816367, 0, 0.597402632, 0)
TextLabel5.Size = UDim2.new(0.209183648, 0, 0.376623333, 0)
TextLabel5.BackgroundColor = BrickColor.new("Institutional white")
TextLabel5.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel5.BackgroundTransparency = 1
TextLabel5.Font = Enum.Font.Oswald
TextLabel5.FontSize = Enum.FontSize.Size24
TextLabel5.Text = "<i><b><u>MP/H</u></b></i>"
TextLabel5.TextColor = BrickColor.new("Institutional white")
TextLabel5.TextColor3 = Color3.new(1, 1, 1)
TextLabel5.TextScaled = true
TextLabel5.TextSize = 19
TextLabel5.TextTransparency = 0.5
TextLabel5.TextWrap = true
TextLabel5.TextWrapped = true
TextLabel5.RichText = true
UIAspectRatioConstraint6.Parent = TextLabel5
UIAspectRatioConstraint6.AspectRatio = 1.1379649639129639
TextLabel7.Name = "Gear"
TextLabel7.Parent = Frame2
TextLabel7.Position = UDim2.new(-0.0418614633, 0, 0.318325847, 0)
TextLabel7.Size = UDim2.new(0.275510192, 0, 0.688311517, 0)
TextLabel7.BackgroundColor = BrickColor.new("Institutional white")
TextLabel7.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel7.BackgroundTransparency = 1
TextLabel7.Font = Enum.Font.GothamMedium
TextLabel7.FontSize = Enum.FontSize.Size36
TextLabel7.LineHeight = 0.8999999761581421
TextLabel7.Text = "<i>1</i>"
TextLabel7.TextColor = BrickColor.new("Institutional white")
TextLabel7.TextColor3 = Color3.new(1, 1, 1)
TextLabel7.TextScaled = true
TextLabel7.TextSize = 35
TextLabel7.TextTransparency = 0.5
TextLabel7.TextWrap = true
TextLabel7.TextWrapped = true
TextLabel7.RichText = true
UIAspectRatioConstraint8.Parent = TextLabel7
UIAspectRatioConstraint8.AspectRatio = 0.8200890421867371
UIAspectRatioConstraint9.Parent = Frame2
UIAspectRatioConstraint9.AspectRatio = 2.048841714859009
Frame10.Name = "Bottom"
Frame10.Parent = Frame1
Frame10.Position = UDim2.new(0.278125018, 0, 0.5182482, 0)
Frame10.Size = UDim2.new(0.593511343, 0, 0.403910697, 0)
Frame10.BackgroundColor = BrickColor.new("Institutional white")
Frame10.BackgroundColor3 = Color3.new(1, 1, 1)
Frame10.BackgroundTransparency = 1
Frame11.Name = "Meter"
Frame11.Parent = Frame10
Frame11.Position = UDim2.new(-0.0612244941, 0, 0.122807026, 0)
Frame11.Size = UDim2.new(1.10204077, 0, 0.771929801, 0)
Frame11.BackgroundColor = BrickColor.new("Institutional white")
Frame11.BackgroundColor3 = Color3.new(1, 1, 1)
Frame11.BackgroundTransparency = 1
Frame12.Name = "BarBackground"
Frame12.Parent = Frame11
Frame12.Position = UDim2.new(-0.0779308751, 0, 0.65909034, 0)
Frame12.Size = UDim2.new(1.0038569, 0, 0.227272734, 0)
Frame12.BackgroundColor = BrickColor.new("Institutional white")
Frame12.BackgroundColor3 = Color3.new(1, 1, 1)
Frame12.BackgroundTransparency = 0.75
Frame12.BorderSizePixel = 0
Frame13.Name = "Bar"
Frame13.Parent = Frame12
Frame13.Size = UDim2.new(0.524861872, 0, 1, 0)
Frame13.BackgroundColor = BrickColor.new("Institutional white")
Frame13.BackgroundColor3 = Color3.new(1, 1, 1)
Frame13.BackgroundTransparency = 0.5
Frame13.BorderSizePixel = 0
UIAspectRatioConstraint14.Parent = Frame13
UIAspectRatioConstraint14.AspectRatio = 9.160382270812988
UIAspectRatioConstraint15.Parent = Frame12
UIAspectRatioConstraint15.AspectRatio = 17.452938079833984
UIAspectRatioConstraint16.Parent = Frame11
UIAspectRatioConstraint16.AspectRatio = 3.9513373374938965
UIAspectRatioConstraint17.Parent = Frame10
UIAspectRatioConstraint17.AspectRatio = 2.767733335494995
UIPadding18.Parent = Frame1
UIPadding18.PaddingBottom = UDim.new(0, 4)
UIPadding18.PaddingRight = UDim.new(0, 8)
UIAspectRatioConstraint19.Parent = Frame1
UIAspectRatioConstraint19.AspectRatio = 1.8835649490356445
for i,v in pairs(mas:GetChildren()) do
	v.Parent = assetFolder
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end

--Surface GUI
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
SurfaceGui0 = Instance.new("SurfaceGui")
Frame1 = Instance.new("Frame")
Frame2 = Instance.new("Frame")
TextLabel3 = Instance.new("TextLabel")
TextLabel4 = Instance.new("TextLabel")
TextLabel5 = Instance.new("TextLabel")
Frame6 = Instance.new("Frame")
Frame7 = Instance.new("Frame")
Frame8 = Instance.new("Frame")
Frame9 = Instance.new("Frame")
SurfaceGui0.Name = "SurfaceGui"
SurfaceGui0.Parent = mas
SurfaceGui0.LightInfluence = 0.5
SurfaceGui0.Face = Enum.NormalId.Back
SurfaceGui0.ClipsDescendants = true
SurfaceGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SurfaceGui0.Brightness = 3
Frame1.Name = "Speedometer"
Frame1.Parent = SurfaceGui0
Frame1.Position = UDim2.new(0.7, 0, 0, 0)
Frame1.Size = UDim2.new(0.3, 0, 1, 0)
Frame1.BackgroundColor = BrickColor.new("Institutional white")
Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
Frame1.BackgroundTransparency = 1
Frame2.Name = "Top"
Frame2.Parent = Frame1
Frame2.Position = UDim2.new(0.278125018, 0, 0.197080299, 0)
Frame2.Size = UDim2.new(0.593511343, 0, 0.545633733, 0)
Frame2.BackgroundColor = BrickColor.new("Olivine")
Frame2.BackgroundColor3 = Color3.new(0.333333, 1, 0.498039)
Frame2.BackgroundTransparency = 1
TextLabel3.Name = "Speed"
TextLabel3.Parent = Frame2
TextLabel3.Position = UDim2.new(0.162012488, 0, -0.240115777, 0)
TextLabel3.Size = UDim2.new(0.663265288, 0, 1.40259731, 0)
TextLabel3.BackgroundColor = BrickColor.new("Institutional white")
TextLabel3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Font = Enum.Font.SourceSansLight
TextLabel3.FontSize = Enum.FontSize.Size96
TextLabel3.Text = "<i>000</i>"
TextLabel3.TextColor = BrickColor.new("Institutional white")
TextLabel3.TextColor3 = Color3.new(1, 1, 1)
TextLabel3.TextScaled = false
TextLabel3.TextSize = 100
TextLabel3.TextTransparency = 0.5
TextLabel3.TextWrap = true
TextLabel3.TextWrapped = true
TextLabel3.RichText = true
TextLabel4.Name = "Format"
TextLabel4.Parent = Frame2
TextLabel4.Position = UDim2.new(0.790816367, 0, 0.597402632, 0)
TextLabel4.Size = UDim2.new(0.209183648, 0, 0.376623333, 0)
TextLabel4.BackgroundColor = BrickColor.new("Institutional white")
TextLabel4.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel4.BackgroundTransparency = 1
TextLabel4.Font = Enum.Font.Oswald
TextLabel4.FontSize = Enum.FontSize.Size24
TextLabel4.Text = "<i><b><u>MP/H</u></b></i>"
TextLabel4.TextColor = BrickColor.new("Institutional white")
TextLabel4.TextColor3 = Color3.new(1, 1, 1)
TextLabel4.TextScaled = false
TextLabel4.TextSize = 19
TextLabel4.TextTransparency = 0.5
TextLabel4.TextWrap = true
TextLabel4.TextWrapped = true
TextLabel4.RichText = true
TextLabel5.Name = "Gear"
TextLabel5.Parent = Frame2
TextLabel5.Position = UDim2.new(-0.0418614633, 0, 0.318325847, 0)
TextLabel5.Size = UDim2.new(0.275510192, 0, 0.688311517, 0)
TextLabel5.BackgroundColor = BrickColor.new("Institutional white")
TextLabel5.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel5.BackgroundTransparency = 1
TextLabel5.Font = Enum.Font.GothamMedium
TextLabel5.FontSize = Enum.FontSize.Size36
TextLabel5.LineHeight = 0.8999999761581421
TextLabel5.Text = "<i>1</i>"
TextLabel5.TextColor = BrickColor.new("Institutional white")
TextLabel5.TextColor3 = Color3.new(1, 1, 1)
TextLabel5.TextScaled = false
TextLabel5.TextSize = 35
TextLabel5.TextTransparency = 0.5
TextLabel5.TextWrap = true
TextLabel5.TextWrapped = true
TextLabel5.RichText = true
Frame6.Name = "Bottom"
Frame6.Parent = Frame1
Frame6.Position = UDim2.new(0.278125018, 0, 0.5182482, 0)
Frame6.Size = UDim2.new(0.593511343, 0, 0.403910697, 0)
Frame6.BackgroundColor = BrickColor.new("Institutional white")
Frame6.BackgroundColor3 = Color3.new(1, 1, 1)
Frame6.BackgroundTransparency = 1
Frame7.Name = "Meter"
Frame7.Parent = Frame6
Frame7.Position = UDim2.new(-0.0612244941, 0, 0.122807026, 0)
Frame7.Size = UDim2.new(1.10204077, 0, 0.771929801, 0)
Frame7.BackgroundColor = BrickColor.new("Institutional white")
Frame7.BackgroundColor3 = Color3.new(1, 1, 1)
Frame7.BackgroundTransparency = 1
Frame8.Name = "BarBackground"
Frame8.Parent = Frame7
Frame8.Position = UDim2.new(-0.0779308751, 0, 0.65909034, 0)
Frame8.Size = UDim2.new(1.0038569, 0, 0.227272734, 0)
Frame8.BackgroundColor = BrickColor.new("Institutional white")
Frame8.BackgroundColor3 = Color3.new(1, 1, 1)
Frame8.BackgroundTransparency = 0.75
Frame8.BorderSizePixel = 0
Frame9.Name = "Bar"
Frame9.Parent = Frame8
Frame9.Size = UDim2.new(0.524861872, 0, 1, 0)
Frame9.BackgroundColor = BrickColor.new("Institutional white")
Frame9.BackgroundColor3 = Color3.new(1, 1, 1)
Frame9.BackgroundTransparency = 0.5
Frame9.BorderSizePixel = 0
for i,v in pairs(mas:GetChildren()) do
	v.Parent = assetFolder
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end

--Define
local OnVehicle = false
local modern3dspeedometerEnable = false
local modernspeedometerEnable = true
local playerVehicle = nil
local SurfaceGUI
local ScreenGUI
local vehicleRPM

--Value

--Functions
local function round(num)
    if num then
        return num>=0 and math.floor(num+0.5) or math.ceil(num-0.5)
    end
end

local function getPlayerVehicle()
    for i, vehicle in pairs(game.Workspace.Vehicles:GetChildren()) do
        if vehicle.Seat:WaitForChild("PlayerName").Value == game:GetService("Players").LocalPlayer.Name then
            playerVehicle = vehicle
        end
    end
end

local function checkIfAutomatic()
    getPlayerVehicle()
    local numOfSound = 0
    for i, v in ipairs(playerVehicle.Engine:GetChildren()) do
        if v.Name == "Sound" then
            numOfSound += 1
        end
    end
    if numOfSound == 1 or numOfSound == 2 then
        return true
    else
        return false
    end
end

local function calGear()
    local automatic = checkIfAutomatic()
    if automatic then
        return 1
    else
        if vehicleRPM > 1250 then
            return 6
        elseif vehicleRPM > 1000 then
            return 5
        elseif vehicleRPM > 750 then
            return 4
        elseif vehicleRPM > 500 then
            return 3
        elseif vehicleRPM > 250 then
            return 2
        elseif vehicleRPM > 0 then
            return 1
        else 
            return 1
        end
    end
end

local function calRPM()
    getPlayerVehicle()
    task.wait(0.1)
    local diameter = playerVehicle:WaitForChild("WheelFrontRight"):WaitForChild("Wheel").Size.Z
    local circumference = diameter*3.14
    local currentPos = playerVehicle.WheelFrontRight.Wheel.Position
    task.wait(1)
    local distancetraveled = (currentPos-playerVehicle.WheelFrontRight.Wheel.Position).Magnitude
    local RPM = (distancetraveled/circumference) * 60
    vehicleRPM = round(RPM)
end

local function modern3dspeedometer()
    if modern3dspeedometerEnable then
        task.wait(0.5)
        if OnVehicle then
            getPlayerVehicle()
            if playerVehicle ~= nil then
                calRPM()
                if not playerVehicle.Model.Body:FindFirstChild("Speedometer") then
                    local vehicle = playerVehicle
                    local part = Instance.new("Part")
                    local weld = Instance.new("Weld")
                    part.Name = "Speedometer"
                    part.Size = Vector3.new(20, 3, 0.5)
                    part.CFrame = vehicle.Model.Body.CFrame + Vector3.new(0,1,0)
                    part.Transparency = 1
                    part.CanCollide = false
                    part.Parent = vehicle.Model.Body
                    part.Orientation = Vector3.new(-9, 0, 0)
                    weld.Parent = part
                    weld.Part0 = vehicle.Engine
                    weld.Part1 = part
                    SurfaceGUI = assetFolder.SurfaceGui:Clone()
                    SurfaceGUI.Parent = part
                    local tweenInfo = TweenInfo.new(2)
                    for i, v in pairs(SurfaceGUI:GetDescendants()) do
                        if v:IsA("TextLabel") then
                            v.TextTransparency = 1
                            tweenService:Create(v,tweenInfo,{TextTransparency = 0.5}):Play()
                        elseif v:IsA("Frame") then
                            if v.Name == "BarBackground" then
                                v.Transparency = 1
                                tweenService:Create(v,tweenInfo,{Transparency = 0.75}):Play()
                            elseif v.Name == "BarBackground" then
                                v.Transparency = 1
                                tweenService:Create(v,tweenInfo,{Transparency = 0.5}):Play()
                            end
                        end
                    end
                    print("Made new speedometer")
                end
            end
            game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Visible = false
            task.wait(0.1)
            print("Made 3D Speedometer")
            while OnVehicle do
                coroutine.warp(function()
                    playerVehicle.Model.Body.Speedometer.SurfaceGui.Speedometer.Top.Speed.Text = "<i>"..game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Top.Speed.Text.."</i>"
                    calRPM()
                end)
                task.wait(1/30)
            end
        else
            print("Try Tweened down Transparency")
            if SurfaceGUI then
                local tweenInfo = TweenInfo.new(2)
                for i, v in pairs(SurfaceGUI:GetDescendants()) do
                    if v:IsA("TextLabel") then
                        tweenService:Create(v,tweenInfo,{TextTransparency = 1}):Play()
                    elseif v:IsA("Frame") then
                        tweenService:Create(v,tweenInfo,{Transparency = 1}):Play()
                    end
                end
                task.wait(2)
                SurfaceGUI.Parent:Destroy()
                print("Tweened down Transparency")
            end
        end
    end
end

local function modernspeedometer()
    if modernspeedometerEnable then
        task.wait(0.5)
        local tweenInfo = TweenInfo.new(2)
        if OnVehicle then
            calRPM(playerVehicle)
            if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") then
                ScreenGUI = assetFolder.ScreenGui:Clone()
                ScreenGUI.Parent = game.Players.LocalPlayer.PlayerGui
                for i, v in pairs(ScreenGUI:GetDescendants()) do
                    if v:IsA("TextLabel") then
                        v.TextTransparency = 1
                        tweenService:Create(v,tweenInfo,{TextTransparency = 0.5}):Play()
                    elseif v:IsA("Frame") then
                        if v.Name == "BarBackground" then
                            v.Transparency = 1
                            tweenService:Create(v,tweenInfo,{Transparency = 0.75}):Play()
                        elseif v.Name == "BarBackground" then
                            v.Transparency = 1
                            tweenService:Create(v,tweenInfo,{Transparency = 0.5}):Play()
                        end
                    end
                end
            end
            game.Players.LocalPlayer.PlayerGui.AppUI.Enabled = false
            game.Players.LocalPlayer.PlayerGui.HotbarGui.Enabled = false
            game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.UIAspectRatioConstraint:Destroy()
            task.wait(0.1)
            while OnVehicle do
                local gear = calGear()
                task.wait(1/60)
                task.spawn(function()
                    game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Top.Gear.Text = "<i>"..gear.."</i>"
                    game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Top.Speed.Text = "<i>"..game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Top.Speed.Text.."</i>"
                    calRPM()
                    if vehicleRPM > 1800 then
                        if vehicleRPM < 1901 then
                            local saturation = 1900-vehicleRPM
                            local satCal = 1 - saturation/100
                            game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.BackgroundColor3 = Color3.fromHSV(0.0, satCal, 1)
                            game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.Size = UDim2.new(1, 0, 1, 0)
                        end
                    elseif vehicleRPM < 1801 then
                        game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.BackgroundColor3 = Color3.fromHSV(0, 0.0, 1)
                        game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.Size = UDim2.new(vehicleRPM/1800, 0, 1, 0)
                    end
                end)
            end
        else
            game.Players.LocalPlayer.PlayerGui.AppUI.Enabled = true
            game.Players.LocalPlayer.PlayerGui.HotbarGui.Enabled = true
            if game.Players.LocalPlayer.PlayerGui.ScreenGui then
                for i, v in pairs(game.Players.LocalPlayer.PlayerGui.ScreenGui:GetDescendants()) do
                    if v:IsA("TextLabel") then
                        tweenService:Create(v,tweenInfo,{TextTransparency = 1}):Play()
                    elseif v:IsA("Frame") then
                        tweenService:Create(v,tweenInfo,{Transparency = 1}):Play()
                    end
                end
                task.wait(2)
                game.Players.LocalPlayer.PlayerGui.ScreenGui:Destroy()
            end
        end
    end
end

--Connect Event
game.Players.LocalPlayer.PlayerGui.AppUI.ChildAdded:Connect(function(gui)
    if gui.name == "Speedometer" then
        OnVehicle = true
        modern3dspeedometer()
        modernspeedometer()
    end
end)

game.Players.LocalPlayer.PlayerGui.AppUI.ChildRemoved:Connect(function(gui)
    if gui.name == "Speedometer" then
        OnVehicle = false
        modern3dspeedometer()
        modernspeedometer()
    end
end)

--GUI
local GUI = Library:Create{
    Name = "Jailbreak Vision",
    Size = UDim2.fromOffset(650, 400),
    Theme = Library.Themes.Dark,
    Link = "https://jailbreakvision.com"
}

local VisualTAB = GUI:tab{
    Icon = "rbxassetid://6034996695",
    Name = "Visual"
}

VisualTAB:Toggle{
	Name = "Modern 3D Speedometer",
	StartingState = false,
	Description = "Creates a 3D modern speedometer (UI Design by BruhOOFBoi)",
	Callback = function(state)
        modern3dspeedometerEnable = state
        modern3dspeedometer()
    end
}

VisualTAB:Toggle{
	Name = "Modern 2D Speedometer",
	StartingState = false,
	Description = "Creates a 2D modern speedometer (UI Design by BruhOOFBoi)",
	Callback = function(state)
        modernspeedometerEnable = state
        modernspeedometer()
    end
}

GUI:Notification{
	Title = "Alert",
	Text = "You shall bump the thread on V3rmillion!",
	Duration = 3,
	Callback = function() end
}

GUI:Credit{
	Name = "Loco_CTO",
	Description = "Main scripter",
}

GUI:Credit{
	Name = "BruhOOFBoi",
	Description = "Scripter + Asset designer",
}

GUI:Credit{
	Name = "Abstract",
	Description = "UI Library Developer",
}

GUI:Credit{
	Name = "Deity",
	Description = "UI Library Developer",
}
