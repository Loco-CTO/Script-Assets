repeat task.wait(1) until game:IsLoaded()

--Libraries/Require
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/Jailbreak-Vision/main/UI-Lib/Custom-Mercury.lua"))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")

local GUI = Library:Create{
    Name = "Jailbreak Vision",
    Size = UDim2.fromOffset(650, 400),
    Theme = Library.Themes.Dark,
    Link = "https://jailbreakvision.com"
}

--Folders Handle
local assetFolder = Instance.new("Folder")
assetFolder.Name = "JailbreakVision"
assetFolder.Parent = game.Workspace
local speedTestFolder = Instance.new("Folder")
speedTestFolder.Name = "SpeedTest"
speedTestFolder.Parent = assetFolder

makefolder("JailbreakVision")
makefolder("JailbreakVision/SpeedTestResults")

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
TextLabel9 = Instance.new("TextLabel")
UIAspectRatioConstraint10 = Instance.new("UIAspectRatioConstraint")
TextLabel11 = Instance.new("TextLabel")
UIAspectRatioConstraint12 = Instance.new("UIAspectRatioConstraint")
TextLabel13 = Instance.new("TextLabel")
UIAspectRatioConstraint14 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint15 = Instance.new("UIAspectRatioConstraint")
Frame16 = Instance.new("Frame")
Frame17 = Instance.new("Frame")
Frame18 = Instance.new("Frame")
Frame19 = Instance.new("Frame")
UIAspectRatioConstraint20 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint21 = Instance.new("UIAspectRatioConstraint")
Frame22 = Instance.new("Frame")
UIAspectRatioConstraint23 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint24 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint25 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint26 = Instance.new("UIAspectRatioConstraint")
UIPadding27 = Instance.new("UIPadding")
UIGradient = Instance.new("UIGradient")
ScreenGui0.Parent = mas
ScreenGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Frame1.Name = "Speedometer"
Frame1.Parent = ScreenGui0
Frame1.Position = UDim2.new(0.738756597, 0, 0.771196842, 0)
Frame1.Size = UDim2.new(0.275862068, 0, 0.228714526, 0)
Frame1.BackgroundColor = BrickColor.new("Institutional white")
Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
Frame1.BackgroundTransparency = 1
Frame2.Name = "Top"
Frame2.Parent = Frame1
Frame2.Position = UDim2.new(0.28125, 0, 0.197080299, 0)
Frame2.Size = UDim2.new(0.612500012, 0, 0.562043786, 0)
Frame2.BackgroundColor = BrickColor.new("Olivine")
Frame2.BackgroundColor3 = Color3.new(0.333333, 1, 0.498039)
Frame2.BackgroundTransparency = 1
TextLabel3.Name = "Speed"
TextLabel3.Parent = Frame2
TextLabel3.Position = UDim2.new(0.223379642, 0, -0.0519480519, 0)
TextLabel3.Size = UDim2.new(0.607142866, 0, 1.2337662, 0)
TextLabel3.BackgroundColor = BrickColor.new("Institutional white")
TextLabel3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel3.BackgroundTransparency = 1
TextLabel3.BorderColor3 = Color3.new(0.207843, 0.207843, 0.207843)
TextLabel3.BorderSizePixel = 16
TextLabel3.ZIndex = 2
TextLabel3.Font = Enum.Font.SourceSansLight
TextLabel3.FontSize = Enum.FontSize.Size96
TextLabel3.Text = "<i>000</i>"
TextLabel3.TextColor = BrickColor.new("Institutional white")
TextLabel3.TextColor3 = Color3.new(1, 1, 1)
TextLabel3.TextScaled = true
TextLabel3.TextSize = 100
TextLabel3.TextStrokeColor3 = Color3.new(0.298039, 0.298039, 0.298039)
TextLabel3.TextTransparency = 0.20000000298023224
TextLabel3.TextWrap = true
TextLabel3.TextWrapped = true
TextLabel3.RichText = true
UIAspectRatioConstraint4.Parent = TextLabel3
UIAspectRatioConstraint4.AspectRatio = 1.2526315450668335
TextLabel5.Name = "Format"
TextLabel5.Parent = Frame2
TextLabel5.Position = UDim2.new(0.783323944, 0, 0.692909122, 0)
TextLabel5.Size = UDim2.new(0.183673471, 0, 0.324675292, 0)
TextLabel5.BackgroundColor = BrickColor.new("Institutional white")
TextLabel5.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel5.BackgroundTransparency = 1
TextLabel5.BorderColor3 = Color3.new(0.207843, 0.207843, 0.207843)
TextLabel5.BorderSizePixel = 16
TextLabel5.Font = Enum.Font.Oswald
TextLabel5.FontSize = Enum.FontSize.Size24
TextLabel5.Text = "<i><b>MPH</b></i>"
TextLabel5.TextColor = BrickColor.new("Institutional white")
TextLabel5.TextColor3 = Color3.new(1, 1, 1)
TextLabel5.TextScaled = true
TextLabel5.TextSize = 19
TextLabel5.TextStrokeColor3 = Color3.new(0.298039, 0.298039, 0.298039)
TextLabel5.TextTransparency = 0.20000000298023224
TextLabel5.TextWrap = true
TextLabel5.TextWrapped = true
TextLabel5.RichText = true
UIAspectRatioConstraint6.Parent = TextLabel5
UIAspectRatioConstraint6.AspectRatio = 1.440000057220459
TextLabel7.Name = "Gear"
TextLabel7.Parent = Frame2
TextLabel7.Position = UDim2.new(0.0357142873, 0, 0.602000058, 0)
TextLabel7.Size = UDim2.new(0.183673471, 0, 0.44155845, 0)
TextLabel7.BackgroundColor = BrickColor.new("Institutional white")
TextLabel7.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel7.BackgroundTransparency = 1
TextLabel7.BorderColor3 = Color3.new(0.207843, 0.207843, 0.207843)
TextLabel7.BorderSizePixel = 16
TextLabel7.ZIndex = 2
TextLabel7.Font = Enum.Font.GothamMedium
TextLabel7.FontSize = Enum.FontSize.Size36
TextLabel7.LineHeight = 0.8999999761581421
TextLabel7.Text = "<i>1</i>"
TextLabel7.TextColor = BrickColor.new("Institutional white")
TextLabel7.TextColor3 = Color3.new(1, 1, 1)
TextLabel7.TextScaled = true
TextLabel7.TextSize = 35
TextLabel7.TextStrokeColor3 = Color3.new(0.298039, 0.298039, 0.298039)
TextLabel7.TextTransparency = 0.20000000298023224
TextLabel7.TextWrap = true
TextLabel7.TextWrapped = true
TextLabel7.RichText = true
UIAspectRatioConstraint8.Parent = TextLabel7
UIAspectRatioConstraint8.AspectRatio = 1.058823585510254
TextLabel9.Name = "SpeedShadow"
TextLabel9.Parent = Frame2
TextLabel9.Position = UDim2.new(0.233325571, 0, -0.0424566902, 0)
TextLabel9.Size = UDim2.new(0.607142866, 0, 1.2337662, 0)
TextLabel9.BackgroundColor = BrickColor.new("Dark grey metallic")
TextLabel9.BackgroundColor3 = Color3.new(0.329412, 0.329412, 0.329412)
TextLabel9.BackgroundTransparency = 1
TextLabel9.BorderColor3 = Color3.new(0.207843, 0.207843, 0.207843)
TextLabel9.BorderSizePixel = 16
TextLabel9.Font = Enum.Font.SourceSansLight
TextLabel9.FontSize = Enum.FontSize.Size96
TextLabel9.Text = "<i>000</i>"
TextLabel9.TextColor = BrickColor.new("Really black")
TextLabel9.TextColor3 = Color3.new(0, 0, 0)
TextLabel9.TextScaled = true
TextLabel9.TextSize = 100
TextLabel9.TextStrokeColor3 = Color3.new(0.298039, 0.298039, 0.298039)
TextLabel9.TextTransparency = 0.800000011920929
TextLabel9.TextWrap = true
TextLabel9.TextWrapped = true
TextLabel9.RichText = true
UIAspectRatioConstraint10.Parent = TextLabel9
UIAspectRatioConstraint10.AspectRatio = 1.2526315450668335
TextLabel11.Name = "GearShadow"
TextLabel11.Parent = Frame2
TextLabel11.Position = UDim2.new(0.045980338, 0, 0.611073673, 0)
TextLabel11.Size = UDim2.new(0.183673471, 0, 0.44155845, 0)
TextLabel11.BackgroundColor = BrickColor.new("Institutional white")
TextLabel11.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel11.BackgroundTransparency = 1
TextLabel11.BorderColor3 = Color3.new(0.207843, 0.207843, 0.207843)
TextLabel11.BorderSizePixel = 16
TextLabel11.Font = Enum.Font.GothamMedium
TextLabel11.FontSize = Enum.FontSize.Size36
TextLabel11.LineHeight = 0.8999999761581421
TextLabel11.Text = "<i>1</i>"
TextLabel11.TextColor = BrickColor.new("Really black")
TextLabel11.TextColor3 = Color3.new(0, 0, 0)
TextLabel11.TextScaled = true
TextLabel11.TextSize = 35
TextLabel11.TextStrokeColor3 = Color3.new(0.298039, 0.298039, 0.298039)
TextLabel11.TextTransparency = 0.800000011920929
TextLabel11.TextWrap = true
TextLabel11.TextWrapped = true
TextLabel11.RichText = true
UIAspectRatioConstraint12.Parent = TextLabel11
UIAspectRatioConstraint12.AspectRatio = 1.058823585510254
TextLabel13.Name = "FormatFormat Shadow"
TextLabel13.Parent = Frame2
TextLabel13.Position = UDim2.new(0.779999971, 0, 0.709999979, 0)
TextLabel13.Size = UDim2.new(0.183673471, 0, 0.324675292, 0)
TextLabel13.BackgroundColor = BrickColor.new("Institutional white")
TextLabel13.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel13.BackgroundTransparency = 1
TextLabel13.BorderColor3 = Color3.new(0.207843, 0.207843, 0.207843)
TextLabel13.BorderSizePixel = 16
TextLabel13.Font = Enum.Font.Oswald
TextLabel13.FontSize = Enum.FontSize.Size24
TextLabel13.Text = "<i><b>MPH</b></i>"
TextLabel13.TextColor = BrickColor.new("Really black")
TextLabel13.TextColor3 = Color3.new(0, 0, 0)
TextLabel13.TextScaled = true
TextLabel13.TextSize = 19
TextLabel13.TextStrokeColor3 = Color3.new(0.298039, 0.298039, 0.298039)
TextLabel13.TextTransparency = 0.800000011920929
TextLabel13.TextWrap = true
TextLabel13.TextWrapped = true
TextLabel13.RichText = true
UIAspectRatioConstraint14.Parent = TextLabel13
UIAspectRatioConstraint14.AspectRatio = 1.440000057220459
UIAspectRatioConstraint15.Parent = Frame2
UIAspectRatioConstraint15.AspectRatio = 2.545454502105713
Frame16.Name = "Bottom"
Frame16.Parent = Frame1
Frame16.Position = UDim2.new(0.28125, 0, 0.5182482, 0)
Frame16.Size = UDim2.new(0.612500012, 0, 0.416058391, 0)
Frame16.BackgroundColor = BrickColor.new("Institutional white")
Frame16.BackgroundColor3 = Color3.new(1, 1, 1)
Frame16.BackgroundTransparency = 1
Frame17.Name = "Meter"
Frame17.Parent = Frame16
Frame17.Position = UDim2.new(-0.0663265288, 0, 0.140350878, 0)
Frame17.Size = UDim2.new(1.10204077, 0, 0.771929801, 0)
Frame17.BackgroundColor = BrickColor.new("Institutional white")
Frame17.BackgroundColor3 = Color3.new(1, 1, 1)
Frame17.BackgroundTransparency = 1
Frame18.Name = "BarBackground"
Frame18.Parent = Frame17
Frame18.Position = UDim2.new(0.0925925896, 0, 0.681818187, 0)
Frame18.Size = UDim2.new(0.837962985, 0, 0.227272734, 0)
Frame18.BackgroundColor = BrickColor.new("Institutional white")
Frame18.BackgroundColor3 = Color3.new(1, 1, 1)
Frame18.BackgroundTransparency = 0.75
Frame18.BorderSizePixel = 0
UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,1,1)), ColorSequenceKeypoint.new(0.6, Color3.new(1,1,1)),ColorSequenceKeypoint.new(0.85, Color3.new(1, 0, 0)),ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))})
UIGradient.Enabled = true
UIGradient.Parent = Frame18
Frame19.Name = "Bar"
Frame19.Parent = Frame18
Frame19.Size = UDim2.new(1, 0, 1, 0)
Frame19.BackgroundColor = BrickColor.new("Institutional white")
Frame19.BackgroundColor3 = Color3.new(1, 1, 1)
Frame19.BackgroundTransparency = 0.4000000059604645
Frame19.BorderSizePixel = 0
Frame19.ZIndex = 2
UIAspectRatioConstraint20.Parent = Frame19
UIAspectRatioConstraint20.AspectRatio = 9.5
UIAspectRatioConstraint21.Parent = Frame18
UIAspectRatioConstraint21.AspectRatio = 18.100000381469727
Frame22.Name = "BarBackgroundShadow"
Frame22.Parent = Frame17
Frame22.Position = UDim2.new(0.109999999, 0, 0.75, 0)
Frame22.Size = UDim2.new(0.837962985, 0, 0.227272734, 0)
Frame22.BackgroundColor = BrickColor.new("Really black")
Frame22.BackgroundColor3 = Color3.new(0, 0, 0)
Frame22.BackgroundTransparency = 0.949999988079071
Frame22.BorderSizePixel = 0
UIAspectRatioConstraint23.Parent = Frame22
UIAspectRatioConstraint23.AspectRatio = 18.100000381469727
UIAspectRatioConstraint24.Parent = Frame17
UIAspectRatioConstraint24.AspectRatio = 4.909090995788574
UIAspectRatioConstraint25.Parent = Frame16
UIAspectRatioConstraint25.AspectRatio = 3.438596487045288
UIAspectRatioConstraint26.Parent = Frame1
UIAspectRatioConstraint26.AspectRatio = 2.335766315460205
UIPadding27.Parent = Frame1
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
local speedTestSampleDuration = 60
local OnVehicle = false
local modern3dspeedometerEnable = false
local modernspeedometerEnable = false
local speedTestForwardMode = true
local speedTest = false
local vehicleLock = false
local playerVehicle = nil
local SurfaceGUI
local ScreenGUI
local vehicleRPM
local vehicleForward
local speedtestfilename = ""
local speedTestSheet = ""

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
    if vehicleForward then
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
    else
        return 1
    end
