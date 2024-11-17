shader_type canvas_item;
	
	uniform vec2 blur_amount = vec2(0.01, 0.01);

void fragment(){
	vec4 color_up = texture(TEXTURE, UV + vec2(0.0, blur_amount.y));
	vec4 color_dn = texture(TEXTURE, UV + vec2(0.0, -blur_amount.y));
	vec4 color_lf = texture(TEXTURE, UV + vec2(-blur_amount.x, 0.0));
	vec4 color_rt = texture(TEXTURE, UV + vec2(0.0, blur_amount.x));
	
	COLOR = (color_up + color_dn + color_lf + color_rt) / 15.0;
}