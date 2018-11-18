shader_type spatial;



float random (vec2 texCoords) {
    return fract(sin(dot(texCoords.xy,vec2(10.9898,78.233)))*93758.5453123);
}

void vertex()
{
	
}

void fragment() {
	vec2 tileStep = UV.xy/vec2(32,32);
	
	
	ALBEDO = vec3(1,1,0);
	//ALBEDO = vec3(tileStep.x, tileStep.y,tileStep.z);
}