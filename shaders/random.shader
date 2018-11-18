shader_type spatial;

vec3 particle( vec2 uv, vec2 offset )
{
     float t = pow( 1.0 / abs( (length(uv + offset)) * 30.0 ), 3.0);
     vec3 finalColor = vec3( 2.0 * t, 6.0 * t, 8.0 * t );
    
     return finalColor;
}

void fragment() {
	vec2 uv = UV;
	uv.x *= UV.x / UV.x;
	
	vec3 finalColor = vec3( 0.0 );    
	finalColor += particle( uv, vec2(-0.2, -0.25 ) );
	ALBEDO = finalColor;
}