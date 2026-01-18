-- This is a Object template for the TIKA-26

function Object_Create()
	local Object = TikaObjects:InitNewObject("Object")
	-- You can also make a inherence with a
	-- Patern Object like this:
	-- "local <Child object> = <Patern object>_Create()"
	
	Object.Init = Object_Init
	Object.Process = Object_Process
	Object.Draw = Object_Draw
	
	return Object
end

function Object_Init(myself)
	-- Put your initialization code here!
end

function Object_Process(myself)
	-- Put your process code here!
end

function Object_Draw(myself)
	-- Put your drawing code here!
end

function Object_UsermadeFunc(myself)
	-- This is a example of a User-made function for a Object
	-- 
	-- Remember: Name your Object function like "<Object name>_DoSomething()"
	-- to avoid collision betwen diferent Objects functions
end