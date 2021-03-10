local v3 = Vector3.new;
local random = Random.new(tick());

return function(Instance, sound)
	local effects = {
		{
			name = "scorching",
			description = "playing with fire",
			
			sounds = {"rbxassetid://269252174"},
			
			fn = function(corpse)
				for _, v in next, corpse:GetChildren() do
					if (v:IsA('BasePart')) then
						local fire = Instance.new('Fire', v, {
							Heat = 9,
							Size = 5,
						});
						
						v.BrickColor = BrickColor.Black();
					end
				end
				
				sound.rawplay("rbxassetid://269252174", {par = corpse.Head});
			end,
		},
		
		{
			name = "levitate",
			description = "fly away!",

			sounds = { },

			fn = function(corpse)
				for _, v in next, corpse:GetChildren() do
					if (v:IsA('BasePart')) then
						local weld = Instance.new('Weld', corpse.Head, {
							C0 = corpse.Head.CFrame:inverse() * v.CFrame,
							Part0 = corpse.Head,
							Part1 = v
						});
						
						v.Anchored = false;
						v.Massless = true;
					end
				end
				
				local bv = Instance.new('BodyVelocity', corpse.Head, {
					MaxForce = v3(0, 40000, 0);
					Velocity = v3(0, 50, 0);
					P = 1000;
				});
			end,
		},
		
		{
			name = "lightning",
			description = "what!??! lightning?!?!!",

			sounds = {"rbxassetid://858154930"},

			fn = function(corpse)
				local head = corpse.Head;
				local bolt = Instance.new('Part', workspace, {
					BrickColor = BrickColor.new("New Yeller"),
					Material = Enum.Material.Neon,
					Anchored = true,
					CanCollide = false,
					CastShadow = false,
					Size = v3(3, 500, 3)
				});
				
				bolt.Position = v3(head.Position.x + random:NextNumber(-1, 1), head.Position.y + 250, head.Position.z + random:NextNumber(-1, 1));
				sound.rawplay("rbxassetid://858154930", {par = head});
				
				game:GetService('Debris'):AddItem(bolt, 0.25);
			end,
		},
	};
	
	local api = { };
	
	function api.get(name)
		local element;
		for _, v in next, effects do
			if (v.name == name) then
				element = v;
				break;
			end
		end
		
		return element;
	end
	
	function api.random()
		return effects[random:NextInteger(1, #effects)];
	end
	
	for _, v in next, effects do
		for _, snd in next, v.sounds do
			sound.load(nil, snd);
		end
	end
	
	return api;
end
