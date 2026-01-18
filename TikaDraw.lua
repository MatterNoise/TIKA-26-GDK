local TikaDraw = {}

function TikaDraw:DrawPixel(get_pixel_position, get_pixel_color)
	pix(get_pixel_position.x, get_pixel_position.y, get_pixel_color)
end

function TikaDraw:DrawLine(get_line_start, get_line_end, get_line_color)
	line(get_line_start.x, get_line_start.y, get_line_end.x, get_line_end.y, get_line_color)
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