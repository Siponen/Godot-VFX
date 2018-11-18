shader_type spatial;
/* discontinuous pseudorandom uniformly distributed in [-0.5, +0.5]^3 */
vec3 random3(vec3 c) {
	float j = 4096.0*sin(dot(c,vec3(17.0, 59.4, 15.0)));
	vec3 r;
	r.z = fract(512.0*j);
	j *= .125;
	r.x = fract(512.0*j);
	j *= .125;
	r.y = fract(512.0*j);
	return r-0.5;
}

/* skew constants for 3d simplex functions */
uniform float F3 =  0.3333333;
uniform float G3 =  0.1666667;

vec2 hash( vec2 p )
{
	p = vec2( dot(p,vec2(127.1,311.7)),
			 dot(p,vec2(269.5,183.3)) );
	return -1.0 + 2.0*fract(sin(p)*43758.5453123);
}

float noise( in vec2 p )
{
	float K1 = 0.366025404; // (sqrt(3)-1)/2;
	float K2 = 0.211324865; // (3-sqrt(3))/6;
	
	vec2 i = floor( p + (p.x+p.y)*K1 );
	
	vec2 a = p - i + (i.x+i.y)*K2;
	vec2 o = (a.x>a.y) ? vec2(1.0,0.0) : vec2(0.0,1.0);
	vec2 b = a - o + K2;
	vec2 c = a - 1.0 + 2.0*K2;
	
	vec3 h = max( 0.5-vec3(dot(a,a), dot(b,b), dot(c,c) ), vec3(0.0) );
	vec3 n = h*h*h*h*vec3( dot(a,hash(i+0.0)), dot(b,hash(i+o)), dot(c,hash(i+1.0)));
	return dot( n, vec3(70.0) );
}

float fbm(vec2 uv)
{
	float f;
	mat2 m = mat2( vec2(1.6,  1.2), vec2(-1.2,  1.6));
	f  = 0.5000*noise( uv ); uv = m*uv;
	f += 0.2500*noise( uv ); uv = m*uv;
	f += 0.1250*noise( uv ); uv = m*uv;
	f += 0.0625*noise( uv ); uv = m*uv;
	f = 0.5 + 0.5*f;
	return f;
}

void fragment()
{
	vec2 pos=UV;
	pos.x*=UV.x/UV.x;
	pos*=40.0;
	
	float ang=atan(pos.y, pos.x);
	ang=abs(ang);
	pos-=5.0*TIME*normalize(vec2(pos.x*sin(ang), pos.y*sin(ang)));
	
	float dis=length(pos);
	float col=(sin(dis)+1.0)*fbm(pos);
	vec3 color=vec3(col*0.79, pow(col, 3.0)*0.21, pow(col, 5.0)*0.99);
	ALBEDO=color;
}