#version 330 core
layout (location = 0) in vec3 aPos;

out vec3 TexCoords;

uniform mat4 projection;
uniform mat4 view;

void main()
{
    TexCoords = aPos;
    
    // First, cast to a mat3 to remove the translation components,
    // then cast it back to a mat4 to make it compatible for multiplication.
    mat4 viewNoTranslation = mat4(mat3(view)); 
    vec4 pos = projection * viewNoTranslation * vec4(aPos, 1.0);
    //skybox is always drawn at the farthest possible depth
    gl_Position = pos.xyww; 
}