end

local function calRPM()
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
            calRPM()
            if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") then
                ScreenGUI = assetFolder.ScreenGui:Clone()
                ScreenGUI.Parent = game.Players.LocalPlayer.PlayerGui
            end
            game.Players.LocalPlayer.PlayerGui.AppUI.Enabled = false
            game.Players.LocalPlayer.PlayerGui.HotbarGui.Enabled = false
            game.Players.LocalPlayer.PlayerGui.LevelGui2.Enabled = false
            game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.UIAspectRatioConstraint:Destroy()
            task.wait(0.1)
            while OnVehicle do
                pcall(function()
                    local gear = calGear()
                    task.wait(1/60)
                    task.spawn(function()
                        pcall(function()
                            game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Top.Gear.Text = "<i>"..gear.."</i>"
                            game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Top.GearShadow.Text = "<i>"..gear.."</i>"
                            game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Top.Speed.Text = "<i>"..game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Top.Speed.Text.."</i>"
                            game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Top.SpeedShadow.Text = "<i>"..game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Top.Speed.Text.."</i>"
                            calRPM()
                            if vehicleRPM > 1800 then
                                if vehicleRPM < 1901 then
                                    local saturation = 1900-vehicleRPM
                                    local satCal = 1 - saturation/100
                                    game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.BackgroundColor3 = Color3.fromHSV(0.0, satCal, 0.561)
                                    game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.Size = UDim2.new(1, 0, 1, 0)
                                end
                            elseif vehicleRPM < 1801 then
                                game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.BackgroundColor3 = Color3.fromHSV(0, 0.0, 1)
                                game.Players.LocalPlayer.PlayerGui.ScreenGui.Speedometer.Bottom.Meter.BarBackground.Bar.Size = UDim2.new(vehicleRPM/1800, 0, 1, 0)
                            end
                        end)
                    end)
                end)
            end
        else
            game.Players.LocalPlayer.PlayerGui.AppUI.Enabled = true
            game.Players.LocalPlayer.PlayerGui.HotbarGui.Enabled = true
            game.Players.LocalPlayer.PlayerGui.LevelGui2.Enabled = true
            if game.Players.LocalPlayer.PlayerGui.ScreenGui then
                game.Players.LocalPlayer.PlayerGui.ScreenGui:Destroy()
            end
        end
    end
