local TikaDraw = {}

function TikaDraw:DrawPixel(get_pixel_position, get_pixel_color)
	pix(get_pixel_position.x, get_pixel_position.y, get_pixel_color)
end

function TikaDraw:DrawLine(get_line_start, get_line_end, get_line_color)
	line(get_line_start.x, get_line_start.y, get_line_end.x, get_line_end.y, get_line_color)
end

function TikaDraw:DrawSprite(get_sprite_position)
	
end