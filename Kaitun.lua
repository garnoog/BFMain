print("Kaitun Loader")
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Energy")
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

if getgenv().Team == nil then   
    getgenv().Team = "Pirates" -- Pirates/Marines
end

local function SelectTeam()
    local ChooseTeam = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ChooseTeam", true)
    local UIController = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("UIController", true)

    if UIController and ChooseTeam then
        for i, v in pairs(getgc()) do
            if type(v) == "function" and getfenv(v).script == UIController then
                local constant = getconstants(v)
                if constant[1] == getgenv().Team and #constant == 1 then
                    v(getgenv().Team)
                end
            end
        end
    end
end

repeat wait()
    if not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
        break
    end

    local success, errorMessage = pcall(SelectTeam)
    if not success then
        warn("Error in SelectTeam function: " .. errorMessage)
    end

    wait(1)
until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()

--loadstring(game:HttpGet("https://garnoog.000webhostapp.com/UIKaitun.lua"))() --UI

spawn(function()
    while wait() do
        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    		if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
    		    Startk = false
    		    wait(1)
    			game:GetService("TeleportService"):Teleport(game.PlaceId)
    		end
    	end)
    end
end)

local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

spawn(function()
	while wait(3) do
		game:GetService'VirtualUser':CaptureController()
	end
end)

W1 = false
W2 = false
W3 = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    W1 = true
elseif placeId == 4442272183 then
    W2 = true
elseif placeId == 7449423635 then
    W3 = true
end

function CheckQuestBoss()
	-- Old World
	if _G.SelectBoss == "Saber Expert" then
		MsBoss = "Saber Expert"
		NameBoss = "Saber Expert"
		CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
	elseif _G.SelectBoss == "The Saw" then
		MsBoss = "The Saw"
		NameBoss = "The Saw"
		CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
	elseif _G.SelectBoss == "Greybeard" then
		MsBoss = "Greybeard"
		NameBoss = "Greybeard"
		CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
	elseif _G.SelectBoss == "The Gorilla King" then
		MsBoss = "The Gorilla King" 
		NameBoss = "The Gorilla King"
		NameQuestBoss = "JungleQuest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
		CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
	elseif _G.SelectBoss == "Bobby" then
		MsBoss = "Bobby"
		NameBoss = "Bobby"
		NameQuestBoss = "BuggyQuest1"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
		CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
	elseif _G.SelectBoss == "Yeti" then
		MsBoss = "Yeti"
		NameBoss = "Yeti"
		NameQuestBoss = "SnowQuest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
		CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
	elseif _G.SelectBoss == "Mob Leader" then
		MsBoss = "Mob Leader"
		NameBoss = "Mob Leader"
		CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
	elseif _G.SelectBoss == "Vice Admiral" then
		MsBoss = "Vice Admiral"
		NameBoss = "Vice Admiral"
		NameQuestBoss = "MarineQuest2"
		QuestLvBoss = 2
		CFrameQBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
		CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
	elseif _G.SelectBoss == "Warden" then
		MsBoss = "Warden"
		NameBoss = "Warden"
		NameQuestBoss = "ImpelQuest"
		QuestLvBoss = 1
		CFrameQBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif _G.SelectBoss == "Chief Warden" then
		MsBoss = "Chief Warden"
		NameBoss = "Chief Warden"
		NameQuestBoss = "ImpelQuest"
		QuestLvBoss = 2
		CFrameQBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif _G.SelectBoss == "Swan" then
		MsBoss = "Swan"
		NameBoss = "Swan"
		NameQuestBoss = "ImpelQuest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif _G.SelectBoss == "Magma Admiral" then
		MsBoss = "Magma Admiral"
		NameBoss = "Magma Admiral"
		NameQuestBoss = "MagmaQuest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
		CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
	elseif _G.SelectBoss == "Fishman Lord" then
		MsBoss = "Fishman Lord"
		NameBoss = "Fishman Lord"
		NameQuestBoss = "FishmanQuest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
		CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
	elseif _G.SelectBoss == "Wysper" then
		MsBoss = "Wysper"
		NameBoss = "Wysper"
		NameQuestBoss = "SkyExp1Quest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
		CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
	elseif _G.SelectBoss == "Thunder God" then
		MsBoss = "Thunder God"
		NameBoss = "Thunder God"
		NameQuestBoss = "SkyExp2Quest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-7903.0625, 5545.6171875, -381.38848876953125)
		CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
	elseif _G.SelectBoss == "Cyborg" then
		MsBoss = "Cyborg"
		NameBoss = "Cyborg"
		NameQuestBoss = "FountainQuest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
		CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
	-- New World
	elseif _G.SelectBoss == "Diamond" then
		MsBoss = "Diamond"
		NameBoss = "Diamond"
		NameQuestBoss = "Area1Quest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
		CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
	elseif _G.SelectBoss == "Jeremy" then
		MsBoss = "Jeremy"
		NameBoss = "Jeremy"
		NameQuestBoss = "Area2Quest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
		CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
	elseif _G.SelectBoss == "Fajita" then
		MsBoss = "Fajita"
		NameBoss = "Fajita"
		NameQuestBoss = "MarineQuest3"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
		CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
	elseif _G.SelectBoss == "Don Swan" then
		MsBoss = "Don Swan"
		NameBoss = "Don Swan"
		CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
	elseif _G.SelectBoss == "Smoke Admiral" then
		MsBoss = "Smoke Admiral"
		NameBoss = "Smoke Admiral"
		NameQuestBoss = "IceSideQuest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
		CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
	elseif _G.SelectBoss == "Cursed Captain" then
		MsBoss = "Cursed Captain"
		NameBoss = "Cursed Captain"
		CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
	elseif _G.SelectBoss == "Darkbeard" then
		MsBoss = "Darkbeard"
		NameBoss = "Darkbeard"
		CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
	elseif _G.SelectBoss == "Order" then
		MsBoss = "Order"
		NameBoss = "Order"
		CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
	elseif _G.SelectBoss == "Awakened Ice Admiral" then
		MsBoss = "Awakened Ice Admiral"
		NameBoss = "Awakened Ice Admiral"
		NameQuestBoss = "FrostQuest"
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
		CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
	elseif _G.SelectBoss == "Tide Keeper" then
		MsBoss = "Tide Keeper"
		NameBoss = "Tide Keeper"
		NameQuestBoss = "ForgottenQuest"             
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
		CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
	-- Thire World
	elseif _G.SelectBoss == "Stone" then
		MsBoss = "Stone"
		NameBoss = "Stone"
		NameQuestBoss = "PiratePortQuest"             
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-290, 44, 5577)
		CFrameBoss = CFrame.new(-1085, 40, 6779)
	elseif _G.SelectBoss == "Island Empress" then
		MsBoss = "Island Empress"
		NameBoss = "Island Empress"
		NameQuestBoss = "AmazonQuest2"             
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(5443, 602, 752)
		CFrameBoss = CFrame.new(5659, 602, 244)
	elseif _G.SelectBoss == "Kilo Admiral" then
		MsBoss = "Kilo Admiral"
		NameBoss = "Kilo Admiral"
		NameQuestBoss = "MarineTreeIsland"             
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(2178, 29, -6737)
		CFrameBoss =CFrame.new(2846, 433, -7100)
	elseif _G.SelectBoss == "Captain Elephant" then
		MsBoss = "Captain Elephant"
		NameBoss = "Captain Elephant"
		NameQuestBoss = "DeepForestIsland"             
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-13232, 333, -7631)
		CFrameBoss = CFrame.new(-13221, 325, -8405)
	elseif _G.SelectBoss == "Beautiful Pirate" then
		MsBoss = "Beautiful Pirate"
		NameBoss = "Beautiful Pirate"
		NameQuestBoss = "DeepForestIsland2"             
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(5307.53076171875, 22.879674911499023, 120.64453125)
		CFrameBoss = CFrame.new(5182, 23, -20)
	elseif _G.SelectBoss == "rip_indra True Form" then
		MsBoss = "rip_indra True Form"
		NameBoss = "rip_indra True Form"
		CFrameBoss = CFrame.new(-5359, 424, -2735)
	elseif _G.SelectBoss == "Longma" then
		MsBoss = "Longma"
		NameBoss = "Longma"
		CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
	elseif _G.SelectBoss == "Soul Reaper" then
		MsBoss = "Soul Reaper"
		NameBoss = "Soul Reaper"
		CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
	elseif _G.SelectBoss == "Cake Queen" then
		MsBoss = "Cake Queen"
		NameBoss = "Cake Queen"
		NameQuestBoss = "IceCreamIslandQuest"             
		QuestLvBoss = 3
		CFrameQBoss = CFrame.new(-821.267456, 65.9448776, -10964.3994, 0.814093888, -3.67296735e-08, -0.58073324, 3.30765637e-08, 1, -1.6879099e-08, 0.58073324, -5.46748513e-09, 0.814093888)
		CFrameBoss = CFrame.new(-715.467102, 381.69104, -11019.8896, 0.955998719, -1.07319993e-08, -0.293370903, 5.00311881e-09, 1, -2.02781667e-08, 0.293370903, 1.7918131e-08, 0.955998719)
	end
