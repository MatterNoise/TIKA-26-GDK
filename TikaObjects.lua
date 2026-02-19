local TikaObjects = {}

function TikaObjects:InitNewObject(get_object_type)
	local new_object_type = get_object_type or "Object"
	
	local new_object = {
			-- Function declaration
			CreateCallRequest = TikaObjects_CreateCallRequest,
			
			-- Variable declaration			
			object_type = new_object_type,
			
			parent_scene = nil,
			execution_id = nil,
	}
	
	return new_object
end

function TikaObjects:InitNewScene(get_scene_name)
	local new_scene_name = get_scene_name or "SceneName"
	
	local new_scene = {
			-- Function declaration
			AddObject = TikaObjects_AddObject,
			DeleteObject = TikaObjects_DeleteObject,
			FetchObjectsFunction = TikaObjects_FetchObjectsFunction,
			FetchCallRequests = TikaObjects_FetchCallRequests,
			
			-- Variable declaration
			callable_functions = {},
			
			call_requests = {},
			scene_objects = {},
			
			scene_name = new_scene_name,
	}
	
	-- Creates the default callable functions for the objects inside the scene
	new_scene.callable_functions = {
				["AddObject"] = function (get_object_id) new_scene.AddObject(new_scene, get_object_id) end,
				["DeleteObject"] = function (get_object_id) new_scene.DeleteObject(new_scene, get_object_id) end,
	}
	
	return new_scene
end

-- Objects-exclusive functions
function TikaObjects_CreateCallRequest(get_object, get_function_call, ...)
	local get_request_arguntents = {...}
	
	Insert(get_object.parent_scene.call_requests, {
	       target_object_id = get_object.execution_id,
		   target_function = get_function_call,
		   function_request_arguntents = get_request_arguntents,
	})
end

-- Scenes-exclusive functions

function TikaObjects_AddObject(get_scene, get_new_object)
	Insert(get_scene.scene_objects, get_new_object)
	
	get_new_object.parent_scene = get_scene
end

function TikaObjects_DeleteObject(get_scene, get_object_id)
	Remove(get_scene.scene_objects, get_object_id)
end

function TikaObjects_FetchObjectsFunction(get_scene, get_objects_function)
	if #get_scene.scene_objects < 1 then
		return
	end
	
	local current_object
	for i_scene_objects = 1, #get_scene.scene_objects do
		current_object = get_scene.scene_objects[i_scene_objects]
		
		-- Execute the In-Object function
		current_object.execution_id = i_scene_objects
		current_object[get_objects_function](current_object)
	end
end

function TikaObjects_FetchCallRequests(get_scene, call_requests_table)
	if #call_requests_table < 1 then
		return
	end
	
	local callable_function_lookup = get_scene.callable_functions
	
	for i_call_request = 1, #call_requests_table do
		local target_object_id = call_requests_table[i_call_request].target_object_id
		local target_function = call_requests_table[i_call_request].target_function
		local target_function_arguments = call_requests_table[i_call_request].function_request_arguntents
		
		--trace( target_object_id .. " : " .. target_function_arguments[1])
		
		callable_function_lookup[target_function](target_function_arguments[1],
		                                          target_function_arguments[2],
												  target_function_arguments[3],
												  target_function_arguments[4],
												  target_function_arguments[5]
												  )
		
	end
end

-- Set the "TIKA_DEFAULT_CALLABLES" table with the TikaObject