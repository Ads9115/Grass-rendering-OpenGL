#version 330 core
out vec4 FragColor;


in vec2 TexCoord;
in vec3 Normal;
in vec3 FragPos;


uniform vec3 lightDir;
uniform vec3 lightColor;
uniform vec3 viewPos;

void main()
{
    // Blade Shaping Logic
    if (abs(TexCoord.x - 0.5) > (1.0 - TexCoord.y) * 0.5)
    {
        discard;
    }
    
    // Base Color Gradient
    vec3 bottomColor = vec3(0.0, 0.5, 0.0);
    vec3 topColor = vec3(0.7, 0.9, 0.2);
    vec3 objectColor = mix(bottomColor, topColor, TexCoord.y);

    
    // Ambient lighting
    float ambientStrength = 0.1; // Reduced ambient for more contrast
    vec3 ambient = ambientStrength * lightColor;
  	
    // Diffuse lighting
    vec3 norm = normalize(Normal);
    vec3 lightDirection = normalize(-lightDir);
    float diff = max(dot(norm, lightDirection), 0.0);
    vec3 diffuse = diff * lightColor;

    
    // This creates the shiny highlight.
    float specularStrength = 0.5; // How strong the highlight is
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(-lightDirection, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32); // 32 is the shininess
    vec3 specular = specularStrength * spec * lightColor;
    
    // Final color result (add the new specular component)
    vec3 result = (ambient + diffuse + specular) * objectColor;
    FragColor = vec4(result, 1.0);
}