shader_type spatial;

void fragment() {
	float r = sin(FRAGCOORD.y);
	ALBEDO = vec3(r,0,0);
}