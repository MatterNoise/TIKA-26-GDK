
function SceneName_Create()
	local SceneName = TikaObject:InitNewScene("SceneName")
	-- You can also make a inherence with a
	-- Patern SceneName like this:
	-- "local <Child SceneName> = <Patern SceneName>_Create()"
	
	SceneName.Init = SceneName_Init
	SceneName.Process = SceneName_Process
	SceneName.Draw = SceneName_Draw
	
	return SceneName
end

function SceneName_Init(myself)
	myself.call_requests = {} --DON'T DELETE!; Clears the Scene-function calling request 
	
	-- Put your initialization code here!
	
	
	--
	-- Off-Limits!, This is the Scene-Objects Initializing handlers
	
	myself.FetchObjectsFunction(myself, "Init")
end

function SceneName_Process(myself)
	myself.call_requests = {} --DON'T DELETE!; Clears the Scene-function calling request 
	
	-- Put your initialization code here!
	
	
	--
	-- Off-Limits!, This is the Scene-Objects Processing handlers
	
	myself.FetchObjectsFunction(myself, "Process")
end

function SceneName_Draw(myself)
	myself.call_requests = {} --DON'T DELETE!; Clears the Scene-function calling request 
	
	-- Put your initialization code here!
	
	
	--
	-- Off-Limits!, This is the Scene-Objects Drawing handlers
	
	myself.FetchObjectsFunction(myself, "Draw")
end

function SceneName_UsermadeFunc(myself)
	-- This is a example of a User-made function for a SceneName
	-- 
	-- Remember: Name your SceneName function like "<SceneName name>_DoSomething()"
	-- to avoid collision betwen diferent SceneNames functions
end