end

		function CheckLevel()
			local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
			if _G.Upto then
				Lv = Lv + 100
			end
			if W1 and not Auto_Raid then
				if Lv == 1 or Lv <= 9 or SelectMonster == "" then -- Bandit
					Ms = "Bandit"
					NameQuest = "BanditQuest1"
					QuestLv = 1
					NameMon = "Bandit"
					CFrameQ = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
					CFrameMon1 = CFrame.new(970.2080078125, 56.6924991607666, 1556.1072998046875)
					CFrameMon2 = CFrame.new(1234.4952392578125, 56.776086807250977, 1592.3544921875)
				elseif Lv == 10 or Lv <= 14 or SelectMonster == "Monkey" then -- Monkey
					Ms = "Monkey"
					NameQuest = "JungleQuest"
					QuestLv = 1
					NameMon = "Monkey"
					CFrameQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					CFrameMon1 = CFrame.new(-1368.2740478515625, 63.19534683227539, 215.27487182617188)
					CFrameMon2 = CFrame.new(-1833.807373046875, 63.195249557495117, 84.70410919189453)
				elseif Lv == 15 or Lv <= 29 or SelectMonster == "Gorilla" then -- Gorilla
					Ms = "Gorilla"
					NameQuest = "JungleQuest"
					QuestLv = 2
					NameMon = "Gorilla"
					CFrameQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					CFrameMon1 = CFrame.new(-1333.598876953125, 58.964738845825195, -410.0936584472656)
					CFrameMon2 = CFrame.new(-1217.0052490234375, 46.563717365264893, -601.7199096679688)
					if Lv >= 25 then
						_G.SelectBoss = "The Gorilla King" 
					end
					SelectMonster = "Monkey"
				elseif Lv >= 60 and Lv <= 75-1 or SelectMonster == "Desert Bandit" then
					Ms = "Desert Bandit"
					NameQuest = "DesertQuest"
					QuestLv = 1
					NameMon = "Desert Bandit"
					CFrameQ = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
					CFrameMon1 = CFrame.new(1018.9495849609375, 46.7817063331604, 4447.12060546875)
					CFrameMon2 = CFrame.new(856.14404296875, 46.781708240509033, 4515.5302734375)
				elseif Lv >= 75 and Lv <= 90-1 or SelectMonster == "Desert Officer" then
					Ms = "Desert Officer"
					NameQuest = "DesertQuest"
					QuestLv = 2
					NameMon = "Desert Officer"
					CFrameQ = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
					CFrameMon1 = CFrame.new(1556.117431640625, 57.28209114074707, 4286.8486328125)
					CFrameMon2 = CFrame.new(1659.349365234375, 41.5542124509811401, 4432.07568359375)
					SelectMonster = "Desert Bandit"
				elseif Lv >= 90 and Lv <= 100-1 or SelectMonster == "Snow Bandit" then -- Snow Bandits
					Ms = "Snow Bandit"
					NameQuest = "SnowQuest"
					QuestLv = 1
					NameMon = "Snow Bandit"
					CFrameQ = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
					CFrameMon1 = CFrame.new(1449.768798828125, 127.61601257324219, -1442.721923828125)
					CFrameMon2 = CFrame.new(1210.66357421875, 127.61601257324219, -1307.120849609375)
				elseif Lv == 100 or Lv <= 119 or SelectMonster == "Snowman" then -- Snowman
					Ms = "Snowman"
					NameQuest = "SnowQuest"
					QuestLv = 2
					NameMon = "Snowman"
					CFrameQ = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
					CFrameMon1 = CFrame.new(1087.208984375, 146.11329650878906, -1415.47314453125)
					CFrameMon2 = CFrame.new(1123.4989013671875, 146.11204528808594, -1623.450439453125)
					if Lv >= 110 then
						_G.SelectBoss = "Yeti"
					end
					SelectMonster = "Snow Bandit"
					_G.Farm_Mon = true
				elseif Lv == 120 or Lv <= 174 or SelectMonster == "Chief Petty Officer" then -- Chief Petty Officer
					Ms = "Chief Petty Officer"
					NameQuest = "MarineQuest2"
					QuestLv = 1
					NameMon = "Chief Petty Officer"
					CFrameQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
					CFrameMon1 = CFrame.new(-4934.6435546875, 60.995275497436523, 4018.2734375)
					CFrameMon2 = CFrame.new(-4696.880859375, 60.995275497436523, 4499.99609375)
					if Lv >= 130 then
						_G.SelectBoss = "Vice Admiral"
					end
				elseif SelectMonster == "Sky Bandit" then -- Sky Bandit
					Ms = "Sky Bandit"
					NameQuest = "SkyQuest"
					QuestLv = 1
					NameMon = "Sky Bandit"
					CFrameQ = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
					CFrameMon1 = CFrame.new(-5090.70849609375, 318.4112548828125, -2841.436279296875)
					CFrameMon2 = CFrame.new(-4879.451171875, 318.4085998535156, -2845.780517578125)
				elseif Lv == 175 or Lv <= 190 or SelectMonster == "Dark Master" then -- Dark Master
					Ms = "Dark Master"
					NameQuest = "SkyQuest"
					QuestLv = 2
					NameMon = "Dark Master"
					CFrameQ = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
					CFrameMon1 = CFrame.new(-5180.4580078125, 428.99517822265625, -2364.961669921875)
					CFrameMon2 = CFrame.new(-5288.2978515625, 428.99517822265625, -2172.651123046875)
					SelectMonster = "Sky Bandit"
				elseif Lv == 190 or Lv <= 209 and SelectMonster == "Prisoner" then
					Ms = "Prisoner"
					QuestLv = 1
					NameQuest = "PrisonerQuest"
					NameMon = "Prisoner"
					CFrameQ = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
					CFrameMon1 = CFrame.new(5046.263671875, 88.995361328125, 606.9403686523438)
					CFrameMon2 = CFrame.new(5388.736328125, 64.99528503417969, 355.5940856933594)
				elseif Lv == 210 or Lv <= 249 or SelectMonster == "Dangerous Prisoner" then
					Ms = "Dangerous Prisoner"
					QuestLv = 2
					NameQuest = "PrisonerQuest"
					NameMon = "Dangerous Prisoner"
					CFrameQ = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
					CFrameMon1 = CFrame.new(5554.7138671875, 41.9767097234725952, 525.6884155273438)
					CFrameMon2 = CFrame.new(5186.40380859375, 47.14271354675293, 1036.81787109375)
					if Lv >= 240 then
						_G.SelectBoss = "Swan"
					elseif Lv >= 230 then
						_G.SelectBoss = "Chief Warden"
					elseif Lv >= 220 then
						_G.SelectBoss = "Warden"
					end
					SelectMonster = "Prisoner"
				elseif Lv == 250 or Lv <= 299 or SelectMonster == "Toga Warrior" then -- Toga Warrior
					Ms = "Toga Warrior"
					NameQuest = "ColosseumQuest"
					QuestLv = 1
					NameMon = "Toga Warrior"
					CFrameQ = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
					CFrameMon1 = CFrame.new(-2104.336181640625, 47.6323161125183105, -2813.4208984375)
					CFrameMon2 = CFrame.new(-1712.619140625, 47.732581615447998, -2794.335693359375)
				elseif Lv == 300 or Lv <= 324 or SelectMonster == "Military Soldier" then -- Military Soldier
					Ms = "Military Soldier"
					NameQuest = "MagmaQuest"
					QuestLv = 1
					NameMon = "Military Soldier"
					CFrameQ = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
					CFrameMon1 = CFrame.new(-5625.5703125, 48.933917045593262, 8349.3564453125)
					CFrameMon2 = CFrame.new(-5281.17333984375, 49.329526901245117, 8648.2080078125)
				elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy" then -- Military Spy
					Ms = "Military Spy"
					NameQuest = "MagmaQuest"
					QuestLv = 2
					NameMon = "Military Spy"
					CFrameQ = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
					CFrameMon1 = CFrame.new(-5937.27294921875, 117.57388305664062, 8883.5263671875)
					CFrameMon2 = CFrame.new(-5784.75341796875, 117.47154998779297, 8651.8525390625)
					SelectMonster = "Military Soldier"
				elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior" then -- Fishman Warrior
					Ms = "Fishman Warrior"
					NameQuest = "FishmanQuest"
					QuestLv = 1
					NameMon = "Fishman Warrior"
					CFrameQ = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
					CFrameMon1 = CFrame.new(61016.3671875, 58.82606315612793, 1627.1832275390625)
					CFrameMon2 = CFrame.new(60907.546875, 58.814878463745117, 1197.362548828125)
				elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando" then -- Fishman Commando
					Ms = "Fishman Commando"
					NameQuest = "FishmanQuest"
					QuestLv = 2
					NameMon = "Fishman Commando"
					CFrameQ = CFrame.new(61122.5625, 18.4716396, 1568.16504)
					CFrameMon1 = CFrame.new(61752.6171875, 58.814878463745117, 1594.0771484375)
					CFrameMon2 = CFrame.new(61952.27734375, 58.814878463745117, 1300.495361328125)
					if Lv >= 425 then
						_G.SelectBoss = "Fishman Lord"
					end
					SelectMonster = "Fishman Warrior"
				elseif Lv == 450 or Lv <= 474 or SelectMonster == "God's Guard" then 
					Ms = "God's Guard"
					NameQuest = "SkyExp1Quest"
					QuestLv = 1
					NameMon = "God's Guards"
					CFrameQ = CFrame.new(-4721.71436, 845.277161, -1954.20105)
					CFrameMon1 = CFrame.new(-4689.6630859375, 885.6202392578125, -1839.041259765625)
					CFrameMon2 = CFrame.new(-4745.87841796875, 883.63037109375, -2020.0938720703125)
					if Lv >= 425 then
						_G.SelectBoss = "Fishman Lord"
					end
					SelectMonster = "Fishman Commando"
				elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda" then
					Ms = "Shanda"
					NameQuest = "SkyExp1Quest"
					QuestLv = 2
					NameMon = "Shanda"
					CFrameQ = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
					CFrameMon1 = CFrame.new(-7770.88671875, 5585.8349609375, -417.3266906738281)
					CFrameMon2 = CFrame.new(-7578.67431640625, 5591.48583984375, -578.1483154296875)
					if Lv >= 500 then
						_G.SelectBoss = "Wysper"
					end
					SelectMonster = "God's Guard"
				elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad" then -- Royal Squad
					Ms = "Royal Squad"
					NameQuest = "SkyExp2Quest"
					QuestLv = 1
					NameMon = "Royal Squad"
					CFrameQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
					CFrameMon1 = CFrame.new(-7798.140625, 5647.22021484375, -1348.610107421875)
					CFrameMon2 = CFrame.new(-7513.701171875, 5647.22021484375, -1489.6790771484375) 
					SelectMonster = "Shanda"
				elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier" then -- Royal Soldier
					 
					Ms = "Royal Soldier"
					NameQuest = "SkyExp2Quest"
					QuestLv = 2
					NameMon = "Royal Soldier"
					CFrameQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
					CFrameMon1 = CFrame.new(-7707.0078125, 5647.22021484375, -1686.4954833984375)
					CFrameMon2 = CFrame.new(-7855.5107421875, 5647.22021484375, -1847.9466552734375)
					if Lv >= 575 then
						_G.SelectBoss = "Thunder God"
					end
					SelectMonster = "Royal Squad"
				elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate" then -- Galley Pirate
					Ms = "Galley Pirate"
					NameQuest = "FountainQuest"
					QuestLv = 1
					NameMon = "Galley Pirate"
					CFrameQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
					CFrameMon1 = CFrame.new(5383.27490234375, 100.84437561035156, 4012.71630859375)
					CFrameMon2 = CFrame.new(5767.6171875, 100.8443717956543, 3978.822509765625)
				elseif Lv >= 650 or SelectMonster == "Galley Captain" then -- Galley Captain
					Ms = "Galley Captain"
					NameQuest = "FountainQuest"
					QuestLv = 2
					NameMon = "Galley Captain"
					CFrameQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
					CFrameMon1 = CFrame.new(5907.650390625, 78.8443717956543, 4865.345703125)
					CFrameMon2 = CFrame.new(5331.69775390625, 78.8443717956543, 4794.982421875)
					if Lv >= 675 then
						_G.SelectBoss = "Cyborg"
					end
					SelectMonster = "Galley Pirate"
				end
			end
			if W2 and not Auto_Raid then
				if Lv == 700 or Lv <= 724 or SelectMonster == "Raider" then -- Raider
					Ms = "Raider"
					NameQuest = "Area1Quest"
					QuestLv = 1
					NameMon = "Raider"
					CFrameQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
					CFrameMon1 = CFrame.new(384.44989013671875, 79.483055114746094, 2326.98291015625)
					CFrameMon2 = CFrame.new(-731.1475830078125, 79.483028411865234, 2365.6357421875)
				elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary" then -- Mercenary
					Ms = "Mercenary"
					NameQuest = "Area1Quest"
					QuestLv = 2
					NameMon = "Mercenary"
					CFrameQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
					CFrameMon1 = CFrame.new(-961.4066162109375, 120.78794860839844, 1690.33984375)
					CFrameMon2 = CFrame.new(-1096.634521484375, 120.6465072631836, 1155.9385986328125)
					SelectMonster = "Raider"
				elseif Lv == 775 or Lv <= 799 or SelectMonster == "Swan Pirate" then -- Swan Pirate
					Ms = "Swan Pirate"
					NameQuest = "Area2Quest"
					QuestLv = 1
					NameMon = "Swan Pirate"
					CFrameQ = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
					CFrameMon1 = CFrame.new(785.8628540039062, 73.46467590332031+40, 1124.413818359375)
					CFrameMon2 = CFrame.new(1014.784912109375, 73.3752670288086+40, 1362.431640625)
				elseif Lv == 800 or Lv <= 874 or SelectMonster == "Factory Staff" then -- Factory Staff
					Ms = "Factory Staff"
					NameQuest = "Area2Quest"
					QuestLv = 2
					NameMon = "Factory Staff"
					CFrameQ = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
					CFrameMon1 = CFrame.new(475.8017578125, 73.3030014038086+40, 165.0749053955078)
					CFrameMon2 = CFrame.new(-430.3453369140625, 73.30300903320312+40, -328.0325012207031)
					SelectMonster = "Swan Pirate"
				elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenant" then -- Marine Lieutenant
					Ms = "Marine Lieutenant"
					NameQuest = "MarineQuest3"
					QuestLv = 1
					NameMon = "Marine Lieutenant"
					CFrameQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
					CFrameMon1 = CFrame.new(-2603.970947265625, 73.30936431884766+40, -3140.04443359375)
					CFrameMon2 = CFrame.new(-3162.383544921875, 73.30936431884766+40, -2916.59814453125)
				elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain" then -- Marine Captain
					Ms = "Marine Captain"
					NameQuest = "MarineQuest3"
					QuestLv = 2
					NameMon = "Marine Captain"
					CFrameQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
					CFrameMon1 = CFrame.new(-2217.585205078125, 73.30936431884766+40, -3262.555419921875)
					CFrameMon2 = CFrame.new(-1834.6614990234375, 73.30936431884766+40, -3171.377685546875)
					SelectMonster = "Marine Lieutenant"
				elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie" then -- Zombie
					Ms = "Zombie"
					NameQuest = "ZombieQuest"
					QuestLv = 1
					NameMon = "Zombie"
					CFrameQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
					CFrameMon1 = CFrame.new(-5689.0810546875, 48.823421478271484+40, -919.1697387695312)
					CFrameMon2 = CFrame.new(-5503.744140625, 48.823360443115234+40, -595.327392578125)
				elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire" then -- Vampire
					Ms = "Vampire"
					NameQuest = "ZombieQuest"
					QuestLv = 2
					NameMon = "Vampire"
					CFrameQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
					CFrameMon1 = CFrame.new(-5822.353515625, 6.745943069458008+40, -1458.3660888671875)
					CFrameMon2 = CFrame.new(-6211.9384765625, 6.745943069458008+40, -1154.1414794921875)
					SelectMonster = "Zombie"
				elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper" then -- Snow Trooper **
					Ms = "Snow Trooper"
					NameQuest = "SnowMountainQuest"
					QuestLv = 1
					NameMon = "Snow Trooper"
					CFrameQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
					CFrameMon1 = CFrame.new(459.7307434082031, 401.7651672363281+40, -5162.66455078125)
					CFrameMon2 = CFrame.new(611.5333251953125, 401.7651672363281+40, -5546.02685546875)
				elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior" then -- Winter Warrior
					Ms = "Winter Warrior"
					NameQuest = "SnowMountainQuest"
					QuestLv = 2
					NameMon = "Winter Warrior"
					CFrameQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
					CFrameMon1 = CFrame.new(1004.4857788085938, 429.7651062011719+40, -5038.96533203125)
					CFrameMon2 = CFrame.new(1326.594482421875, 429.7651062011719+40, -5310.4306640625)
					SelectMonster = "Snow Trooper"
				elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate" then -- Lab Subordinate
					Ms = "Lab Subordinate"
					NameQuest = "IceSideQuest"
					QuestLv = 1
					NameMon = "Lab Subordinate"
					CFrameQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
					CFrameMon1 = CFrame.new(-5719.580078125, 16.295000076293945+40, -4522.279296875)
					CFrameMon2 = CFrame.new(-5719.580078125, 16.295000076293945+40, -4522.279296875)
				elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior" then -- Horned Warrior
					Ms = "Horned Warrior"
					NameQuest = "IceSideQuest"
					QuestLv = 2
					NameMon = "Horned Warrior"
					CFrameQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
					CFrameMon1 = CFrame.new(-6520.41162109375, 16.295127868652344+40, -5609.33056640625)
					CFrameMon2 = CFrame.new(-6119.44189453125, 16.29500389099121+40, -6073.56640625)
					SelectMonster = "Lab Subordinate"
				elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja" then -- Magma Ninja
					Ms = "Magma Ninja"
					NameQuest = "FireSideQuest"
					QuestLv = 1
					NameMon = "Magma Ninja"
					CFrameQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
					CFrameMon1 = CFrame.new(-5769.294921875, 16.29500389099121+40, -5853.07861328125)
					CFrameMon2 = CFrame.new(-5184.8876953125, 16.29512596130371+40, -6097.13916015625)
				elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate" then 
					Ms = "Lava Pirate"
					NameQuest = "FireSideQuest"
					QuestLv = 2
					NameMon = "Lava Pirate"
					CFrameQ = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
					CFrameMon1 = CFrame.new(-5264.19921875, 16.295000076293945+40, -4840.10888671875)
					CFrameMon2 = CFrame.new(-5307.43359375, 16.29500389099121+40, -4358.10498046875)
					SelectMonster = "Magma Ninja"
				elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand" then 
					Ms = "Ship Deckhand"
					NameQuest = "ShipQuest1"
					QuestLv = 1
					NameMon = "Ship Deckhand"
					CFrameQ = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
					CFrameMon1 = CFrame.new(677.4046020507812, 126.0723648071289+40, 32972.19140625)
					CFrameMon2 = CFrame.new(1169.3280029296875, 126.0723648071289+40, 33001.484375)
				elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer" then 
					Ms = "Ship Engineer"
					NameQuest = "ShipQuest1"
					QuestLv = 2
					NameMon = "Ship Engineer"
					CFrameQ = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
					CFrameMon1 = CFrame.new(1021.7435913085938, 40.78610610961914+40, 32909.77734375)
					CFrameMon2 = CFrame.new(806.5869140625, 40.78610610961914+40, 32871.27734375)
					SelectMonster = "Ship Deckhand"
				elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward" then 
					Ms = "Ship Steward"
					NameQuest = "ShipQuest2"
					QuestLv = 1
					NameMon = "Ship Steward"
					CFrameQ = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
					CFrameMon1 = CFrame.new(919.6567993164062, 129.89923095703125+40, 33439.78515625)
					CFrameMon2 = CFrame.new(919.6567993164062, 129.89923095703125+40, 33439.78515625)
				elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer" then 
					Ms = "Ship Officer"
					NameQuest = "ShipQuest2"
					QuestLv = 2
					NameMon = "Ship Officer"
					CFrameQ = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
					CFrameMon1 = CFrame.new(621.70361328125, 181.4923553466797+40, 33312.359375)
					CFrameMon2 = CFrame.new(1244.39306640625, 181.4923553466797+40, 33296.1953125)
					SelectMonster = "Ship Steward"
				elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior" then 
					Ms = "Arctic Warrior"
					NameQuest = "FrostQuest"
					QuestLv = 1
					NameMon = "Arctic Warrior"
					CFrameQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
					CFrameMon1 = CFrame.new(5830.15380859375, 28.71072769165039+40, -6347.15576171875)
					CFrameMon2 = CFrame.new(6172.53125, 28.71059799194336+40, -6212.40087890625)
				elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker" then -- Snow Lurker
					Ms = "Snow Lurker"
					NameQuest = "FrostQuest"
					QuestLv = 2
					NameMon = "Snow Lurker"
					CFrameQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
					CFrameMon1 = CFrame.new(5691.185546875, 28.75920295715332+40, -6652.7890625)
					CFrameMon2 = CFrame.new(5447.67724609375, 28.486583709716797+40, -6940.033203125)
					SelectMonster = "Arctic Warrior"
				elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier" then -- Sea Soldier
					Ms = "Sea Soldier"
					NameQuest = "ForgottenQuest"
					QuestLv = 1
					NameMon = "Sea Soldier"
					CFrameQ = CFrame.new(-3054.44458, 235.544281+2, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
					CFrameMon1 = CFrame.new(-3378.50341796875, 27.31045913696289+40, -9833.265625)
					CFrameMon2 = CFrame.new(-2719.214111328125, 27.311086654663086+40, -9888.3720703125)
				elseif Lv >= 1450 or SelectMonster == "Water Fighter" then -- Water Fighter
					Ms = "Water Fighter"
					NameQuest = "ForgottenQuest"
					QuestLv = 2
					NameMon = "Water Fighter"
					CFrameQ = CFrame.new(-3054.44458, 235.544281+2, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
					CFrameMon1 = CFrame.new(-3262.7578125, 299.0077209472656+40, -10550.1865234375)
					CFrameMon2 = CFrame.new(-3262.7578125, 299.0077209472656+40, -10550.1865234375)
					SelectMonster = "Sea Soldier"
					if Lv >= 1475 then
						_G.SelectBoss = "Tide Keeper"
					end
				end
			end
			if W3 and not Auto_Raid then
				if Lv >= 1500 and Lv <= 1524 or SelectMonster == "Pirate Millionaire" then -- Pirate Millionaire
					Ms = "Pirate Millionaire"
					NameQuest = "PiratePortQuest"
					QuestLv = 1
					NameMon = "Pirate Millionaire"
					CFrameQ = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
					CFrameMon1 = CFrame.new(-576.0054321289062, 44.15378952026367+40, 5522.3916015625)
					CFrameMon2 = CFrame.new(-16.6833553314209, 44.17319869995117+40, 5687.955078125)
				elseif Lv >= 1525 and Lv <= 1574 or SelectMonster == "Pistol Billionaire" then -- Pistol Billionaire
					Ms = "Pistol Billionaire"
					NameQuest = "PiratePortQuest"
					QuestLv = 2
					NameMon = "Pistol Billionaire"
					CFrameQ = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
					CFrameMon1 = CFrame.new(-26.945453643798828, 74.1731948852539+40, 6023.16357421875)
					CFrameMon2 = CFrame.new(-957.3159790039062, 74.07316589355469+40, 5792.234375)
					SelectMonster = "Pirate Millionaire"
				elseif Lv >= 1575 and Lv <= 1599 or SelectMonster == "Dragon Crew Warrior" then -- Dragon Crew Warrior
					Ms = "Dragon Crew Warrior"
					NameQuest = "AmazonQuest"
					QuestLv = 1
					NameMon = "Dragon Crew Warrior"
					CFrameQ = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
					CFrameMon1 = CFrame.new(4122.46337890625, 51.825111389160156+40, -1215.4949951171875)
					CFrameMon2 = CFrame.new(6359.28173828125, 51.83952331542969+40, -1147.912109375)
				elseif Lv >= 1600 and Lv <= 1624 or SelectMonster == "Dragon Crew Archer" then -- Dragon Crew Archer
					Ms = "Dragon Crew Archer"
					NameQuest = "AmazonQuest"
					QuestLv = 2
					NameMon = "Dragon Crew Archer"
					CFrameQ = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
					CFrameMon1 = CFrame.new(6605.27001953125, 378.7401428222656+40, 226.1666259765625)
					CFrameMon2 = CFrame.new(6605.27001953125, 378.7401428222656+40, 226.1666259765625)
					SelectMonster = "Dragon Crew Warrior"
				elseif Lv >= 1625 and Lv <= 1649 or SelectMonster == "Female Islander" then -- Female Islander
					Ms = "Female Islander"
					NameQuest = "AmazonQuest2"
					QuestLv = 1
					NameMon = "Female Islander"
					CFrameQ = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					CFrameMon1 = CFrame.new(5699.82958984375, 782.1347045898438+40, 890.8811645507812)
					CFrameMon2 = CFrame.new(4722.9208984375, 730.677001953125+40, 762.819091796875)
				elseif Lv >= 1650 and Lv <= 1699 or SelectMonster == "Giant Islander" then -- Giant Islander
					Ms = "Giant Islander"
					NameQuest = "AmazonQuest2"
					QuestLv = 2
					NameMon = "Giant Islander"
					CFrameQ = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					CFrameMon1 = CFrame.new(5289.60009765625, 602.956787109375+40, -266.7723388671875)
					CFrameMon2 = CFrame.new(4759.08935546875, 601.8688354492188+40, -2.0767855644226074)
					SelectMonster = "Female Islander"
				elseif Lv >= 1700 and Lv <= 1724 or SelectMonster == "Marine Commodore" then -- Marine Commodore
					Ms = "Marine Commodore"
					NameQuest = "MarineTreeIsland"
					QuestLv = 1
					NameMon = "Marine Commodore"
					CFrameQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
					CFrameMon1 = CFrame.new(2237.99609375, 73.4764175415039+40, -7136.83544921875)
					CFrameMon2 = CFrame.new(2922.25927734375, 73.46479034423828+40, -7798.26123046875)
				elseif Lv >= 1725 and Lv <= 1774 or SelectMonster == "Marine Rear Admiral" then -- Marine Rear Admiral
					Ms = "Marine Rear Admiral"
					NameQuest = "MarineTreeIsland"
					QuestLv = 2
					NameMon = "Marine Rear Admiral"
					CFrameQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
					CFrameMon1 = CFrame.new(3689.90673828125, 160.86729431152344+40, -6985.40771484375)
					CFrameMon2 = CFrame.new(3187.75, 73.44898986816406+40, -6706.0419921875)
					SelectMonster = "Marine Commodore"
				elseif Lv >= 1775 and Lv <= 1799 or SelectMonster == "Fishman Raider" then -- Fishman Raider
					Ms = "Fishman Raider"
					NameQuest = "DeepForestIsland3"
					QuestLv = 1
					NameMon = "Fishman Raider"
					CFrameQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
					CFrameMon1 = CFrame.new(-10891.02734375, 332.1058654785156+40, -8601.8642578125)
					CFrameMon2 = CFrame.new(-10163.5458984375, 332.1058654785156+40, -8302.7314453125)
				elseif Lv >= 1800 and Lv <= 1824 or SelectMonster == "Fishman Captain" then -- Fishman Captain
					Ms = "Fishman Captain"
					NameQuest = "DeepForestIsland3"
					QuestLv = 2
					NameMon = "Fishman Captain"
					CFrameQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
					CFrameMon1 = CFrame.new(-10891.02734375, 332.1058654785156+40, -8601.8642578125)
					CFrameMon2 = CFrame.new(-10989.2294921875, 332.0664367675781+40, -9223.7431640625)
					SelectMonster = "Fishman Raider"
				elseif Lv >= 1825 and Lv <= 1849 or SelectMonster == "Forest Pirate" then -- Forest Pirate
					Ms = "Forest Pirate"
					NameQuest = "DeepForestIsland"
					QuestLv = 1
					NameMon = "Forest Pirate"
					CFrameQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
					CFrameMon1 = CFrame.new(-13374.619140625, 332.72137451171875+40, -7821.02587890625)
					CFrameMon2 = CFrame.new(-13374.619140625, 332.72137451171875+40, -7821.02587890625)
				elseif Lv >= 1850 and Lv <= 1899 or SelectMonster == "Mythological Pirate" then -- Mythological Pirate
					Ms = "Mythological Pirate"
					NameQuest = "DeepForestIsland"
					QuestLv = 2
					NameMon = "Mythological Pirate"
					CFrameQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
					CFrameMon1 = CFrame.new(-13687.0400390625, 470.1310729980469+40, -7049.77099609375)
					CFrameMon2 = CFrame.new(-13234.8408203125, 520.3682250976562+40, -6810.8486328125)
					SelectMonster = "Forest Pirate"
				elseif Lv >= 1900 and Lv <= 1924 or SelectMonster == "Jungle Pirate" then -- Jungle Pirate
					Ms = "Jungle Pirate"
					NameQuest = "DeepForestIsland2"
					QuestLv = 1
					NameMon = "Jungle Pirate"
					CFrameQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
					CFrameMon1 = CFrame.new(-12393.16015625, 332.0458068847656+40, -10533.5078125)
					CFrameMon2 = CFrame.new(-11614.9677734375, 332.0664367675781+40, -10604.9541015625)
				elseif Lv >= 1925 and Lv <= 1974 or SelectMonster == "Musketeer Pirate" then -- Musketeer Pirate
					Ms = "Musketeer Pirate"
					NameQuest = "DeepForestIsland2"
					QuestLv = 2
					NameMon = "Musketeer Pirate"
					CFrameQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
					CFrameMon1 = CFrame.new(-13306.2763671875, 391.8888854980469+40, -9778.9462890625)
					CFrameMon2 = CFrame.new(-13306.2763671875, 391.8888854980469+40, -9778.9462890625)
					SelectMonster = "Jungle Pirate"
				elseif Lv >= 1975 and Lv <= 1999 or SelectMonster == "Reborn Skeleton" then
					Ms = "Reborn Skeleton"
					NameQuest = "HauntedQuest1"
					QuestLv = 1
					NameMon = "Reborn Skeleton"
					CFrameQ = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
					CFrameMon1 = CFrame.new(-8757.08203125, 142.44805908203125+40, 5998.8115234375)
					CFrameMon2 = CFrame.new(-8757.08203125, 142.44805908203125+40, 5998.8115234375)
				elseif Lv >= 2000 and Lv <= 2024 or SelectMonster == "Living Zombie" then
					Ms = "Living Zombie"
					NameQuest = "HauntedQuest1"
					QuestLv = 2
					NameMon = "Living Zombie"
					CFrameQ = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
					CFrameMon1 = CFrame.new(-10177.2080078125, 138.96990966796875+40, 5962.80810546875)
					CFrameMon2 = CFrame.new(-10177.2080078125, 138.96990966796875+40, 5962.80810546875)
					SelectMonster = "Reborn Skeleton"
				elseif Lv >= 2025 and Lv <= 2049  or  SelectMonster == "Demonic Soul" then
					Ms = "Demonic Soul"
					NameQuest = "HauntedQuest2"
					QuestLv = 1
					NameMon = "Demonic"
					CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
					CFrameMon1 = CFrame.new(-9345.9853515625, 172.44805908203125+40, 6114.5869140625)
					CFrameMon2 = CFrame.new(-9651.02734375, 172.44805908203125+40, 6140.39013671875)
					SelectMonster = "Living Zombie"
				elseif Lv >= 2050 and Lv <= 2074 or SelectMonster == "Posessed Mummy" then
					Ms = "Posessed Mummy"
					NameQuest = "HauntedQuest2"
					QuestLv = 2
					NameMon = "Posessed Mummy"
					CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
					CFrameMon1 = CFrame.new(-9588.80859375, 6.1357741355896+40, 6224.79736328125)
					CFrameMon2 = CFrame.new(-9588.80859375, 6.1357741355896+40, 6224.79736328125)
					SelectMonster = "Demonic Soul"
				elseif Lv >= 2075 and Lv <= 2099 or SelectMonster == "Peanut Scout" then
					Ms = "Peanut Scout"
					NameQuest = "NutsIslandQuest"
					QuestLv = 1
					NameMon = "Peanut Scout"
					CFrameQ = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
					CFrameMon1 = CFrame.new(-2162.263427734375, 10.01976490020752+40, -9914.6123046875)
					CFrameMon2 = CFrame.new(-2238.88916015625, 38.447364807128906+40, -10204.1162109375)
				elseif Lv >= 2100 and Lv <= 2124 or SelectMonster == "Peanut President" then
					Ms = "Peanut President"
					NameQuest = "NutsIslandQuest"
					QuestLv = 2
					NameMon = "Peanut President"
					CFrameQ = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
					CFrameMon1 = CFrame.new(-2328.32177734375, 88.6362533569336+40, -10488.361328125)
					CFrameMon2 = CFrame.new(-1973.103271484375, 38.44700241088867+40, -10588.1220703125)
					SelectMonster = "Peanut Scout"
				elseif Lv >= 2125 and Lv <= 2149 or SelectMonster == "Ice Cream Chef" then
					Ms = "Ice Cream Chef"
					NameQuest = "IceCreamIslandQuest"
					QuestLv = 1
					NameMon = "Ice Cream Chef"
					CFrameQ = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08, -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
					CFrameMon1 = CFrame.new(-738.9281616210938, 66.16273498535156+40, -10826.16015625)
					CFrameMon2 = CFrame.new(-973.827880859375, 66.16275787353516+40, -11042.2763671875)
				elseif Lv >= 2150 and Lv <= 2199 or SelectMonster == "Ice Cream Commander" then 
					Ms = "Ice Cream Commander"
					NameQuest = "IceCreamIslandQuest"
					QuestLv = 2
					NameMon = "Ice Cream Commander"
					CFrameQ = CFrame.new(-819.376526, 67.4634171, -10967.2832)
					CFrameMon1 = CFrame.new(-545.2809448242188, 66.16280364990234+40, -11276.6630859375)
					CFrameMon2 = CFrame.new(-545.2809448242188, 66.16280364990234+40, -11276.6630859375)
					SelectMonster = "Ice Cream Chef"
				elseif Lv >= 2200 and Lv <= 2224 or SelectMonster == "Cookie Crafter" then 
					Ms = "Cookie Crafter"
					NameQuest = "CakeQuest1"
					QuestLv = 1
					NameMon = "Cookie Crafter"
					CFrameQ = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
					CFrameMon1 = CFrame.new(-2363.0458984375, 38.14151382446289+40, -12085.080078125)
					CFrameMon2 = CFrame.new(-2363.0458984375, 38.14151382446289+40, -12085.080078125)
				elseif Lv >= 2225 and Lv <= 2249 or SelectMonster == "Cake Guard" then 
					Ms = "Cake Guard"
					NameQuest = "CakeQuest1"
					QuestLv = 2
					NameMon = "Cake Guard"
					CFrameQ = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
					CFrameMon1 = CFrame.new(-1628.802734375, 38.14137649536133+40, -12244.82421875)
					CFrameMon2 = CFrame.new(-1628.802734375, 38.14137649536133+40, -12244.82421875)
					SelectMonster = "Cookie Crafter"
				elseif Lv >= 2250 and Lv <= 2299 or SelectMonster == "Baking Staff" then 
					Ms = "Baking Staff"
					NameQuest = "CakeQuest2"
					QuestLv = 1
					NameMon = "Baking Staff"
					CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626)
					CFrameMon1 = CFrame.new(-1855.962158203125, 38.14141845703125+40, -12938.662109375)
					CFrameMon2 = CFrame.new(-1855.962158203125, 38.14141845703125+40, -12938.662109375)
				elseif Lv >= 2300 and Lv <= 2324 or SelectMonster == "Cocoa Warrior" then
					Ms = "Cocoa Warrior"
					NameQuest = "ChocQuest1"
					QuestLv = 1
					NameMon = "Cocoa Warrior"
					CFrameQ = CFrame.new(231.68377685546875, 25.077497482299805, -12196.4892578125)
					CFrameMon1 = CFrame.new(-5.802433967590332, 25.07757568359375+40, -12227.48046875)
					CFrameMon2 = CFrame.new(-5.802433967590332, 25.07757568359375+40, -12227.48046875)
				elseif Lv >= 2325 and Lv <= 2349 or SelectMonster == "Chocolate Bar Battler" then
					Ms = "Chocolate Bar Battler"
					NameQuest = "ChocQuest1"
					QuestLv = 2
					NameMon = "Chocolate Bar Battler"
					CFrameQ = CFrame.new(231.68377685546875, 25.077497482299805, -12196.4892578125)
					CFrameMon1 = CFrame.new(645.8377685546875, 25.07749366760254+40, -12564.7314453125)
					CFrameMon2 = CFrame.new(645.8377685546875, 25.07749366760254+40, -12564.7314453125)
					SelectMonster = "Cocoa Warrior"
				elseif Lv >= 2350 and Lv <= 2374 or SelectMonster == "Sweet Thief" then
					Ms = "Sweet Thief"
					NameQuest = "ChocQuest2"
					QuestLv = 1
					NameMon = "Sweet Thief"
					CFrameQ = CFrame.new(148.7130584716797, 25.137081146240234, -12774.9052734375)
					CFrameMon1 = CFrame.new(-6.051190376281738, 25.137189865112305+40, -12639.328125)
					CFrameMon2 = CFrame.new(-6.051190376281738, 25.137189865112305+40, -12639.328125)
					SelectMonster = "Chocolate Bar Battler"
				elseif Lv >= 2375 and Lv <= 2399 or SelectMonster == "Candy Rebel" then
					Ms = "Candy Rebel"
					NameQuest = "ChocQuest2"
					QuestLv = 2
					NameMon = "Candy Rebel"
					CFrameQ = CFrame.new(148.7130584716797, 25.137081146240234, -12774.9052734375)
					CFrameMon1 = CFrame.new(70.85488891601562, 25.137083053588867+40, -12941.6953125)
					CFrameMon2 = CFrame.new(70.85488891601562, 25.137083053588867+40, -12941.6953125)
					SelectMonster = "Sweet Thief"
				elseif Lv >= 2400 and Lv <= 2424 or SelectMonster == "Candy Pirate" then
					Ms = "Candy Pirate"
					NameQuest = "CandyQuest1"
					QuestLv = 1
					NameMon = "Candy Pirate"
					CFrameQ = CFrame.new(-1147.0028076171875, 14.450505256652832, -14445.3818359375)
					CFrameMon1 = CFrame.new(-835.9078369140625, 15.250882148742676+40, -14341.662109375)
					CFrameMon2 = CFrame.new(-877.6673583984375, 15.250885009765625+40, -14718.1220703125)
				elseif Lv >= 2425 and Lv <= 2449 or SelectMonster == "Snow Demon" then
					Ms = "Snow Demon"
					NameQuest = "CandyQuest1"
					QuestLv = 2
					NameMon = "Snow Demon"
					CFrameQ = CFrame.new(-1147.0028076171875, 14.450505256652832, -14445.3818359375)
					CFrameMon1 = CFrame.new(-1321.15283203125, 15.25088882446289+40, -14695.9296875    )
					CFrameMon2 = CFrame.new(-1360.9024658203125, 15.250880241394043+40, -14417.591796875)
					SelectMonster = "Candy Pirate"
				elseif Lv >= 2450 and Lv <= 2474 or SelectMonster == "Isle Outlaw" then
					Ms = "Isle Outlaw"
					NameQuest = "TikiQuest1"
					QuestLv = 1
					NameMon = "Isle Outlaw"
					CFrameQ = CFrame.new(-16546.9648, 56.0038109, -172.849228)
					CFrameMon1 = CFrame.new(-16202.9306640625, 22.104894638061523+40, -182.80340576171875)
					CFrameMon2 = CFrame.new(-16434.986328125, 56.10488510131836+40, -246.68043518066406)
				elseif Lv >= 2475 and Lv <= 2499 or SelectMonster == "Island Boy" then
					Ms = "Island Boy"
					NameQuest = "TikiQuest1"
					QuestLv = 2
					NameMon = "Island Boy"
					CFrameQ = CFrame.new(-16546.9648, 56.0038109, -172.849228)
					CFrameMon1 = CFrame.new(-16681.05078125, 56.104888916015625+40, -197.9258270263672)
					CFrameMon2 = CFrame.new(-16929.6875, 12.003792762756348+40, -134.66799926757812)
					SelectMonster = "Isle Outlaw"
				elseif Lv >= 2500 and Lv <= 2524 or SelectMonster == "Sun-kissed Warrior" then
					Ms = "Sun-kissed Warrior"
					NameQuest = "TikiQuest2"
					QuestLv = 1
					NameMon = "Warrior"
					CFrameQ = CFrame.new(-16538.8477, 56.0037842, 1051.00537)
					CFrameMon1 = CFrame.new(-16379.8330078125, 56.0037841796875+40, 1104.0086669921875)
					CFrameMon2 = CFrame.new(-16134.640625, 12.003792762756348+40, 1003.3228759765625)
				elseif Lv >= 2525 or SelectMonster == "Isle Champion" then
					Ms = "Isle Champion"
					NameQuest = "TikiQuest2"
					QuestLv = 2
					NameMon = "Isle Champion"
					CFrameQ = CFrame.new(-16538.8477, 56.0037842, 1051.00537)
					CFrameMon1 = CFrame.new(-16637.748046875, 56.10488510131836+40, 1090.5440673828125)
					CFrameMon2 = CFrame.new(-16861.009765625, 22.104894638061523+40, 1029.9649658203125)
					SelectMonster = "Sun-kissed Warrior"
				end
			end
		end --Fix not Complete
function Warp(p)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
end
function TP(p)
    if W3 then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-12476.080078125, 374.9144592285156, -7566.93701171875)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12476.080078125, 374.9144592285156, -7566.93701171875)) --Big Mansion
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(5742.9169921875, 610.7672729492188, -268.2395935058594)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5742.9169921875, 610.7672729492188, -268.2395935058594)) --Hydra Island
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-5076.99853515625, 314.8587341308594, -3151.824951171875)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5076.99853515625, 314.8587341308594, -3151.824951171875)) --Castle on the Sea
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-11993.580078125, 331.8077087402344, -8844.1826171875)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-11993.580078125, 331.8077087402344, -8844.1826171875)) --Canvender T
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(5314.58203125, 22.53643226623535, -125.94227600097656)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.58203125, 22.53643226623535, -125.94227600097656)) --Canvender H
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, 60, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
        elseif (Vector3.new(-1990.672607421875, 4532.998046875, -14973.6748046875)-p.Position).Magnitude < 1500 and (Vector3.new(-1990.672607421875, 4532.998046875, -14973.6748046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then --Cake Prince
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2149.209228515625, 80.00882720947266, -12402.974609375)
        elseif (Vector3.new(28609.388671875, 14896.8505859375, 105.2657241821289)-p.Position).Magnitude > 1500 and (Vector3.new(28609.388671875, 14896.8505859375, 105.2657241821289)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 then --temple
            TP(CFrame.new(28609.388671875, 14896.8505859375, 105.2657241821289))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Check")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","TeleportBack")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetLastSpawnPoint","GreatTree")
        end
    elseif W2 then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(923.2125244140625, 125.40035247802734, 32852.83203125)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.2125244140625, 125.40035247802734, 32852.83203125)) --Ghost Ship
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-286.6488037109375, 306.130615234375, 596.5967407226562)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-286.6488037109375, 306.130615234375, 596.5967407226562)) --ManSion
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(2283.7080078125, 15.277364730834961, 905.8712158203125)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2283.7080078125, 15.277364730834961, 905.8712158203125)) --Sawn
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062)) --Out Ghost Ship
        end
    elseif W1 then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(3864.6884765625, 5.716391563415527, -1926.214111328125)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 5.716391563415527, -1926.214111328125)) --Gate
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(61163.8515625, 5.650546073913574, 1819.7841796875)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.650546073913574, 1819.7841796875)) --Under Water
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)) --Sky2
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-4607.82275, 872.54248, -1667.55688)-p.Position).Magnitude then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688)) --Sky1
        end
    end
        local Distance = (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 200 then
            Speed = 999999999999999999999999999999999
		else
			Speed = 300
        end
    	game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = p}):Play()
    	--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, p.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
