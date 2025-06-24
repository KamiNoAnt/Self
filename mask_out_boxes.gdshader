shader_type canvas_item;

uniform vec4 chroma_key : source_color = vec4(1.0, 0.0, 1.0, 1.0);
uniform float intensity : hint_range(0.0, 1.0) = 0.1;

uniform vec4 chroma_key_1 : source_color = vec4(1.0, 0.0, 1.0, 1.0);
uniform vec4 chroma_color_1 : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float intensity_1 : hint_range(0.0, 1.0) = 0.1;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	
	vec3 color_diff = abs(tex_color.rgb - chroma_key.rgb);
	vec3 color_diff_1 = abs(tex_color.rgb - chroma_key_1.rgb);
	
	float diff_magnitude = length(color_diff);
	float diff_magnitude_1 = length(color_diff_1);
	
	if (diff_magnitude_1 < intensity_1) {
		tex_color = chroma_color_1;
	}
	
	if (diff_magnitude < intensity) {
		discard;
	}
		
	
	COLOR = tex_color;
}