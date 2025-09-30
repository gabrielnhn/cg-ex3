#version 410

// Global variables for lighting calculations
// uniform vec3 viewPos;
uniform vec3 lightPos;
uniform vec3 lightColor;
uniform vec3 kd;

// Output for on-screen color
out vec4 outColor;

// Interpolated output data from vertex shader
in vec3 fragPos; // World-space position
in vec3 fragNormal; // World-space normal

void main()
{
    vec3 L = normalize(lightPos - fragPos);
    

    outColor = vec4(kd * lightColor * dot(fragNormal, L), 1); 
}