end

function StopTween()
    TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end

function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait()
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end

spawn(function()
    while wait(.2) do
        pcall(function()
            local posce = math.random(1, 5)
            if posce == 1 then
                Cethod = CFrame.new(40,0,0)
            elseif posce == 2 then
                Cethod = CFrame.new(0,40,0)
            elseif posce == 3 then
                Cethod = CFrame.new(0,0,40)
            elseif posce == 4 then
                Cethod = CFrame.new(-40,0,0)
            elseif posce == 5 then
                Cethod = CFrame.new(0,0,-40)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Clip or Startk then
                game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
                else
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    StopTween()
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end
end)
spawn(function()
	while wait(.5) do
		pcall(function()
		    if Weapona == "Melee" then
                Weapon = "Melee"
            elseif Weapona == "Sword" then
                Weapon = "Sword"
            elseif Weapona == "Gun" then
                Weapon = "Gun"
            elseif Weapona == "Blox Fruit" then
                Weapon = "Blox Fruit"
            else
                Weapona = "Melee"
            end
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					if v.ToolTip == Weapona then
						Weapon = v.Name
					end
				end
			end
		end)
	end
end)

function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(l,"Technology",2)
    sethiddenproperty(t,"Decoration",false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
    for i,x in pairs(game.Workspace:GetDescendants()) do
		if x.Name == "Lava" then   
			x:Destroy()
		end
    end
end
spawn(function()
	while wait(2) do
		pcall(function()
		    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				else
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
			end
		end)
	end
end)
spawn(function()
    while game:GetService("RunService").Stepped:wait() do
		pcall(function()
            for i, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end)
    end
end)

local plr = game.Players.LocalPlayer
local CbFw = getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end

spawn(function()
    while wait() do
        pcall(function()
            if OpenPVP then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
        end)
    end
end)

function AttackNoCD()
    if not Auto_Farm_Bounty and not Auto_Farm_Fruit or Mix_Farm then
        if game:GetService("Workspace").Characters[game:GetService("Players").LocalPlayer.Name].Stun.Value == 0 then
            if not Auto_Raid then
                local AC = CbFw2.activeController
                for i = 1, 1 do
                    local bladehit =
                        require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                        plr.Character,
                        {plr.Character.HumanoidRootPart},
                        60
                    )
                    local cac = {}
                    local hash = {}
                    for k, v in pairs(bladehit) do
                        if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                            table.insert(cac, v.Parent.HumanoidRootPart)
                            hash[v.Parent] = true
                        end
                    end
                    bladehit = cac
                    if #bladehit > 0 then
                        local u8 = debug.getupvalue(AC.attack, 5)
                        local u9 = debug.getupvalue(AC.attack, 6)
                        local u7 = debug.getupvalue(AC.attack, 4)
                        local u10 = debug.getupvalue(AC.attack, 7)
                        local u12 = (u8 * 798405 + u7 * 727595) % u9
                        local u13 = u7 * 798405
                        (function()
                            u12 = (u12 * u9 + u13) % 1099511627776
                            u8 = math.floor(u12 / u9)
                            u7 = u12 - u8 * u9
                        end)()
                        u10 = u10 + 1
                        debug.setupvalue(AC.attack, 5, u8)
                        debug.setupvalue(AC.attack, 6, u9)
                        debug.setupvalue(AC.attack, 4, u7)
                        debug.setupvalue(AC.attack, 7, u10)
                        task.wait()
                        pcall(function()
                            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                                AC.animator.anims.basic[3]:Play(0.01,0.01,0.01)
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215),u10)
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit",bladehit,i,"")
                            end
                        end)
                    end
                end
            end
        end
    end
