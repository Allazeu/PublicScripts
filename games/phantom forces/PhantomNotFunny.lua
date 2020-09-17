--[[
	PhantomNotFunny created by Centurian because I am bored
	Note: this does not really classify as a "hack" much, all it does is just fuck up how the game works
	What this does:
	- Adds stupid shit that you have no use for
	- Makes the game a bit more "comical"
	- More stupid shit
	- Also adds some rad gucci stuff so that is good
	
	enjoy i guess
--]]

--[[
	if you are reading this then go ahead and learn from it i guess.
	PNF is public source, as you can see here so no secrets ;)
--]]
-- define big boy variables
math.randomseed(tick()); -- random aaaa

local version = "PUBLIC ALPHA 1.2 2019.12.30";
local PNFENABLED = true;
local volume = 1;

local cam = workspace.CurrentCamera;
local serv = {
	run = game:GetService('RunService');
	repstorage = game:GetService('ReplicatedStorage');
	repfirst = game:GetService('ReplicatedFirst');
};

-- define the rad functions
local function switch(condition, case)
	if (condition) then
		local c = case[condition];
		if (c) then
			if (typeof(c):upper() ~= 'FUNCTION') then
				c = case[c];
				if (c) then return c(); end
			else
				return c();
			end
			
		end
	elseif (condition == nil) then
		local f = case['nil'];
		if (f) then
			return f();
		end
	end
end

