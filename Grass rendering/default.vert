#version 330 core


layout (location = 0) in vec3 aPos;    
layout (location = 1) in vec2 aTexCoord;

layout (location = 2) in mat4 aInstanceMatrix;


out vec2 TexCoord;
out vec3 Normal;
out vec3 FragPos;


uniform mat4 projection;
uniform mat4 view;
uniform float time;

void main()
{
	TexCoord = aTexCoord;
	

	vec3 animatedPos = aPos;

	FragPos = vec3(aInstanceMatrix * vec4(animatedPos, 1.0));
  
    Normal = mat3(transpose(inverse(aInstanceMatrix))) * vec3(0.0, 1.0, 0.0);
	
	
	float displacement = sin(time * 4.0 + aInstanceMatrix[3].x) * 0.02 * aTexCoord.y;
	animatedPos.x += displacement;
	

	gl_Position = projection * view * aInstanceMatrix * vec4(animatedPos, 1.0);
}