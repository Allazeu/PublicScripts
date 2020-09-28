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

local version = "PUBLIC ALPHA 1.3 2020.09.27";
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

local function netrequire(uri)
	local httpget = game:HttpGet(uri);
	return loadstring(httpget)();
end

local api = netrequire('https://raw.githubusercontent.com/Allazeu/api/master/Lua/Roblox/ProjectFantasma.lua');

-- define the rad overrides
local Instance = api.instance;

-- make the extra c00l event module that is very gucci
local ev = api.events;

-- make the player class for an interface of players
local Player = api.player;
local PlayerService = api.playerservice;

-- the fuckign contentprovider
local Provider = { };
do
	local cp = game:GetService('ContentProvider');
	function Provider:Preload(stuff)
		cp:PreloadAsync(stuff);
	end
end

-- define needed variables for big boys
local lp = PlayerService.service.LocalPlayer;

for _, v in next, PlayerService.service:GetPlayers() do
	Player.new(v);
end

-- setup the bruh moment sound module
local sound = api.sound;

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
local PF = api.api;

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
			kill = { -- you killed some funny people
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
				
				-- 20/09/27
				"davinky";
				"bababooey";
				"ouch";
				"femur";
			};
			
			headshot = { -- hit a funky headshot congrat
				"marcus";
				"mlgchimes";
				"mlghorn";
				"getnoscoped";
			};
			
			death = { -- some funny man dies
				"laugh1";
				"oof";
				"igotquick";
				"fine";
				"risitas";
				"bruh";
				"mariooof";
				"sadairhorn";
				"aol";
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
				
				-- 20/09/27
				"davinky";
				"bababooey";
				"ouch";
				"femur";
			};
			
			suicidelmao = { -- lmao moment
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
			if (killer == lp.Name and victim == lp.Name) then
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
			elseif (killer == lp.Name) then
				-- remember to initialize a cool moment for the user
				
				if (head) then
					gambleheadshot();
				else
					gamblekill();
				end
			elseif (victim == lp.Name) then
				-- remember to punish the user
				gambledeath();
			end
			
			-- make the killer speak
			if (killer ~= lp.Name and killer) then
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
	-- removed peppa pig it was too annoying for me
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
	
	-- 20/09/27
	sound.load("davinky", 'rbxassetid://5727888030'); -- da vinky?????
	sound.load("bababooey", 'rbxassetid://4935133272'); -- bruh bruh booey
	sound.load("ouch", 'rbxassetid://12222058'); -- ouch!
	sound.load("femur", 'rbxassetid://4620905105'); -- huhuhuhuh aaaaaaaaaaahhhhhhhhh
	
	--------------------------------
	PF.Chat:out("PNF", "PhantomNotFunny by Centurian : Version " .. version, Color3.new(0, 1));
	PF.Chat:out("PNF", "Say \"/pnf help\" to see commands", Color3.new(0, 1));
	PF.Chat:out("PNF", gamble(blackreadymessages), Color3.new(1, 1));
	
	init();
end
