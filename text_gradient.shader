shader_type canvas_item;
render_mode unshaded;

uniform float intensity;

uniform bool x;
uniform vec4 color_horizontal_left: source_color = vec4(1.0);
uniform vec4 color_horizontal_right: source_color = vec4(1.0);

uniform bool y;
uniform vec4 color_vertical_top: source_color = vec4(1.0);
uniform vec4 color_vertical_bottom: source_color = vec4(1.0);

void fragment()
{
	float texture_alpha = texture(TEXTURE, UV).a;

	if (texture_alpha > 0.0)
	{
		if (x == true)
		{
			COLOR = COLOR * mix(color_horizontal_left, color_horizontal_right, UV.x * intensity);
			COLOR.a *= texture_alpha;
		}
		if (y == true)
		{
			COLOR = COLOR * mix(color_vertical_top, color_vertical_bottom, UV.y * intensity);
			COLOR.a *= texture_alpha;
		}
	}
	else
	{ 
		COLOR = texture(TEXTURE, UV);
	}
}
