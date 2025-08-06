#version 330 core

// INPUTS
layout (location = 0) in vec3 aPos;      // The local position of a vertex on the grass blade model
layout (location = 1) in vec2 aTexCoord;
// --- UPDATE: We now take a full model matrix as the instance attribute ---
layout (location = 2) in mat4 aInstanceMatrix;

// OUTPUT
out vec2 TexCoord;

// UNIFORMS (from C++)
uniform mat4 projection;
uniform mat4 view;
uniform float time;

void main()
{
	TexCoord = aTexCoord;
	
	// 1. Start with the original vertex position.
	vec3 animatedPos = aPos;
	
	// 2. Apply wind animation locally.
    // We use the instance matrix's position to vary the wind.
	float displacement = sin(time * 4.0 + aInstanceMatrix[3].x) * 0.02 * aTexCoord.y;
	animatedPos.x += displacement;
	
	// 3. Transform the animated local position by the instance's model matrix,
    //    then by the view and projection matrices. This is much cleaner.
	gl_Position = projection * view * aInstanceMatrix * vec4(animatedPos, 1.0);
}