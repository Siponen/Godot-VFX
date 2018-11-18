shader_type spatial;

float rand(float n){return fract(sin(n) * 43758.5453123);}

float noise(float p){
	float fl = floor(p);
  float fc = fract(p);
	return mix(rand(fl), rand(fl + 1.0), fc);
}
	

void fragment()
{

	vec2 pos = gl_FragCoord.xy / resolution.xy;
	pos = pos * 2. - 1.;
	pos.x *= resolution.x / resolution.y;
	
	const int count = 10;
	vec3 f = vec3(0.);
	for(int i = 0; i < count; i++){
		
		float t = time * 1.25 - float(i) * 1.;
		vec2 c = vec2(cos(t), sin(t * 2.) / 2.);
		//c.y *= noise(float(i) + time) * 1.;
	
	
		float rad = 0.2;
	
		float p = (float(i)) / float(count);
		f += vec3(.2, 1., 1.) * 1. / distance(c, pos) * rad;
	}
	f /= float(count);
	
	gl_FragColor = vec4(f, 1.);
}