end
spawn(function()
	while wait() do
		pcall(function()
			if StatrMagnet then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position-_G.PosMon.Position).Magnitude <= 350 then
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						v.Humanoid:ChangeState(11)
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.CFrame = _G.PosMon
						sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius",  math.huge)
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  9e20)
					end
				end
			end
		end)
	end
end)
game:GetService("RunService").Heartbeat:Connect(function()
    if game:GetService("Players").LocalPlayer.Data.Points.Value > 0 then
        if game.Players.localPlayer.Data.Stats.Melee.Level.Value < 2550 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 9999999)
        elseif game.Players.localPlayer.Data.Stats.Defense.Level.Value < 2500 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 9999999)
        end
    end
end)
function UseCode(Text)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end

--[[_G.Setting = {
    
    Config = {
        ["FPS Boost"] = false
    }
    
}
if _G.Setting.Config["FPS Boost"] then
    FPSBooster()
end]]--

Startk = true
function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(l,"Technology",2)
    sethiddenproperty(t,"Decoration",false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end
FPSBooster()

Fruitlist = {
    "Rocket-Rocket",
    "Spin-Spin",
    "Chop-Chop",
    "Spring-Spring",
    "Bomb-Bomb",
    "Smoke-Smoke",
    "Spike-Spike",
    "Flame-Flame",
    "Falcon-Falcon",
    "Ice-Ice",
    "Sand-Sand",
    "Dark-Dark",
    "Diamond-Diamond",
    "Light-Light",
    "Rubber-Rubber",
    "Barrier-Barrier",
    "Ghost-Ghost",
    "Magma-Magma",
    "Quake-Quake",
    "Buddha-Buddha",
    "Love-Love",
    "Spider-Spider",
    "Sound-Sound",
    "Phoenix-Phoenix",
    "Portal-Portal",
    "Rumble-Rumble",
    "Pain-Pain",
    "Blizzard-Blizzard",
    "Gravity-Gravity",
    "Mammoth-Mammoth",
    "T-Rex",
    "Dough-Dough",
    "Shadow-Shadow",
    "Venom-Venom",
    "Control-Control",
    "Spirit-Spirit",
    "Dragon-Dragon",
    "Leopard-Leopard",
    "Kitsune-Kitsune"
}
spawn(function()
    while wait() do
        if LockFruit then
            for i,v in pairs(SelectFruitLock) do
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",v)
			end
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if Startk then
                UseCode("NOOB_REFUND")
                UseCode("SUB2GAMERROBOT_RESET1")
                UseCode("kittgaming")
                UseCode("Sub2Fer999")
                UseCode("Enyu_is_Pro")
                UseCode("Magicbus")
                UseCode("JCWK")
                UseCode("Starcodeheo")
                UseCode("Bluxxy")
                UseCode("fudd10_v2")
                UseCode("FUDD10")
                UseCode("BIGNEWS")
                UseCode("THEGREATACE")
                UseCode("SUB2GAMERROBOT_EXP1")
                UseCode("Sub2OfficialNoobie")
                UseCode("StrawHatMaine")
                UseCode("SUB2NOOBMASTER123")
                UseCode("Sub2Daigrock")
                UseCode("Sub2UncleKizaru")
                UseCode("Axiore")
                UseCode("TantaiGaming")
                UseCode("15B_BESTBROTHERS")
                UseCode("Sub2CaptainMaui")
                UseCode("DEVSCOOKING")
            end
        end)
    end
end)
spawn(function()
	while task.wait() do
		pcall(function()
			game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
		end)
	end
end)
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
spawn(function()
   while wait(1) do
    if Skywaitw == 1 then
        Skywaitw = 2
        Skywait = CFrame.new(-4714.62744140625, 883.1715087890625, -1938.22705078125)
    else
        Skywaitw = 1
        Skywait = CFrame.new(-7687.64501953125, 5601.17236328125, -441.61865234375)
       end
   end
end)
function DropFruit()
	pcall(function()
		game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Position = UDim2.new(10.100, 0, 0.100, 0) -- HideUi
		game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
		local invenfruit = game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Container.Stored.ScrollingFrame.Frame
		wait(.3)
		for i,v in pairs(invenfruit:GetChildren()) do
			if string.find(v.Name,"-") then
				for _,Backpack in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
					FruitStoreF = string.split(Backpack.Name, " ")[1]
					FruitStoreR = FruitStoreF.."-"..FruitStoreF
					if v.Name == FruitStoreR then
						game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Backpack.Name):Destroy()
					end												
				end
			end
		end
		for i,v in pairs(invenfruit:GetChildren()) do
			if string.find(v.Name,"-") then
				for _,Character in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
					FruitStoreF = string.split(Character.Name, " ")[1]
					FruitStoreR = FruitStoreF.."-"..FruitStoreF
					if v.Name == FruitStoreR then
						game:GetService("Players").LocalPlayer.Character:FindFirstChild(Character.Name):Destroy()
					end												
				end
			end
		end
	end)