local function gamble(array)
	return array[math.random(1, #array)];
end

local function spawn(ACTION, ...)
	coroutine.resume(coroutine.create(ACTION), ...);
end

local wfc = game.WaitForChild;
local ffc = game.FindFirstChild;
local gpc = game.GetPropertyChangedSignal;

local ud2 = UDim2.new;
local v3 = Vector3.new;
local v2 = Vector2.new;

local ENUM = { };

-- define stupid shit
local blackreadymessages = {
	"we are gucci gnucci let's get it";
	"big boy PNF ready to roll out";
	"loaded all 103 bruh sound effects successfully, we are ready to go";
	"tactical PNF ready for deployment";
	"bruh";
	"funny haha i laughed";
	"let us bazinga all these noobs shall we";
	"remember to 360 quikscop always";
	"as one genocidal man once said: \"Let me introduce myself: I'm a man of bruh and lmao.\"";
	"make sure to dab on the haters before they dab back";
};

local makefunofteams = {
	loss = {
		"YOU FUCKING SUCK";
		"GET GOOD KID";
		"IMAGINE LOSING";
		"YOUR LIFE PASS, HAND THEM OVER";
		"I WILL NAE NAE ON YOU IF YOU LOSE AGAIN";
		"THIS IS A TRUE BRUH MOMENT";
		"WELL SHIT";
		"FUCK";
		"REMEMBER TO PUT ANOTHER INSULT HERE";
	};
	
	win = {
		"THEY FUCKING SUCK";
		"YOU ARE ALL BREATHTAKING";
		"BRUH";
		"LMFAO THEY LOST";
		"MAKE SURE TO DAB ON THEM";
		"FUCK YEAH";
		"IMAGINE WINNING. I COULDN'T";
		"I BET THEY SUCK DICK";
		"WHAT A FUCKING N-";
	};
};

local shittyquotes = {
	"suck my yankee doodle dick";
	"did you quickscope";
	"do it jiggle";
	"https://tinyurl.com/eatourfish";
	"being stupid is pretty fucking stupid if you ask me";
	"obama would like to check: y o u r  v i b e";
	"GARY I NEED HEROIN";
	"you niggas are like my underwear: \nfull of s h i t";
	"protip: you can suck your own dick";
	"if you look to your left you will see that you are gay";
	"nigward";
	"wwowowowowoowwowow we have a exploited stay calm";
	"this script was made possible by joe's mobile abortion clinic: joe's mobile abortion clinic:\n\"No fetus can beat us, you make 'em, we take 'em\".";
	"pasta la vista";
	"bro that was mad funny thanks for posting that";
	"i think i may be deaf because i did not hear myself asking";
	"my asshole is tight. but my connection with God?\nit's even tighter";
	"please stop praying for my dad u you are making him too strong. he broke out of the hospital and the tranquilizers don't work";
};

-- define the rad overrides
local Instance;

do
	local fenv = getfenv(0);
	local _o = {
		instance = fenv.Instance;
	};
	
	Instance = {
		new = function(Class, Parent, prop)
			if (type(Parent) == 'table') then
				prop = Parent;
				Parent = nil;
			end
			
			local inst = _o.instance.new(Class, Parent);
			if (not prop) then return inst; end
			local wf = false;
			
			for Property, Value in pairs(prop) do
				local Property = tostring(Property);
				xpcall(function()
					inst[Property] = Value;
				end, function() error('Property "' .. tostring(Property) .. '" does not exist for instance "' .. tostring(inst.ClassName) .. '"'); end);
			end
			
			return inst;
		end;
		
		clone = function(Object, prop)
			local inst = Object:Clone();
			if (not prop) then return inst; end
			if (typeof(prop) ~= 'table') then inst.Parent = prop; return inst; end
			for Property, Value in pairs(prop) do
				local Property = tostring(Property);
				xpcall(function()
					inst[Property] = Value;
				end, function() error('Property "' .. tostring(Property) .. '" does not exist for instance "' .. tostring(inst.ClassName) .. '"'); end);
			end
			
			return inst;
		end;
		
		destroy = function(instance, Delay)
			if (instance) then
				game:GetService('Debris'):AddItem(instance, Delay or 0);
			end
		end;
		
		set = function(inst, prop)
			if (not prop) then return inst; end
			if (typeof(prop) ~= 'table') then inst.Parent = prop; return inst; end
			for Property, Value in pairs(prop) do
				local Property = tostring(Property);
				xpcall(function()
					inst[Property] = Value;
				end, function() error('Property "' .. tostring(Property) .. '" does not exist for instance "' .. tostring(inst.ClassName) .. '"'); end);
			end
			
			return inst;
		end;
	};
end


-- make the extra c00l event module that is very gucci
local ev = { };
do
	local a = { };
	local b = { };
	
	setmetatable(b, {
		__index = function(self, index)
			return rawget(a, index);
		end;
		
		__newindex = function(self, index, new)
			if (index == '!rem') then
				a[new] = nil;
				return;
			end
			rawset(a, index, new)
		end
	})
	
	function ev:EventExists(name)
		if (b[name]) then return true; else return false; end
	end
	
	function ev:AddEvent(name, f)
		if (ev:EventExists(name)) then
			table.insert(b[name], f);
		else
			b[name] = { f };
		end
	end
	
	function ev:WaitForEvent(name, ...)
		local extargs = {...};
		local args;
		local function condition(...)
			local wegood = true;
			for _, v in pairs(extargs) do
				local broke = false;
				for _, w in pairs({...}) do
					if (v == w) then
						broke = true;
						break;
					end
				end
				
				wegood = broke;
				if (not wegood) then
					break;
				end
			end
			
			if (wegood) then
				spawn(function()
					ev:RemoveEvent(name);
				end);
				
				args = {...};
			end
		end
		
		if (ev:EventExists(name)) then
			table.insert(b[name], condition);
		else
			b[name] = { condition };
		end
		
		repeat wait(); until not ev:EventExists(name);
		return unpack(args or { });
	end
	
	function ev:GetEvent(name)
		return b[name] or {};
	end
	
	function ev:FireEvent(name, ...)
		local args = {...};
		if (ev:EventExists(name)) then
			for _, f in pairs(ev:GetEvent(name)) do
				spawn(function() f(unpack(args)); end);
			end
		end
	end
	
	function ev:RemoveEvent(name)
		b['!rem'] = name;
	end
end

-- make the player class for an interface of players
local Player = { };
local PlayerService = {
	service = game:GetService('Players');
	Players = { };
};

do
	local lp = PlayerService.service.LocalPlayer;
	do
		local pservice = PlayerService.service;
		local events = {
			added = { };
			removing = { };
		};
		
		function PlayerService.Added(p, ACTION)
			events.added[p] = ACTION;
		end
		
		function PlayerService.Removing(p, ACTION)
			events.removing[p] = ACTION;
		end
		
		function PlayerService:Get(name)
			return PlayerService.Players[name];
		end
		
		function PlayerService:GetAllPlayers()
			local x = PlayerService.Players;
			x[lp.Name] = nil;
			
			return x;
		end
		
		pservice.ChildAdded:Connect(function(obj)
			if (obj:IsA('Player')) then
				ev:FireEvent('playeradded', PlayerService.Players[obj.Name]);
			end
		end);
		
		pservice.DescendantRemoving:Connect(function(obj)
			if (obj:IsA('Player')) then
				ev:FireEvent('playerleft', PlayerService.Players[obj.Name]);
			end
		end);
	end
	
	do
		local pmeta = {
			__index = function(this, i)
				local me = rawget(this, 'Player');
				local index = i:upper();
				return switch(index, {
					NAME = function()
						return me.Name;
					end;
					
					CHARACTER = function()
						return me.Character;
					end;
					
					TEAMCOLOR = function()
						return me.TeamColor;
					end;
					
					HEAD = function()
						local x = me.Character;
						if (x) then
							return x:FindFirstChild('Head');
						end
					end;
					
					DEAD = function()
						if (me.Character) then
							return (me.Character.Parent == workspace);
						end
						
						return true;
					end;
				});
			end;
			
			__eq = function(this, value)
				return this.Player == value.Player;
			end;
			
			__tostring = function(this)
				return this.name;
			end;
			
			__call = function(this, ...)
				return this.Player;
			end
		};
		
		function Player.new(me)
			local this = { Player = me };
			local events = {
				cadded = { };
				left = { };
			};
			
			this.PlayerGui = (me == lp and me:FindFirstChildOfClass('PlayerGui'));
			
			function this.CharacterAdded(ACTION)
				local tkey = tick();
				events.cadded[tkey] = ACTION;
				
				return tkey;
			end
			
			function this.Leaving(ACTION)
				local tkey = tick();
				events.left[tkey] = ACTION;
				
				return tkey;
			end
			
			function this.UnbindAction(type, id)
				switch(type:upper(), {
					L = function()
						events.left[id] = nil;
					end;
					
					A = function()
						events.cadded[id] = nil;
					end
				});
			end
			
			setmetatable(this, pmeta);
			PlayerService.Players[me.Name] = this;
			
			me.CharacterAdded:Connect(function(char)
				for _, ACTION in next, events.cadded do
					spawn(ACTION, char);
				end
			end);
			
			
			ev:AddEvent('playerleft', function(THATPLAYER)
				if (THATPLAYER == this) then
					for _, ACTION in next, events.left do
						spawn(ACTION);
					end
				end
				
			end);
			
			return this;
		end
	end
end

-- the fuckign contentprovider
local Provider = { };
do
	local cp = game:GetService('ContentProvider');
	function Provider:Preload(stuff)
		cp:PreloadAsync(stuff);
	end
end

-- define needed variables for big boys
local self = Player.new(PlayerService.service.LocalPlayer); -- LocalPlayer
for _, v in next, PlayerService.service:GetPlayers() do
	Player.new(v);
end

-- setup the bruh moment sound module
local sound = { };
do
	local soundarray = { };
	
	local basesound = Instance.new('Sound', nil, {
		Volume = 2;
		EmitterSize = 10;
	});
	
	function sound.distort(lvl, p)
		return Instance.new('DistortionSoundEffect', nil, {
			Level = lvl;
			Priority = p;
		});
	end
	
	function sound.play(name, prop)
		if (not soundarray[name]) then error(name .. " is not loaded!"); end
		if (not prop) then prop = { }; end
		local distort = prop.dt;
		local reverb = prop.rv;
		
		local mysound = Instance.clone(soundarray[name], {
			Parent = prop.par or self.PlayerGui;
			TimePosition = prop.tp or .5;
			Volume = (prop.v or 2) * volume;
			PlaybackSpeed = prop.pi or 1;
		});
		
		if (distort) then distort.Parent = mysound; end
		if (reverb) then reverb.Parent = mysound; end
		
		local function stopit()
			mysound:Destroy();
			if (prop.par) then
				prop.par:Destroy();
			end
		end
		
		spawn(function() mysound.Ended:Wait(); stopit(); end);
		
		mysound:Play();
		if (prop.ea) then
			delay(prop.ea, function()
				mysound:Stop();
				stopit();
			end);
		end
	end
	
	function sound.load(name, id)
		if (not soundarray[name]) then
			local newsound = Instance.clone(basesound, {
				SoundId = id;
			});
			
			Provider:Preload({ newsound });
			soundarray[name] = newsound;
		end
	end
end

-- memes
local MEMES = { };
do
	local SHIT = {
		HM = Instance.new('ImageLabel', nil, {
			AnchorPoint = v2(.5, .5);
			BackgroundTransparency = 1;
			Size = ud2(0, 35, 0, 35);
			Position = ud2(.5, 0, .5, 0);
			Image = 'rbxassetid://1648882980';
		});
	};
	
	local _shit = { };
	for _, OBJECT in next, SHIT do
		table.insert(_shit, OBJECT);
	end

	Provider:Preload(_shit);
	
	function MEMES.HITMARKER(UIELEMENT, AMOUNT)
		spawn(function()
			for _ = 1, AMOUNT or 1 do
				local CLONE = Instance.clone(SHIT.HM, {
					Parent = UIELEMENT;
				});
				
				sound.play('hitmarker', {v = 3.5; tp = 0; par = CLONE;});
				wait(.15);
			end
		end);
	end
end

-- define a fake pf api because we are neato burrito and i am too lazy to execute cRaZy HaCkS
local PF = { };

local function TryCommand(m)
	local commands = {
		TEST = {
			"tests to see if i am on or off (please turn me on)";
			function()
				if (PNFENABLED) then
					PF.Chat:out("PNF", "yes we are gucci", Color3.new(0, 1));
				else
					PF.Chat:out("PNF", "no i am not gucci i am turned off", Color3.new(1));
				end
			end
		};
		
		TOGGLE = {
			"if you do not like me i will turn off, otherwise if you want me again i turn back on :)";
			function()
				PNFENABLED = not PNFENABLED;
				if (PNFENABLED) then
					PF.Chat:out("PNF", "ok i am so turned on rn", Color3.new(0, 1, 0));
					version.Text = ENUM.CHAT.PNFSTATUS.ENABLED;
				else
					PF.Chat:out("PNF", "bro, you just killed my vibe. that was wiggity wack, yo.", Color3.new(1, 0, 0));
					version.Text = ENUM.CHAT.PNFSTATUS.DISABLED;
				end
			end
		};
		
		SERVERVERSION = {
			"shows this piece of shit server's current version";
			function()
				PF.Chat:out("PNF", "this piece of shit server is currently: " .. PF.Core.ServerVersion, Color3.new(1, 1, 0));
			end
		};
		
		VOLUME = {
			"sets the volume multiplier for sounds used, only use if you do not like loud sound you baby";
			function()
				local v = m[2];
				volume = tonumber(v) or 1;
				
				PF.Chat:out("PNF", "ok i set the volume to: " .. v, Color3.new(0, 1, 0));
			end
		};
	};
	
	commands.HELP = {
		"shows a list of shitty commands that can be used with PNF";
		function()
			PF.Chat:out("PNF", "showing commands:", Color3.new(0, 1));
			for name, stuff in next, commands do
				local desc = stuff[1];
				PF.Chat:out("PNF > " .. name, desc, Color3.new(1, 1));
			end
		end
	};
	
	local cmd = commands[m[1]];
	if (cmd) then
		cmd[2]();
	end
end

do
	local maingui = wfc(self.PlayerGui, "MainGui");
	local gamegui = wfc(maingui, "GameGui");
	local misc = serv.repstorage.Misc;
	
	local chatgui = wfc(self.PlayerGui, "ChatGame");
	local globalchat = wfc(chatgui, "GlobalChat");
	local version = wfc(chatgui, "Version");
		local SERVERVERSION = version.Text:match(":%s?(.+)");
	
	local killfeed = wfc(gamegui, "Killfeed");
	
	local endfr = wfc(maingui, "EndMatch")
	local quote = wfc(endfr, "Quote")
	local result = wfc(endfr, "Result")
	local gmode = wfc(endfr, "Mode")
	
	-- core stuff like uuhhhhhhh fuckin' uuuuhhhhh names
	PF.Core = { };
	do
		PF.Core.MainGui = maingui;
		PF.Core.GameGui = gamegui;
		PF.Core.Misc = misc;
		PF.Core.ServerVersion = SERVERVERSION;
		
		local setname = self.name;
		
		function PF.Core:setname(name)
			for _, v in next, maingui:GetDescendants() do
				if (v:IsA('TextLabel')) then
					if (v.Text:upper() == setname:upper()) then
						v.Text = name;
					end
				end
			end
			
			setname = name;
		end
		
		function PF.Core:revertname()
			local me = self.name;
			for _, v in next, maingui:GetDescendants() do
				if (v:IsA('TextLabel')) then
					if (v.Text:upper() == setname:upper()) then
						v.Text = me;
					end
				end
			end
			
			setname = me;
		end
		
		workspace.Ignore.DeadBody.ChildAdded:Connect(function(c) -- connect to when somebody dies xd
			if (c:IsA('Model') and c.Name == 'Dead' and PNFENABLED) then
				ev:FireEvent('deadbody', c);
			end
		end);
	end
	
	
	-- chat blah blah
	PF.Chat = { };
	ENUM.CHAT = { };
	do
		ENUM.CHAT.PNFSTATUS = {
			ENABLED = "PNF is gucci right now: enabled";
			DISABLED = "PNF has been 360 noscoped: disabled";
		};
		
		local speakerpattern = "(%a+)%s?:";
		local msg = wfc(misc, "Msger");
		local chatbox = wfc(chatgui, "TextBox");
		
		PF.Chat.ChatBox = chatbox;
		PF.Chat.GlobalChat = globalchat;
		
		--[[
			[string] tag - tag to use for the message
			[string] message - the thing to say
			[Color3] colour - colour to use for tag
		--]]
		function PF.Chat:out(tag, message, colour)
			local mes = msg:Clone();
			mes.Name = 'MsgerMain';
			mes.Parent = globalchat;
			mes.Text = "[" .. tag .. "]: ";
			mes.TextColor3 = colour;
			mes.Msg.Text = message;
			mes.Msg.Position = ud2(0, mes.TextBounds.x, 0, 0);
		end
		
		globalchat.ChildAdded:Connect(function(mes)
			if (mes:IsA('TextLabel')) then
				wait();
				local speaker = mes.Text:match(speakerpattern);
				
				if (speaker and not speaker:find("PNF")) then
					local message = mes.Msg.Text;
					if (PNFENABLED) then
						ev:FireEvent('playerchatted', PlayerService:Get(speaker), message, mes);
					end
				end
			end
		end);
		
		chatbox.FocusLost:Connect(function(enter)
			chatbox.Active = false;
			local message = chatbox.Text;
			if (enter and message ~= "") then
				if (PNFENABLED) then
					ev:FireEvent('selfchatted', message);
				end
				
				if (message:sub(0, 4) == "/pnf") then
					local m = message:sub(6):upper():split(' ');
					TryCommand(m);
				end
			end
		end);
		
		version.TextColor3 = Color3.new(0, 1, 0);
		version.Text = ENUM.CHAT.PNFSTATUS.ENABLED;
	end
	
	-- killfeed shot you are dead
	PF.Killfeed = { };
	ENUM.KILLFEED = { };
	do
		PF.Killfeed.KillfeedFrame = killfeed;
		local distpattern = "%s?(%d+)%s?";
		local rfeed = misc.Feed;
		local hsht = misc.Headshot;
		
		--[[
			[Player] killer - the killer
			[string] victim - the victim
			[string] dist - distance of killer from victim
			[string] weapon - name of the weapon used by the killer to kill the victim
			[boolean] head - headshot or not
		--]]
		function PF.Killfeed:add(killer, killercolour, victim, victimcolour, dist, weapon, head)
			local spacing = 15;
			local newfeed = rfeed:Clone();
			newfeed.Text = killer;
			newfeed.TextColor = killercolour;
			newfeed.GunImg.Text = weapon;
			newfeed.Victim.Text = victim;
			newfeed.Victim.TextColor = victimcolour;
			newfeed.GunImg.Dist.Text = "Dist: " .. dist .. " studs";
			newfeed.Parent = killfeed;
			newfeed.GunImg.Size = UDim2.new(0, newfeed.GunImg.TextBounds.x, 0, 30);
			newfeed.GunImg.Position = UDim2.new(0, spacing + newfeed.TextBounds.x, 0, -5);
			newfeed.Victim.Position = UDim2.new(0, spacing * 2 + newfeed.TextBounds.x + newfeed.GunImg.TextBounds.x, 0, 0);
			if head then
				local headnote = hsht:Clone();
				headnote.Parent = newfeed.Victim;
				headnote.Position = ud2(0, 10 + newfeed.Victim.TextBounds.x, 0, -5);
			end
			spawn(function()
				newfeed.Visible = true;
				wait(20);
				for i = 1, 10 do
					if newfeed.Parent then
						newfeed.TextTransparency = i / 10;
						newfeed.TextStrokeTransparency = i / 10 + 0.5;
						newfeed.GunImg.TextStrokeTransparency = i / 10 + 0.5;
						newfeed.GunImg.TextTransparency = i / 10;
						newfeed.Victim.TextStrokeTransparency = i / 10 + 0.5;
						newfeed.Victim.TextTransparency = i / 10;
						wait(1 / 30);
					end
				end
				if newfeed and newfeed.Parent then
					Instance.destroy(newfeed);
				end
			end);
			local kb = killfeed:GetChildren();
			for i = 1, #kb do
				local v = kb[i];
				v:TweenPosition(ud2(0.01, 5, 1, (i - #kb) * 25 - 25), "Out", "Sine", 0.2, true);
				if #kb > 5 and #kb - i >= 5 then
					spawn(function()
						if kb[1].Name ~= "Deleted" then
							for i = 1, 10 do
								if ffc(kb[1], "Victim") then
									kb[1].TextTransparency = i / 10;
									kb[1].TextStrokeTransparency = i / 10 + 0.5;
									kb[1].Victim.TextTransparency = i / 10;
									kb[1].Victim.TextStrokeTransparency = i / 10 + 0.5;
									kb[1].Name = "Deleted";
									kb[1].GunImg.TextTransparency = i / 10;
									kb[1].GunImg.TextStrokeTransparency = i / 10 + 0.5;
									wait(1 / 30)
								end
							end
							Instance.destroy(kb[1]);
						end
					end)
				end
			end
		end
		
		killfeed.ChildAdded:Connect(function(newfeed)
			if (newfeed:IsA('TextLabel')) then
				local killer = PlayerService:Get(newfeed.Text);
				local victim = PlayerService:Get(newfeed.Victim.Text);
				local dist = string.match(newfeed.GunImg.Dist.Text, distpattern);
				local weapon = newfeed.GunImg.Text;
				local head = newfeed.Victim:FindFirstChild('Headshot');
				
				if (head) then
					head = head.Visible;
				end
				
				if (PNFENABLED) then
					ev:FireEvent('onkill', killer, victim, dist, weapon, head, newfeed);
				end
			end
		end);
	end
	
	-- round timing let's get it
	PF.Round = { };
	ENUM.ROUND = { };
	do
		PF.Round.EndFrame = endfr;
		PF.Round.Quote = quote;
		PF.Round.ResultText = result;
		PF.Round.GameMode = gmode;
		
		gpc(endfr, 'Visible'):Connect(function()
			wait(.1);
			local bool = endfr.Visible;
			if (bool) then
				local resultText = result.Text;
				local loss = (resultText:upper() == "DEFEAT");
				
				-- damn the round ended
				if (PNFENABLED) then
					ev:FireEvent('roundend', quote, loss, result, gmode);
				end
			end
		end);
	end
	
	-- weapon pew pew
	PF.Weapon = { };
	ENUM.WEAPON = { };
	do
		-- enums
		do
			ENUM.WEAPON.HUD = {
				NA_AMMO = "- - -";
				SPOT_HIDING = "Hiding from enemy...";
				SPOT_SHOWN = "Spotted by enemy!";
			};
		end
		
		local gammopattern = "(%d+)x";
		
		-- misc
		local tagfr = wfc(gamegui, "NameTag");
		local capfr = wfc(gamegui, "Capping");
		
		-- scope
		local scopefr = wfc(maingui, "ScopeFrame");
		local steady = wfc(gamegui, "Steady");
		local steadyfull = wfc(steady, "Full");
		local steadybar = wfc(steadyfull, "Bar");
		
		-- HUD
		local spotted = wfc(gamegui, "Spotted");
		local use = wfc(gamegui, "Use");
		
		-- radar
		local radar = wfc(gamegui, "Radar");
		local rme = wfc(radar, "Me");
		local rfolder = wfc(radar, "Folder");
		
		-- ammo
		local ammohud = wfc(gamegui, "AmmoHud");
		local hitmarker = wfc(gamegui, "Hitmarker");
		local ammofr = wfc(ammohud, "Frame");
		local ammotext = wfc(ammofr, "Ammo");
		local gammo = wfc(ammofr, "GAmmo");
		local magtext = wfc(ammofr, "Mag");
		local fmodetext = wfc(ammofr, "FMode");
		
		-- health
		local bloodscreen = wfc(gamegui, "BloodScreen");
		local healthtext = wfc(ammofr, "Health");
		local healthbar = wfc(ammofr, "healthbar_back");
		local healthbarFill = wfc(healthbar, "healthbar_fill");
		
		-- scope shit here
		PF.Weapon.Scope = { };
		do
			PF.Weapon.Scope.ScopeFrame = scopefr;
			PF.Weapon.Scope.SteadyText = steady;
			PF.Weapon.Scope.SteadyBar = steadybar;
			
			gpc(scopefr, 'Visible'):Connect(function()
				if (PNFENABLED) then
					ev:FireEvent('scoped', scopefr.Visible);
				end
			end);
		end
		
		-- hud crap
		PF.Weapon.HUD = { };
		do
			PF.Weapon.HUD.SpottedText = spotted;
			PF.Weapon.HUD.UseText = use;
			
			gpc(spotted, 'Visible'):Connect(function()
				if (spotted.Text == ENUM.WEAPON.HUD.SPOT_SHOWN) then
					if (PNFENABLED) then
						ev:FireEvent('spotted');
					end
				end
			end);
			
			gpc(spotted, 'Text'):Connect(function()
				if (spotted.Visible) then
					if (PNFENABLED) then
						if (spotted.Text == ENUM.WEAPON.HUD.SPOT_HIDING) then
							ev:FireEvent('spot_hide');
						else
							ev:FireEvent('spotted');
						end
					end
				end

			end);
			
			gpc(use, 'Visible'):Connect(function()
				if (PNFENABLED) then
					ev:FireEvent('useprompt', use.Visible);
				end
			end);
		end
		
		-- finally the fucking guns
		PF.Weapon.Weapons = { };
		do
			PF.Weapon.Weapons.Hitmarker = hitmarker;
			PF.Weapon.Weapons.AmmoText = ammotext;
			PF.Weapon.Weapons.GammoText = gammo;
			PF.Weapon.Weapons.MagText = magtext;
			
			PF.Weapon.Weapons.CURRENTWEAPON = {
				ammo = 0;
				mag = 0;
			};
			
			gpc(hitmarker, 'Visible'):Connect(function()
				if (not PNFENABLED) then return; end
				ev:FireEvent('bullethit', hitmarker.Visible);
			end);
			
			gpc(ammotext, 'Text'):Connect(function()
				local ammo = ammotext.Text;
				if (PNFENABLED) then
					if (ammo == ENUM.WEAPON.HUD.NA_AMMO) then
						-- non-school-shooter weapons (grenades and knives)
						ev:FireEvent('na_ammo', ammo);
					else
						-- school shooter firearms
						PF.Weapon.Weapons.CURRENTWEAPON.ammo = ammo;
						ev:FireEvent('clipchanged', ammo);
					end
				end
			end);
			
			gpc(gammo, 'Text'):Connect(function()
				local ammo = string.match(gammo.Text, gammopattern);
				
				-- the boom booms
				if (not PNFENABLED) then return; end
				ev:FireEvent('gammochanged', ammo);
			end);
			
			gpc(magtext, 'Text'):Connect(function()
				local mag = magtext.Text;
				if (mag ~= ENUM.WEAPON.HUD.NA_AMMO and PNFENABLED) then
					-- school shooter firearms
					PF.Weapon.Weapons.CURRENTWEAPON.mag = mag;
					ev:FireEvent('magchanged', mag);
				end
			end);
		end
	end
end

local function init() -- connections and shi
	do -- chat
		local rep = {
			bro = "bruh";
			lol = "lmfao";
			hacker = "cool boy";
			lmao = "lmfao";
			heck = "fuck";
			frick = "fuck";
			wth = "what the fuck";
			wtf = "what the fuck";
			ok = "ok boomer";
			exploiter = "cool kid";
			damn = "dammmm";
			mate = "m8";
			
			
		};
		
		ev:AddEvent('playerchatted', function(speaker, message, chatmessage)
			for pattern, rep in next, rep do
				message = message:gsub(pattern, rep);
			end
			
			chatmessage.Msg.Text = message;
		end);
	end
	
	do -- gay hud stuff
		ev:AddEvent('spotted', function()
			MEMES.HITMARKER(PF.Weapon.HUD.SpottedText, 3);
		end);
		
		ev:AddEvent('bullethit', function()
			sound.play('hitmarker', {v = 1.5, tp = 0});
		end);
	end
	
	do -- more scope cool kid stuff
		ev:AddEvent('scoped', function(scoped)
			if (scoped) then
				
			end
		end);
	end
	
	do -- killfeed cool stuff
		local soundarray = {
			kill = {
				"quickscope";
				"whatarethose";
				"mlghorn";
				"anotherone";
				"donotkillme";
				"laugh2";
				"bruh3";
				"getnoscoped";
				"omgwow";
				"damnson";
				"trickshotreaction1";
				"codomg";
				"discordcall";
				"cs12";
				"cs2";
				"sparta";
			};
			
			headshot = {
				"marcus";
				"mlgchimes";
				"mlghorn";
				"getnoscoped";
			};
			
			death = {
				"laugh1";
				"oof";
				"igotquick";
				"fine";
				"risitas";
				"bruh";
				"mariooof";
				"sadairhorn";
				"aol";
				"peppa";
				"swiperawman";
				"bruh";
				"bruh2";
				"discordmessage";
				"hsbruhmoment";
				"weatheralert";
				"laugh3";
				"airraid";
				"cs8";
				"cs7";
				"villager";
			};
			
			suicidelmao = {
				"bruh"; -- make this epic loud
				"laugh2";
				"laugh3";
				"mariooof";
				"risitas"; -- make this loud
			};
		};
		
		local basep = Instance.new('Part', nil, {
			Transparency = 1;
			Anchored = true;
			CanCollide = false;
			Massless = true;
			Size = v3();
		});
		
		local function gamblekill(p)
			local asound = gamble(soundarray.kill);
			local tp;
			local pi;
			local v;
			local ea;
			
			switch(asound, {
				risitas = function()
					tp = 0;
				end;
				
				bruh3 = function()
					pi = .75;
				end;
				
				codomg = function()
					v = 1;
					tp = 0;
					ea = 6;
				end;
				
				omgwow = function()
					v = 1;
					tp = 0;
				end;
				
				trickshotreaction1 = function()
					v = 1;
					tp = 0;
					ea = 7;
				end;
				
				damnson = function()
					v = 2;
				end;
				
				donotkillme = function()
					ea = 4.75;
				end;
				
				discordcall = function()
					tp = 1;
					ea = 7;
				end;
				
				cs12 = function()
					tp = 0;
					v = 2;
				end;
				
				cs2 = function()
					tp = 0;
					v = 2;
				end;
				
				sparta = function()
					tp = .25;
					v = 2;
				end;
			});
			
			sound.play(asound, {v = v, ea = ea, par = p; pi = pi;});
		end
		
		local function gambledeath(p)
			local asound = gamble(soundarray.death);
			local ea;
			local tp;
			local pi;
			local v;
			
			switch(asound, {
				peppa = function()
					ea = 10;
				end;
				
				risitas = function()
					tp = 0;
				end;
				
				bruh2 = function()
					pi = 1.25;
				end;
				
				aol = function()
					ea = 8;
				end;
				
				swiperawman = function()
					v = 10;
				end;
				
				oof = function()
					v = 3;
					tp = 0;
				end;
				
				igotquick = function()
					tp = 0;
				end;
				
				discordmessage = function()
					tp = 0;
				end;
				
				hsbruhmoment = function()
					v = 2;
				end;
				
				weatheralert = function()
					v = 1.5;
				end;
				
				laugh3 = function()
					v = 2;
					ea = 5;
				end;
				
				airraid = function()
					v = 1.5;
					ea = 5;
				end;
				
				cs7 = function()
					tp = 0;
					v = 2;
				end;
				
				cs8 = function()
					tp = 0;
					v = 2;
				end;
				
				villager = function()
					tp = .3;
					v = 2;
				end;
			});
			
			sound.play(asound, {par = p; v = v; ea = ea; tp = tp; pi = pi;});
		end
		
		local function gambleheadshot(p)
			local asound = gamble(soundarray.headshot);
			sound.play(asound, {v = 2, par = p});
		end
		
		ev:AddEvent('deadbody', function(c)-- connect to when somebody dies xd
			for _, v in next, c:GetChildren() do
				v.CanCollide = false;
				v.Anchored = false;
				v.Massless = true;
			end
			
			local p = Instance.clone(basep, {
				Parent = c;
				CFrame = c.Torso.CFrame;
			});
			
			gambledeath(p);
			
			local p2 = Instance.clone(p, {
				Parent = p;
				Anchored = false;
			});
			
			local w = Instance.new('Weld', p2, {
				Part0 = c.Torso;
				Part1 = p2;
			});
			
			local bv = Instance.new('BodyVelocity', p2, {
				MaxForce = v3(0, 40000, 0);
				Velocity = v3(0, 50, 0);
				P = 1000;
			});
		end);
		
		ev:AddEvent('onkill', function(killer, victim, dist, weapon, head, nf)
			if (killer == self and victim == self) then
				-- lmao kill yourself wait shit
				local asound = gamble(soundarray.suicidelmao);
				sound.play(asound, switch(asound, {
					risitas = function()
						return {
							tp = (asound == 'bruh' and .5) or 0;
							dt = sound.distort(1, 0);
							v = 2.5;
						};
					end;
					
					bruh = 'risitas';
					laugh2 = function() return { } end;
				}));
			elseif (killer == self) then
				-- remember to initialize a cool moment for the user
				
				if (head) then
					MEMES.HITMARKER(nf, 10);
					gambleheadshot();
				else
					MEMES.HITMARKER(nf, 5);
					gamblekill();
				end
			elseif (victim == self) then
				-- remember to punish the user
				gambledeath();
			else
				MEMES.HITMARKER(nf);
			end
			
			-- make the killer speak
			if (killer ~= self and killer) then
				local fauxchar = workspace:FindFirstChild(killer.name);
				local ahead = killer.head;
				if (fauxchar and ahead) then
					local p = Instance.clone(basep, {
						Parent = cam;
						CFrame = ahead.CFrame;
					});
					local weld = Instance.new('Weld', p, {
						Part0 = ahead;
						Part1 = p;
					});
					
					if (head) then
						gambleheadshot(p);
					else
						gamblekill(p);
					end
				end
			end
		end);
	end
	
	do -- round shit
		ev:AddEvent('roundend', function(quote, loss, result, gmode)
			if (loss) then
				result.Text = gamble(makefunofteams.loss);
			else
				result.Text = gamble(makefunofteams.win);
			end
			
			quote.Text = gamble(shittyquotes);
		end);
	end
end

-- let us put on our big boy pants and start the script
do
	if (not PNFENABLED) then
		PF.Chat:out("PNF", "what the fuck why would you disable the script before even running it", Color3.new(1));
		wait(1);
		PF.Chat:out("PNF", "whatever i am going to run anyways, just type /pnf toggle to turn me on", Color3.new(1));
	end
	
	sound.load("bruh", 'rbxassetid://1589023949'); -- funny bruh sound effect hahahahahahaha
	sound.load("bruh2", 'rbxassetid://1589023949'); -- funny bruh sound effect hahahahahahaha
	sound.load("bruh3", 'rbxassetid://1589023949'); -- funny bruh sound effect hahahahahahaha
	sound.load("quickscope", 'rbxassetid://3319026007'); -- mlg quikscop
	sound.load("igotquick", 'rbxassetid://193471423'); -- i just got quickscoped dammm
	sound.load("whatarethose", 'rbxassetid://362846090'); -- big mlg
	sound.load("mlghorn", 'rbxassetid://853105034'); -- mlg horn be like woo wo wo wo wo wooooo
	sound.load("anotherone", 'rbxassetid://3063895654'); -- another one xdxdxdxd
	sound.load("fine", 'rbxassetid://513919776'); -- they ask me if i am fine but no because i never asked
	sound.load("donotkillme", 'rbxassetid://386222774'); -- i will kill u if i want 2
	sound.load("oof", 'rbxasset://sounds/uuhhh.mp3'); -- oof
	sound.load("laugh1", 'rbxassetid://165487479'); -- muahahahaha
	sound.load("laugh2", 'rbxassetid://299088617'); -- jonah jameson
	sound.load("risitas", 'rbxassetid://2485325762'); -- risitas laugh EEEEEHEHEHHEH HAHAHAHA
	sound.load("mlgchimes", 'rbxassetid://223131308'); -- what the fuck is this
	sound.load("marcus", 'rbxassetid://2206990658'); -- what the fuck is this
	sound.load("mariooof", 'rbxassetid://2812821048'); -- oooooooooooooooooooooooooooooooooofffffffffffffffffff
	sound.load("getnoscoped", 'rbxassetid://168209229'); -- get noscoped
	sound.load("sadairhorn", 'rbxassetid://244528145'); -- sad airhorn be like NEEEEE NEEEEE NEEE NEEEE NEEEEEE
	sound.load("swiperawman", 'rbxassetid://2610501155'); -- awww man
	sound.load("aol", 'rbxassetid://424450670'); -- aol internet AAAAAAAAAAAAAAAAAAAAAAAAAAAAAOOOOOOOOOOOOOOOEEEEEEEEEEEEEEEE
	sound.load("peppa", 'rbxassetid://2263791567'); -- peppa pig ytp
	sound.load("hitmarker", 'rbxassetid://705502934'); -- og hitmarker
	sound.load("damnson", 'rbxassetid://154345248'); -- dammmmmmm son where you find this
	sound.load("omgwow", 'rbxassetid://4449756110'); -- wow
	sound.load("trickshotreaction1", 'rbxassetid://163206486'); -- oohohohohohohohoho
	sound.load("codomg", 'rbxassetid://168209503'); -- OOHO OHOO OHO OHO O HMK HKOHM 
	sound.load("discordmessage", 'rbxassetid://1076907875'); -- bruh
	sound.load("discordcall", 'rbxassetid://1506110848'); -- brugh
	sound.load("hsbruhmoment", 'rbxassetid://3445097687'); -- bruh moment woowowowow
	sound.load("weatheralert", 'rbxassetid://1783844576'); -- bruh moment woowowowow
	sound.load("laugh3", 'rbxassetid://2081710230'); -- haha funny
	sound.load("airraid", 'rbxassetid://3106873675'); -- aaaaaaaaaaaaaaaaaAAAAAAAAAA
	sound.load("cs12", 'rbxassetid://3231984721'); -- scary
	sound.load("cs7", 'rbxassetid://3179846605'); -- scary
	sound.load("cs2", 'rbxassetid://3173571164'); -- scary
	sound.load("cs8", 'rbxassetid://3179847853'); -- scary
	sound.load("villager", 'rbxassetid://3732415471'); -- h u h
	sound.load("sparta", 'rbxassetid://130781067'); -- old meme but who fucking cares not me
	
	PF.Chat:out("PNF", "PhantomNotFunny by Centurian : Version " .. version, Color3.new(0, 1));
	PF.Chat:out("PNF", "Say \"/pnf help\" to see commands" .. version, Color3.new(0, 1));
	PF.Chat:out("PNF", gamble(blackreadymessages), Color3.new(1, 1));
	
	init();
end
