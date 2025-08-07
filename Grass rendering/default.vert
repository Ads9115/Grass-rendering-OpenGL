#version 330 core


layout (location = 0) in vec3 aPos;    
layout (location = 1) in vec2 aTexCoord;

layout (location = 2) in mat4 aInstanceMatrix;


out vec2 TexCoord;


uniform mat4 projection;
uniform mat4 view;
uniform float time;

void main()
{
	TexCoord = aTexCoord;
	

	vec3 animatedPos = aPos;
	
	
	float displacement = sin(time * 4.0 + aInstanceMatrix[3].x) * 0.02 * aTexCoord.y;
	animatedPos.x += displacement;
	

	gl_Position = projection * view * aInstanceMatrix * vec4(animatedPos, 1.0);
}