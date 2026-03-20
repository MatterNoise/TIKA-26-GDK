local TikaInput = {}

function TikaInput:GetMouseInput()
	local mouse_x, mouse_y, mouse_left_button, mouse_middle_button, mouse_right_button, mouse_scroll_x, mouse_scroll_y = mouse()

	return {x = mouse_x, y = mouse_y,
			left_button = mouse_left_button,
			middle_button = mouse_middle_button,
			right_button = mouse_right_button,
			scroll_x = mouse_scroll_x,
			scroll_y = mouse_scroll_y
	}
end