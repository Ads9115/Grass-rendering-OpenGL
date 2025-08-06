#version 330 core

out vec4 FragColor;

in vec2 TexCoord;


void main() {

 if (abs(TexCoord.x - 0.5) > (1.0 - TexCoord.y) * 0.5)
    {
        discard; // Tell the GPU to not draw this pixel at all.
    }
vec3 bottomColor = vec3(0.0, 0.5, 0.0);
    vec3 topColor = vec3(0.7, 0.9, 0.2);
    vec3 finalColor = mix(bottomColor, topColor, TexCoord.y);

    FragColor = vec4(finalColor, 1.0);

}