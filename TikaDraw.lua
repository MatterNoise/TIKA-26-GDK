local TikaDraw = {}

function TikaDraw:DrawPixel(get_pixel_position, get_pixel_color)
	pix(get_pixel_position.x, get_pixel_position.y, get_pixel_color)
end

function TikaDraw:DrawLine(get_line_start, get_line_end, get_line_color)
	line(get_line_start.x, get_line_start.y, get_line_end.x, get_line_end.y, get_line_color)
end

function TikaDraw:DrawTexturedTriangle(get_triangle_position_a, get_triangle_position_b, get_triangle_position_c, get_triangle_uv_a, get_triangle_uv_b, get_triangle_uv_c, get_texture_source, get_texture_chromakey)
	local new_texture_source = get_texture_source or 0
	local new_texture_chromakey = get_texture_chromakey or -1
	
	ttri(get_triangle_position_a.x, get_triangle_position_a.y,
		 get_triangle_position_b.x, get_triangle_position_b.y,
		 get_triangle_position_c.x, get_triangle_position_c.y,
		 get_triangle_uv_a.x, get_triangle_uv_a.y,
		 get_triangle_uv_b.x, get_triangle_uv_b.y,
		 get_triangle_uv_c.x, get_triangle_uv_c.y,
		 new_texture_source, new_texture_chromakey
	)
end


function TikaDraw:DrawTransformedSprite(get_sprite_start_uv, get_sprite_end_uv, get_sprite_position, get_sprite_rotation, get_sprite_scale)
	local new_sprite_position = get_sprite_position or TikaVector:CreateVector(0, 0)
	local new_sprite_scale = get_sprite_scale or TikaVector:CreateVector(1, 1)
	local new_sprite_rotation = get_sprite_rotation or 0
	
	local sprite_position_va = TikaVector:CreateVector(-0.5, -0.5)
	local sprite_position_vb = TikaVector:CreateVector(-0.5, 0.5)
	local sprite_position_vc = TikaVector:CreateVector(0.5, -0.5)
	local sprite_position_vd = TikaVector:CreateVector(0.5, 0.5)
	
	sprite_position_va = TikaVector:RotateVector2D(sprite_position_va, new_sprite_rotation)
	sprite_position_vb = TikaVector:RotateVector2D(sprite_position_vb, new_sprite_rotation)
	sprite_position_vc = TikaVector:RotateVector2D(sprite_position_vc, new_sprite_rotation)
	sprite_position_vd = TikaVector:RotateVector2D(sprite_position_vd, new_sprite_rotation)
	
	sprite_position_va = TikaVector:ScaleVectorV(sprite_position_va, new_sprite_scale)
	sprite_position_vb = TikaVector:ScaleVectorV(sprite_position_vb, new_sprite_scale)
	sprite_position_vc = TikaVector:ScaleVectorV(sprite_position_vc, new_sprite_scale)
	sprite_position_vd = TikaVector:ScaleVectorV(sprite_position_vd, new_sprite_scale)
	
	sprite_position_va = TikaVector:TranslateVectorV(sprite_position_va, new_sprite_position)
	sprite_position_vb = TikaVector:TranslateVectorV(sprite_position_vb, new_sprite_position)
	sprite_position_vc = TikaVector:TranslateVectorV(sprite_position_vc, new_sprite_position)
	sprite_position_vd = TikaVector:TranslateVectorV(sprite_position_vd, new_sprite_position)
	
	TikaDraw:DrawTexturedTriangle(
		sprite_position_va,
		sprite_position_vb,
		sprite_position_vc,
		TikaVector:CreateVector(get_sprite_start_uv.x, get_sprite_start_uv.y),
		TikaVector:CreateVector(get_sprite_start_uv.x, get_sprite_end_uv.y),
		TikaVector:CreateVector(get_sprite_end_uv.x, get_sprite_start_uv.y),
		0, 0
	)
	TikaDraw:DrawTexturedTriangle(
		sprite_position_vc,
		sprite_position_vd,
		sprite_position_vb,
		TikaVector:CreateVector(get_sprite_end_uv.x, get_sprite_start_uv.y),
		TikaVector:CreateVector(get_sprite_end_uv.x, get_sprite_end_uv.y),
		TikaVector:CreateVector(get_sprite_start_uv.x, get_sprite_end_uv.y),
		0, 0
	)
end


function TikaDraw:DrawSprite(get_sprite_id, get_sprite_position, get_sprite_colorkey, get_sprite_scale, get_sprite_flip, get_sprite_rotation, get_composite_width, get_composite_height)
	local new_sprite_colorkey = get_sprite_colorkey or 0
	local new_sprite_scale = get_sprite_scale or 1
	local new_sprite_flip = get_sprite_flip or 0
	local new_sprite_rotation = get_sprite_rotation or 0
	local new_composite_width = get_composite_width or 1
	local new_composite_height = get_composite_height or 1
	
	spr(get_sprite_id, get_sprite_position.x,
	                   get_sprite_position.y,
					   new_sprite_colorkey,
					   new_sprite_scale,
					   new_sprite_flip,
					   new_sprite_rotation,
					   new_composite_width,
					   new_composite_height
	)
end