end

local function recordspeedTest()
    getPlayerVehicle()
    GUI:Notification{
        Title = "Speed Test",
        Text = "You are entering speedtest mode, do not press any key until you are being told!",
        Duration = 5,
        Callback = function() end
    }
    GUI:set_status("Status | Speed Test Mode")
    task.wait(1)
    local platform = Instance.new("Part")
    platform.Position = game.Workspace.Loco_CTO.HumanoidRootPart.Position + Vector3.new(0 ,0 ,0)
    platform.CanCollide = true
    platform.Anchored = true
    platform.Parent = speedTestFolder
    platform.Size = Vector3.new(50,8,50)
    platform.Material = Enum.Material.ForceField
    platform.Color = Color3.new(1, 0, 0)
    playerVehicle:SetPrimaryPartCFrame(platform.CFrame)
    
    local repos = Instance.new("Part")
    repos.Position = game.Workspace.Loco_CTO.HumanoidRootPart.Position + Vector3.new(0 ,10 ,0)
    repos.CanCollide = false
    repos.Anchored = true
    repos.Parent = speedTestFolder
    repos.Transparency = 1
    playerVehicle:SetPrimaryPartCFrame(repos.CFrame)
    task.wait(1)
    playerVehicle:SetPrimaryPartCFrame(repos.CFrame)
    task.wait(1)
    repos:Destroy()

    local pos = Instance.new("Part")
    pos.CFrame = playerVehicle.Engine.CFrame
    pos.Anchored = true
    pos.Parent = speedTestFolder
    pos.CanCollide = false
    pos.Transparency = 1
    task.wait(2)
    GUI:Notification{
        Title = "Speed Test",
        Text = "Speed test is going to start, get prepared",
        Duration = 3,
        Callback = function() end
    }
    task.wait(3)
    GUI:Notification{
        Title = "Speed Test",
        Text = "3",
        Duration = 1,
        Callback = function() end
    }
    task.wait(1)
    GUI:Notification{
        Title = "Speed Test",
        Text = "2",
        Duration = 1,
        Callback = function() end
    }
    task.wait(1)
    GUI:Notification{
        Title = "Speed Test",
        Text = "1",
        Duration = 1,
        Callback = function() end
    }
    task.wait(1)
    GUI:Notification{
        Title = "Speed Test",
        Text = "Start",
        Duration = 1,
        Callback = function() end
    }
    task.wait(1)
    speedTest = true
    vehicleLock = true
    local tweenInfo = TweenInfo.new(1)
    tweenService:Create(platform,tweenInfo,{Color = Color3.new(0, 1, 0)}):Play()
    task.wait(0.1)
    task.spawn(function()
        while vehicleLock do
            playerVehicle:SetPrimaryPartCFrame(pos.CFrame)
            task.wait(1/120)
        end
    end)
    task.spawn(function()
        local recording = {}
        local sec = 0
        local properties = {}
        properties["Vehicle Name"] = playerVehicle.Name
        if speedTestForwardMode then
            properties["Test Mode"] = "Forward"
        else
            properties["Test Mode"] = "Reverse"
        end
        
        recording[sec + 1] = properties
        while speedTest do
            if speedTestForwardMode then
                keypress(0x57)
            else
                keypress(0x53)
            end
            local properties = {}
            properties["Time"] = sec
            properties["Speed"] = game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Top.Speed.Text
    
            recording[sec + 2] = properties
            sec += 1
            task.wait(1)
        end
        speedTestSheet = HttpService:JSONEncode(recording)
    end)
    task.wait(speedTestSampleDuration + 1)
    task.spawn(function()
        keyrelease(0x53)
        keyrelease(0x57)
    end)
    speedTest = false
    tweenService:Create(platform,tweenInfo,{Color = Color3.new(1, 0, 0)}):Play()
    task.wait(1)
    repeat task.wait(1) until tostring(game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Top.Speed.Text) == "000"
    vehicleLock = false
    for i, part in pairs(speedTestFolder:GetDescendants()) do
        part:Destroy()
    end
    if speedtestfilename ~= nil and speedtestfilename ~= "" then
        writefile(tostring("JailbreakVision/SpeedTestResults/"..speedtestfilename..".json"), tostring(speedTestSheet))
    else
        writefile("JailbreakVision/SpeedTestResults/Untitled.json", tostring(speedTestSheet))
    end
    GUI:Notification{
        Title = "Speed Test",
        Text = "You are no longer in speedtest mode, feel free to continue your journey.",
        Duration = 5,
        Callback = function() end
    }
    GUI:set_status("Status | Idle")
