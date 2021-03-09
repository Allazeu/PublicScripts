local v3 = Vector3.new;

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
				
				sound.rawplay("rbxassetid://269252174", {par = corpse.HumanoidRootPart});
			end,
		},
		
		{
			name = "levitate",
			description = "fly away!",

			sounds = { },

			fn = function(corpse)
				for _, v in next, corpse:GetChildren() do
					--v.CanCollide = false;
					v.Anchored = false;
					v.Massless = true;
				end
				
				local bv = Instance.new('BodyVelocity', corpse.HumanoidRootPart, {
					MaxForce = v3(0, 40000, 0);
					Velocity = v3(0, 50, 0);
					P = 1000;
				});
			end,
		}
	};
	
	local api = { };
	local random = Random.new(tick());
	
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
