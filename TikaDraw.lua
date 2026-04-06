function TikaDrawPixel(get_pixel_position, get_pixel_color)
	pix(get_pixel_position.x, get_pixel_position.y, get_pixel_color)
end

function TikaDrawLine(get_line_start, get_line_end, get_line_color)
	line(get_line_start.x, get_line_start.y, get_line_end.x, get_line_end.y, get_line_color)
end

function TikaDrawCircle(get_circle_position, get_circle_radius, get_circle_color)
	circ(get_circle_position.x, get_circle_position.y, get_circle_radius, get_circle_color)
end

function TikaDrawTexturedTriangle(get_triangle_position_a, get_triangle_position_b, get_triangle_position_c, get_triangle_uv_a, get_triangle_uv_b, get_triangle_uv_c, get_texture_source, get_texture_chromakey)
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


function TikaDrawTransformedSprite(get_sprite_start_uv, get_sprite_end_uv, get_sprite_position, get_sprite_rotation, get_sprite_scale)
	local new_sprite_position = get_sprite_position or newTikaVector(0, 0)
	local new_sprite_scale = get_sprite_scale or newTikaVector(1, 1)
	local new_sprite_rotation = get_sprite_rotation or 0
	
	local sprite_position_va = newTikaVector(-0.5, -0.5)
	local sprite_position_vb = newTikaVector(-0.5, 0.5)
	local sprite_position_vc = newTikaVector(0.5, -0.5)
	local sprite_position_vd = newTikaVector(0.5, 0.5)
	
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
	
	TikaDrawTexturedTriangle(
		sprite_position_va,
		sprite_position_vb,
		sprite_position_vc,
		newTikaVector(get_sprite_start_uv.x, get_sprite_start_uv.y),
		newTikaVector(get_sprite_start_uv.x, get_sprite_end_uv.y),
		newTikaVector(get_sprite_end_uv.x, get_sprite_start_uv.y),
		0, 0
	)
	TikaDrawTexturedTriangle(
		sprite_position_vc,
		sprite_position_vd,
		sprite_position_vb,
		newTikaVector(get_sprite_end_uv.x, get_sprite_start_uv.y),
		newTikaVector(get_sprite_end_uv.x, get_sprite_end_uv.y),
		newTikaVector(get_sprite_start_uv.x, get_sprite_end_uv.y),
		0, 0
	)
end


function TikaDrawSprite(get_sprite_id, get_sprite_position, get_sprite_colorkey, get_sprite_scale, get_sprite_flip, get_sprite_rotation, get_composite_width, get_composite_height)
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

function TikaDrawTilemap(get_tilemap_position, get_tilemap_draw_limits, get_tilemap_screen_position, get_tilemap_colorkey, get_tilemap_draw_scale, get_remap_function)
	local new_tilemap_draw_limits = get_tilemap_draw_limits or newTikaVector(30, 17)
	local new_tilemap_screen_position = get_tilemap_screen_position or newTikaVector(0, 0)
	local new_tilemap_colorkey = get_tilemap_colorkey or 0
	local new_tilemap_draw_scale = get_tilemap_draw_scale or 1

	map(get_tilemap_position.x, get_tilemap_position.y,
		new_tilemap_draw_limits.x, new_tilemap_draw_limits.y,
		new_tilemap_screen_position.x, new_tilemap_screen_position.y,
		new_tilemap_colorkey, new_tilemap_draw_scale
	)
end