end

local function debugspeedTest()
    GUI:Prompt{
        Followup = false,
        Title = "Speed Test",
        Text = "You sure you want to enter speed test mode?",
        Buttons = {
            Yes = function()
                if OnVehicle then
                    if tostring(game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Top.Speed.Text) == "000" then
                        if speedtestfilename ~= nil and speedtestfilename ~= "" then
                            if isfile(tostring("JailbreakVision/SpeedTestResults/"..speedtestfilename..".json")) then
                                print("Custom file name exist")
                                GUI:Prompt{
                                    Followup = true,
                                    Title = "Speed Test",
                                    Text = "File "..speedtestfilename..".json already exist, do you want to replace it?",
                                    Buttons = {
                                        Yes = function()
                                            recordspeedTest()
                                            return
                                        end,
                                        No = function()
                                            return
                                        end
                                    }
                                }
                            else
                                print("Custom file name doesnt exist")
                                recordspeedTest()
                            end
                        else
                            if isfile("JailbreakVision/SpeedTestResults/Untitled.json") then
                                print("Auto file name exist")
                                GUI:Prompt{
                                    Followup = true,
                                    Title = "Speed Test",
                                    Text = "File Untitled.json already exist, do you want to replace it?",
                                    Buttons = {
                                        Yes = function()
                                            recordspeedTest()
                                            return
                                        end,
                                        No = function()
                                            return
                                        end
                                    }
                                }
                            else
                                print("Auto file name doesnt exist")
                                recordspeedTest()
                            end
                        end
                    else
                        GUI:Notification{
                            Title = "Speed Test",
                            Text = "Please stop the vehicle before doing speed test!",
                            Duration = 5,
                            Callback = function() end
                        }
                    end
                else
                    GUI:Notification{
                        Title = "Speed Test",
                        Text = "Please make sure you are on a vehicle!",
                        Duration = 5,
                        Callback = function() end
                    }
                end
            end,
            No = function()
                return
            end
        }
    }