end
spawn(function()
	while wait() do
		pcall(function()
			DropFruit()
			wait()
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rocket Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rocket-Rocket",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rocket Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Falcon-Falcon",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ghost Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ghost-Ghost",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ghost Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Portal-Portal",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Buddha-Buddha",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spider-Spider",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Phoenix-Phoenix",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Pain-Pain",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Leopard-Leopard",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spirit-Spirit",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("T-Rex Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("T-Rex Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","T-Rex-T-Rex",game:GetService("Players").LocalPlayer.Character:FindFirstChild("T-Rex Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("T-Rex Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kitsune Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kitsune Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Kitsune-Kitsune",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kitsune Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kitsune Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sound Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sound Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sound-Sound",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sound Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sound Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Blizzard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Blizzard Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Blizzard-Blizzard",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Blizzard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Blizzard Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mammoth Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mammoth Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Mammoth-Mammoth",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mammoth Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mammoth Fruit"))
			end
		end)
	end
end)
spawn(function()
    while wait() do
        pcall(function()
            if (CFrameMon1.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon2
            elseif (CFrameMon2.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon1
            end
        end)
    end
end)
HaveSharkman = false
HaveSuperhuman = false
function TP_World1()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end
function TP_World2()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")	
end
function TP_World3()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
function KillHuntQuest()
    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
end
local SkyMosterCheck = {"God's Guard","Shanda"}
local PoleMosterCheck = {"Thunder God"}
local SaberMosterCheck = {"Saber Expert"}
local BossQuestCheck = {"Ice Admiral"}
local BossWorld2Check = {"Cursed Captain","Tide Keeper","Darkbeard","Awakened Ice Admiral"}
local CoreCheck = {"Core"}
local FindBartilo1 = {"Swan Pirate"}
local FindBartilo2 = {"Jeremy"}
local FindIndraWorld3Quest = {"rip_indra"}

function NPCPos()
    for i,v in pairs(require(game:GetService("ReplicatedStorage").GuideModule)["Data"]["NPCList"]) do
		if v["NPCName"] == require(game:GetService("ReplicatedStorage").GuideModule)["Data"]["LastClosestNPC"] then
			return i["CFrame"]
		end
	end
end
function CheckQuest()
    local Lvl = game:GetService("Players").LocalPlayer.Data.Level.Value
    local IgnoreQuests = {"BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest"}
    local Quest = {}
    local LevelReq = 0
    for i,v in pairs(require(game:GetService("ReplicatedStorage").Quests)) do
		for a,b in pairs(v) do
		    for j, k in pairs(b["Task"]) do
		    	if b["LevelReq"] <= Lvl and b["LevelReq"] >= LevelReq and not table.find(IgnoreQuests, i) and k > 1 then		            
			    	Quest["QuestName"] = i
			        Quest["ID"] = a
			        Quest["MobName"] = j
                    LevelReq = b["LevelReq"]
		        end
			end	
		end
	end
	if LevelReq >= 700 and W1 then
        Quest["MobName"] = "Galley Captain"
        Quest["QuestName"] = "FountainQuest"
        Quest["ID"] = 2
    elseif LevelReq >= 1450 and W2 then
        Quest["MobName"] = "Water Fighter"
        Quest["QuestName"] = "ForgottenQuest"
        Quest["ID"] = 2
    end
	return Quest
end
function GetQuest()
	CheckLevel()
    local questname = CheckQuest()["QuestName"]
    local id = CheckQuest()["ID"]
    if (NPCPos().Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
        wait(.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
    else
		_G.Doing = "Get Quest Level"
        TP(NPCPos())
    end
end

function FindSkyMonster()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(SkyMosterCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(SkyMosterCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmSkyMonter()
	_G.Doing = "Farm Sky Monster"
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    if FindSkyMonster() then
        v = FindSkyMonster()
        StatrMagnet = true
        _G.PosMon = v.HumanoidRootPart.CFrame
    	repeat wait()
    	    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    		EquipWeapon(Weapon)
    		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
		        Warp(v.HumanoidRootPart.CFrame * Cethod)
		    else
    		    TP(v.HumanoidRootPart.CFrame)
    		end
    		AttackNoCD()
    	until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
    	
        StatrMagnet = false
    else
        TP(Skywait)
    end
end
function FarmLevelOO()
    pcall(function()
    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
		if _G.Farm_Boss then
			_G.SelectBoss = nil
			_G.Farm_Boss = nil
			SelectMonster = nil
			_G.Farm_Mon = nil
		end
		if _G.SelectBoss ~= nil and game.Workspace.Enemies:FindFirstChild(_G.SelectBoss) or _G.SelectBoss ~= nil and game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
			CheckQuestBoss()
			repeat wait()
				_G.Doing = "Get Quest Boss"
				TP(CFrameQBoss)
			until (CFrameQBoss.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
			if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
    			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss)
    			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    		end
			_G.Farm_Boss = true
		elseif SelectMonster ~= nil then
			CheckLevel()
			GetQuest()
			SelectMonster = nil
			_G.Farm_Mon = nil
		else
			StatrMagnet = nil
			CheckLevel()
			GetQuest()
		end
    elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
		if _G.Farm_Boss then
			if game.Workspace.Enemies:FindFirstChild(_G.SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name == _G.SelectBoss and v.Humanoid.Health > 0 then
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						v.Humanoid:ChangeState(11)
						v.Humanoid.JumpPower = 0
						v.Humanoid.WalkSpeed = 0
						v.HumanoidRootPart.CanCollide = false
						StatrMagnet = nil
						repeat wait()
							_G.Doing = "Farm Boss Level"
						    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
							EquipWeapon(Weapon)
                    		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                		        Warp(v.HumanoidRootPart.CFrame * Cethod)
                		    else
                    		    TP(v.HumanoidRootPart.CFrame)
                    		end
							AttackNoCD()
						until game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) or not v.Parent or v.Humanoid.Health <= 0 or not Startk or Mix_Farm
						
						if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
							--game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
					end
				end
			else
				TP(CFrameBoss*CFrame.new(0,40,0))
			end
		else
		    if game.Workspace.Enemies:FindFirstChild(Ms) then
    			for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    				if v.Name == Ms and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    					_G.PosMon = v.HumanoidRootPart.CFrame
    					StatrMagnet = true
    					if v.Humanoid:FindFirstChild("Animator") then
    						v.Humanoid.Animator:Destroy()
    					end
    					v.Humanoid:ChangeState(11)
    					v.Humanoid.JumpPower = 0
    					v.Humanoid.WalkSpeed = 0
    					v.HumanoidRootPart.CanCollide = false
    					repeat wait()
							_G.Doing = "Farm Level"
    					    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    						EquipWeapon(Weapon)
                    		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                		        Warp(v.HumanoidRootPart.CFrame * Cethod)
                		    else
                    		    TP(v.HumanoidRootPart.CFrame)
                    		end
    						AttackNoCD()
    					until game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or not v.Parent or v.Humanoid.Health <= 0 or not Startk or Mix_Farm
    					Attack = nil
    				end
    			end
    			else
					CheckLevel()
					_G.Doing = "Wait Monster Level"
                    TP(CFrameMon)
			end
		end
	end
    end)
end
function FindPole()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(PoleMosterCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(PoleMosterCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmPole()
	_G.Doing = "Farm Pole"
    if FindPole() then
        v = FindPole()
    	repeat wait()
    	    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    		EquipWeapon(Weapon)
    		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
		        Warp(v.HumanoidRootPart.CFrame * Cethod)
		    else
    		    TP(v.HumanoidRootPart.CFrame)
    		end
    		AttackNoCD()
    	until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
    end
end
function FindFruit()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if string.find(v.Name, "Fruit") then
            return v
        end
    end
end
function CollectFruit()
	_G.Doing = "Bring Fruit"
    if FindFruit() then
        v = FindFruit()
        repeat wait()
        TP(v.Handle.CFrame*CFrame.new(0,1.5,0))
        until wait()
    end
end
function SaberQuest()
	_G.Doing = "Doing Saber Quest"
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                repeat wait(.1)
                    TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                wait(.1)
                repeat wait(.1)
                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame)
                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                wait(.1)
                repeat wait(.1)
                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame)
                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                wait(.1)
                repeat wait(.1)
                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame)
                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                wait(.1)
                repeat wait(.1)
                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame)
                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                wait(.1)
                repeat wait(.1)
                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame)
                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                wait(.1)
		else 
			if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
				if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
					EquipWeapon("Torch")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(1115.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(-1611.1263427734375, 12.177388191223145, 162.85617065429688))                 
				end
				else
				if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
					--task.wait()
					EquipWeapon("Cup")
					--task.wait()
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
					--task.wait()
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 
					else
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
					elseif  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
						if game.Workspace.Enemies:FindFirstChild("Mob Leader") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if v.Name == "Mob Leader" then
									repeat wait()
									    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										EquipWeapon(Weapon)
										if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                            		        Warp(v.HumanoidRootPart.CFrame * Cethod)
                            		    else
                                		    TP(v.HumanoidRootPart.CFrame)
                                		end
										AttackNoCD()
									until v.Humanoid.Health <= 0 or not v.Parent or not Startk 
									repeat
									    
									until task.wait()
									Pole_Farm_Ex = nil
									Mix_Farm = nil
								end
							end
						elseif game.ReplicatedStorage:FindFirstChild("Mob Leader") then
							TP(game.ReplicatedStorage:FindFirstChild("Mob Leader").HumanoidRootPart.CFrame*CFrame.new(0,30,0), Vector3.new(0,0,0))
						end
						elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
						EquipWeapon("Relic")
						repeat
						    TP(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
						until task.wait()
					end
				end
			end
        end
    end
end
function FindSaber()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(SaberMosterCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(SaberMosterCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmSaber()
	_G.Doing = "Get Saber"
    if FindSaber() then
        v = FindSaber()
    	repeat wait()
    	    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    		EquipWeapon(Weapon)
    		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
		        Warp(v.HumanoidRootPart.CFrame * Cethod)
		    else
    		    TP(v.HumanoidRootPart.CFrame)
    		end
    		AttackNoCD()
    	until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
    	
    end
end
function FindBossWold2Quest()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(BossQuestCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(BossQuestCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function DoingQuestWorld2()
	_G.Doing = "Go to World 2"
    if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
        EquipWeapon("Key")
        TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
    else
        if FindBossWold2Quest() then
        v = FindBossWold2Quest()
        	repeat wait()
        	    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
        		EquipWeapon(Weapon)
        		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
    		        Warp(v.HumanoidRootPart.CFrame * Cethod)
    		    else
        		    TP(v.HumanoidRootPart.CFrame)
        		end
        		AttackNoCD()
        	until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
        	TP_World2()
        end
    end
end
function FindBossWorld2()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(BossWorld2Check, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(BossWorld2Check, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmBossWorld2()
	_G.Doing = "Farm Boss"
    if FindBossWorld2() then
        v = FindBossWorld2()
    	repeat wait()
    	    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    		EquipWeapon(Weapon)
    		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
		        Warp(v.HumanoidRootPart.CFrame * Cethod)
		    else
    		    TP(v.HumanoidRootPart.CFrame)
    		end
    		AttackNoCD()
    	until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
    end
end
function FindCore()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(CoreCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(CoreCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmCore()
	_G.Doing = "Farm Factory"
    if FindCore() then
        v = FindCore()
    	repeat wait(.1)
    	    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    		EquipWeapon(Weapon)
		    TP(v.HumanoidRootPart.CFrame)
    		AttackNoCD()
    	until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
    	
    end
end
function FindMonBartilo1()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(FindBartilo1, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(FindBartilo1, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function BartiloQuest1()
	_G.Doing = "Doing Bartilo Quest 1/3"
    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        if FindMonBartilo1() then
            v = FindMonBartilo1()
            StatrMagnet = true
            _G.PosMon = v.HumanoidRootPart.CFrame
            repeat wait()
                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
        		EquipWeapon(Weapon)
        		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
    		        Warp(v.HumanoidRootPart.CFrame * Cethod)
    		    else
        		    TP(v.HumanoidRootPart.CFrame)
        		end
        		AttackNoCD()
        	until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
        	
        else
            TP(CFrame.new(913.2153930664062, 157.4447021484375, 1253.3961181640625))
        end
    else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
    end
end
function FindMonBartilo2()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(FindBartilo2, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(FindBartilo2, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function BartiloQuest2()
	_G.Doing = "Doing Bartilo Quest 2/3"
    if FindMonBartilo2() then
        v = FindMonBartilo2()
        repeat wait()
            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    		EquipWeapon(Weapon)
    		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
		        Warp(v.HumanoidRootPart.CFrame * Cethod)
		    else
    		    TP(v.HumanoidRootPart.CFrame)
    		end
    		AttackNoCD()
    	until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
    	
    end
end
function BartiloQuest3()
	_G.Doing = "Doing Bartilo Quest 3/3"
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
end
function DoingSuperhuman()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman") == 1 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman") == 2 then
	else
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
			if game:GetService("Players").LocalPlayer.Data.Beli.Value > 150000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
			end
			
		end
		
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
		end
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
		end
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
		end
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
		end
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
		end
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
		end
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			local FG = game:GetService("Players").LocalPlayer.Data.Fragments.Value
			if FG >= 1500 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			local FG = game:GetService("Players").LocalPlayer.Data.Fragments.Value
			if FG >= 1500 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
		end
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			local Beli = game:GetService("Players").LocalPlayer.Data.Beli.Value
			if Beli >= 3000000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
			else
			end
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			local Beli = game:GetService("Players").LocalPlayer.Data.Beli.Value
			if Beli >= 3000000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
			else
			end
		end
	end
end
end
end
function FindIsland5()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 5" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function FindIsland4()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 4" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function FindIsland3()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 3" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function FindIsland2()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function FindIsland1()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function Buy_Chip()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", "Flame")
end
function StartDungeon()
	_G.Doing = "Start Raid"
    if W2 then
        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        repeat wait(1)
        until game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true
    elseif W3 then
        fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        repeat wait(1)
        until game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true
    end
end
function Killaura()
    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
		if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
			repeat wait()
				sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
				v.Humanoid.Health = 0
				v.HumanoidRootPart.CanCollide = true
				v.HumanoidRootPart.Size = Vector3.new(5,5,5)
				v.HumanoidRootPart.Transparency = 0.5
			until not Auto_Raid or not v.Parent or v.Humanoid.Health <= 0
		end
	end
end
function NextIsland()
    Killaura()
    if FindIsland5() then
        v = FindIsland5()
		_G.Doing = "Auto Raid | Ialand 5"
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    elseif FindIsland4() then
        v = FindIsland4()
		_G.Doing = "Auto Raid | Ialand 4"
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    elseif FindIsland3() then
        v = FindIsland3()
		_G.Doing = "Auto Raid | Ialand 3"
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    elseif FindIsland2() then
        v = FindIsland2()
		_G.Doing = "Auto Raid | Ialand 2"
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    elseif FindIsland1() then
        v = FindIsland1()
		_G.Doing = "Auto Raid | Ialand 1"
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    end
end
function Get_Fruit_Inventory(price)
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
        if v["Price"] < price then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",v["Name"])
        end
    end
end
function donswanfruit()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
        if v["Price"] > 1000000 and v["Price"] < 2400000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",v["Name"])
        end
    end
end
function FindIndraQuest()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(FindIndraWorld3Quest, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(FindIndraWorld3Quest, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function gotoworld3()
	_G.Doing = "Doing Quest World 3"
    if FindIndraQuest() then
        v = FindIndraQuest()
        repeat wait()
            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    		EquipWeapon(Weapon)
    		if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
		        Warp(v.HumanoidRootPart.CFrame * Cethod)
		    else
    		    TP(v.HumanoidRootPart.CFrame)
    		end
    		AttackNoCD()
        until not Startk or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
	TP_World3()
    end
end
function DoingSharkman()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate") == 1 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate") == 2 then
        else
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") then
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        end
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        end
	end
end
function DoingDeathStep()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep") == 1 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep") == 2 then
        else
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
        end
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
        end
	end
end
function DoingAllMelee()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1 then
        HaveSuperhuman = true
    end
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 1 then
        HaveSharkman = true
    end
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 1 then
        HaveDeathStep = true
    end
    if not HaveSuperhuman then
        DoingSuperhuman()
    elseif not HaveSharkman then
        DoingSharkman()
    elseif not HaveDeathStep then
        DoingDeathStep()
    end
end
function LibraryKey()
	_G.Doing = "Unlock Death Step Room"
    EquipWeapon("Library Key")
    if (Vector3.new(6375.31152, 296.759796, -6845.37256, -0.864894807, 9.65125153e-08, -0.501953125, 1.00555702e-07, 1, 1.90105478e-08, 0.501953125, -3.40321265e-08, -0.864894807)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10 then
        TP(CFrame.new(6375.31152, 296.759796, -6845.37256, -0.864894807, 9.65125153e-08, -0.501953125, 1.00555702e-07, 1, 1.90105478e-08, 0.501953125, -3.40321265e-08, -0.864894807))
        else
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    end
end
function HiddenKey()
	_G.Doing = "Unlock Rengoku"
    EquipWeapon("Hidden Key")
    if (Vector3.new(1347.7124, 37.3751602, -1325.6488)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10 then
        TP(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
        else
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    end
end

spawn(function()
    while task.wait() do
        pcall(function()
            if Startk then
            local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
                if W1 then
                    if Lv >= 700 and Lv <= 2549 then
                        DoingQuestWorld2()
                    elseif Lv >= 100 and FindPole() then
                        FarmPole()
                    elseif Lv >= 15 and Lv <= 80 then
                        FarmSkyMonter()
                    elseif Lv >= 200 and game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                        SaberQuest()
                    elseif Lv >= 200 and FindSaber() then
                        FarmSaber()
                    elseif FindFruit() then
                        CollectFruit()
                    else
                        if Lv >= 80 then
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
                            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
                                         for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                                            if game:GetService("Workspace").Characters:FindFirstChild(v.Name) then
                                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    repeat wait()
														_G.Doing = "Doing Players Hunter Quest"
                                                        EquipWeapon(Weapon)
                                                        if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.PvpDisabled.Visible == false then
                                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,2,20))
                                                        end
                                                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                                            KillHuntQuest()
                                                            AttackNoCD()
                                                        end
                                                        OpenPVP = true
                                                    until v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not Startk
                                                    OpenPVP = false
                                                    
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        FarmLevelOO()
                    end
                elseif W2 then
                    if Lv>= 1100 and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and not FindIsland5() then
                        Buy_Chip()
                    end
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        StartDungeon()
                    end
                    if FindIsland5() or FindIsland4() or FindIsland3() or FindIsland2() or FindIsland1() then
                        NextIsland()
                    elseif FindCore() then
                        FarmCore()
                    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Library Key") or game.Players.LocalPlayer.Character:FindFirstChild("Library Key") then
                        LibraryKey()
                    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
    					HiddenKey()
                    elseif Lv > 1500 and game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress","Check") == 0 then
                        gotoworld3()
                    elseif FindBossWorld2() then    
                        FarmBossWorld2()
                    elseif Lv >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                        BartiloQuest1()
                    elseif Lv >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 and FindMonBartilo2() then
                        BartiloQuest2()
                    elseif Lv >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                        BartiloQuest3()
                    elseif FindFruit() then
                        CollectFruit()
                    else
                        FarmLevelOO()
                    end
                elseif W3 then
                    if FindFruit() then
                        CollectFruit()
                    else
                        FarmLevelOO()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        pcall(function()
            local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
            DoingAllMelee()
            if game:GetService("Players").LocalPlayer.Data.Beli.Value > 1000000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
            end
            if game:GetService("Players").LocalPlayer.Data.Beli.Value > 170000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            end
            if W2 then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == "I lost my house keys, could you help me find them? Thanks." and game.Players.LocalPlayer.Character:FindFirstChild("Water Key") and game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
                end
                if Lv > 1000 and not game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
                    donswanfruit()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
                end
            end
        end)
    end)
end)
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        pcall(function()
            for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
                if v.Name == "Death" then
                    v:Destroy() 
                end
            end
        end)
    end)
end)
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        pcall(function()
            for i, v in pairs(game:GetService("Players")["LocalPlayer"].PlayerGui:FindFirstChild("Notifications"):GetChildren()) do
                if v.Name == "NotificationTemplate" then
                    v:Destroy()
                end
            end
        end)
    end)
end)

local UIFRAMGMENT = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local DummyHub = Instance.new("TextLabel")
local _ = Instance.new("Frame")
local Enble = Instance.new("TextLabel")
local Total = Instance.new("TextLabel")
local Doing = Instance.new("TextLabel")
local Elapsed = Instance.new("TextLabel")
local Profile = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local Discord = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local CloseUI = Instance.new("ImageButton")
local UICorner_3 = Instance.new("UICorner")
local WSB = Instance.new("TextButton")

--Properties:

UIFRAMGMENT.Name = "UI FRAMGMENT"
UIFRAMGMENT.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
UIFRAMGMENT.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = UIFRAMGMENT
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.LayoutOrder = -5
Main.Position = UDim2.new(0.350071907, 0, 0.321428567, 0)
Main.Size = UDim2.new(0, 300, 0, 180)
Main.Style = Enum.FrameStyle.RobloxSquare

MainCorner.Name = "MainCorner"
MainCorner.Parent = Main

DummyHub.Name = "DummyHub"
DummyHub.Parent = Main
DummyHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DummyHub.BackgroundTransparency = 1.000
DummyHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
DummyHub.BorderSizePixel = 0
DummyHub.Position = UDim2.new(0.0270000007, 0, 0.00999999978, 0)
DummyHub.Size = UDim2.new(0, 269, 0, 19)
DummyHub.Font = Enum.Font.FredokaOne
DummyHub.Text = "Dummy Hub - Fully Fragment"
DummyHub.TextColor3 = Color3.fromRGB(255, 255, 255)
DummyHub.TextSize = 20.000

_.Name = "_"
_.Parent = Main
_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_.BorderColor3 = Color3.fromRGB(0, 0, 0)
_.BorderSizePixel = 0
_.Position = UDim2.new(0, 0, 0.150000006, 0)
_.Size = UDim2.new(0, 285, 0, 3)

Enble.Name = "Enble"
Enble.Parent = Main
Enble.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Enble.BackgroundTransparency = 1.000
Enble.BorderColor3 = Color3.fromRGB(0, 0, 0)
Enble.BorderSizePixel = 0
Enble.Position = UDim2.new(0, 0, 0.178000003, 0)
Enble.Size = UDim2.new(0, 285, 0, 30)
Enble.Font = Enum.Font.FredokaOne
Enble.Text = "Bile : "
Enble.TextColor3 = Color3.fromRGB(255, 255, 255)
Enble.TextSize = 14.000
Enble.TextXAlignment = Enum.TextXAlignment.Left

Total.Name = "Total"
Total.Parent = Main
Total.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Total.BackgroundTransparency = 1.000
Total.BorderColor3 = Color3.fromRGB(0, 0, 0)
Total.BorderSizePixel = 0
Total.Position = UDim2.new(0, 0, 0.300000012, 0)
Total.Size = UDim2.new(0, 285, 0, 30)
Total.Font = Enum.Font.FredokaOne
Total.Text = "Level : "
Total.TextColor3 = Color3.fromRGB(255, 255, 255)
Total.TextSize = 14.000
Total.TextXAlignment = Enum.TextXAlignment.Left

Doing.Name = "Doing"
Doing.Parent = Main
Doing.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Doing.BackgroundTransparency = 1.000
Doing.BorderColor3 = Color3.fromRGB(0, 0, 0)
Doing.BorderSizePixel = 0
Doing.Position = UDim2.new(0, 0, 0.430000007, 0)
Doing.Size = UDim2.new(0, 285, 0, 30)
Doing.Font = Enum.Font.FredokaOne
Doing.Text = "Doing : "
Doing.TextColor3 = Color3.fromRGB(255, 255, 255)
Doing.TextSize = 14.000
Doing.TextXAlignment = Enum.TextXAlignment.Left

Elapsed.Name = "Elapsed"
Elapsed.Parent = Main
Elapsed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Elapsed.BackgroundTransparency = 1.000
Elapsed.BorderColor3 = Color3.fromRGB(0, 0, 0)
Elapsed.BorderSizePixel = 0
Elapsed.Position = UDim2.new(0, 0, 0.550000012, 0)
Elapsed.Size = UDim2.new(0, 285, 0, 30)
Elapsed.Font = Enum.Font.FredokaOne
Elapsed.Text = "Times : "
Elapsed.TextColor3 = Color3.fromRGB(255, 255, 255)
Elapsed.TextSize = 14.000
Elapsed.TextXAlignment = Enum.TextXAlignment.Left

Profile.Name = "Profile"
Profile.Parent = Main
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.BackgroundTransparency = 1.000
Profile.BorderColor3 = Color3.fromRGB(0, 0, 0)
Profile.BorderSizePixel = 0
Profile.Position = UDim2.new(0.579999983, 0, 0.340000004, 0)
Profile.Size = UDim2.new(0, 122, 0, 110)
Profile.Image = "rbxassetid://16384956178"

UICorner.Parent = Profile

Name.Name = "Name"
Name.Parent = Main
Name.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Name.BackgroundTransparency = 1.000
Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.Position = UDim2.new(0, 0, 0.178000003, 0)
Name.Size = UDim2.new(0, 285, 0, 30)
Name.Font = Enum.Font.FredokaOne
Name.Text = "Fragment : "
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextSize = 14.000
Name.TextXAlignment = Enum.TextXAlignment.Right

Discord.Name = "Discord"
Discord.Parent = Main
Discord.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Discord.BackgroundTransparency = 0.600
Discord.BorderColor3 = Color3.fromRGB(0, 0, 0)
Discord.BorderSizePixel = 0
Discord.Position = UDim2.new(0, 30, 0.779999971, 0)
Discord.Size = UDim2.new(0, 100, 0, 35)
Discord.Font = Enum.Font.FredokaOne
Discord.Text = "Discord"
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.TextSize = 14.000

UICorner_2.Parent = Discord

CloseUI.Name = "Close UI"
CloseUI.Parent = UIFRAMGMENT
CloseUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseUI.BackgroundTransparency = 0.200
CloseUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseUI.BorderSizePixel = 0
CloseUI.Position = UDim2.new(0.063000001, 0, 0.169, 0)
CloseUI.Size = UDim2.new(0, 50, 0, 50)
CloseUI.Image = "rbxassetid://16384956178"

UICorner_3.Parent = CloseUI

WSB.Name = "WSB"
WSB.Parent = UIFRAMGMENT
WSB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WSB.BackgroundTransparency = 1.000
WSB.BorderColor3 = Color3.fromRGB(0, 0, 0)
WSB.BorderSizePixel = 0
WSB.Position = UDim2.new(0.318622172, 0, 0.321428567, 0)
WSB.Size = UDim2.new(0, 20, 0, 20)
WSB.Font = Enum.Font.SourceSans
WSB.Text = "🔴"
WSB.TextColor3 = Color3.fromRGB(0, 0, 0)
WSB.TextScaled = true
WSB.TextSize = 14.000
WSB.TextWrapped = true

function formatNumber(num)
    if num >= 1000000 then
        return string.format("%.2fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.2fK", num / 1000)
    else
        return tostring(num)
    end
end

spawn(function()
    while wait(.1) do
        pcall(function()
            Total.Text = "Level : "..tostring(game:GetService("Players").LocalPlayer.Data.Level.Value)
        end)
    end
end)
spawn(function()
    while wait(.1) do
        pcall(function()
            Enble.Text = "Bile : "..tostring(formatNumber(game:GetService("Players").LocalPlayer.Data.Beli.Value))
			Name.Text =  "Fragment : "..tostring(formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value))
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            Doing.Text = "Doing : ".._G.Doing
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            local scripttime = game.Workspace.DistributedGameTime
            local seconds = scripttime % 60
            local minutes = math.floor(scripttime / 60 % 60)
            local hours = math.floor(scripttime / 3600)
            local tempo = string.format("%02d:%02d:%02d", hours, minutes, seconds)
            Elapsed.Text = "Times : " .. tostring(tempo)
        end)
    end
end)
WSB.MouseButton1Click:Connect(function()
    if WSB.Text == "🔴" then
        WSB.Text = "🟢"
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    elseif WSB.Text == "🟢" then
        WSB.Text = "🔴"
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end)
CloseUI.MouseButton1Click:Connect(function()
    if Main.Visible == false then
        Main.Visible = true
    else
        Main.Visible = false
    end
end)