end

--Handler
game.Players.LocalPlayer.PlayerGui.AppUI.ChildAdded:Connect(function(gui)
    if gui.name == "Speedometer" then
        OnVehicle = true
        getPlayerVehicle()
        task.wait(0.1)
        modern3dspeedometer()
        modernspeedometer()
    end
end)

game.Players.LocalPlayer.PlayerGui.AppUI.ChildRemoved:Connect(function(gui)
    if gui.name == "Speedometer" then
        OnVehicle = false
        getPlayerVehicle()
        task.wait(0.1)
        modern3dspeedometer()
        modernspeedometer()
    end
end)

local function keyHandler(key)
    if key =='w' then
        vehicleForward = true
    elseif key =='s' then
        vehicleForward = false
    end
end

mouse.KeyDown:Connect(keyHandler)

--GUI
local VisualTAB = GUI:tab{
    Icon = "rbxassetid://10686484299",
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

local vehicleTab = GUI:tab{
    Icon = "rbxassetid://9285413208",
    Name = "Vehicle Utilities"
}

vehicleTab:Dropdown{
	Name = "Test Mode",
	StartingText = "Forward",
	Description = nil,
	Items = {
		{"Forward", 1},
		{"Reverse", 2}
	},
	Callback = function(value) 
        if value == 1 then
            speedTestForwardMode = true
        else
            speedTestForwardMode = false
        end
    end
}

vehicleTab:Dropdown{
	Name = "Sample Duration",
	StartingText = "60",
	Description = "*In seconds",
	Items = {
        {"30", 30},
		{"60", 60},
        {"90", 90},
		{"120", 120}
	},
	Callback = function(value)
        speedTestSampleDuration = value
    end
}

vehicleTab:Textbox{
	Name = "Filename",
	Callback = function(text)
        speedtestfilename = text
    end
}

vehicleTab:Button{
	Name = "Start Speed Test",
	Description = nil,
	Callback = function()
        debugspeedTest()
    end
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

GUI:Notification{
	Title = "Jailbreak Vision",
	Text = "Welcome to Jailbreak Vision!",
	Duration = 8,
	Callback = function() end
}
GUI:set_status("Status | Idle")
