#version 410

// Global variables for lighting calculations
// uniform vec3 viewPos;
uniform vec3 lightPos;
uniform vec3 lightColor;
uniform vec3 kd;
uniform int discrete_steps;

// Output for on-screen color
out vec4 outColor;

// Interpolated output data from vertex shader
in vec3 fragPos; // World-space position
in vec3 fragNormal; // World-space normal
void main()
{
    
    vec3 L = normalize(lightPos - fragPos);
    vec3 precolor = vec3(kd * lightColor * dot(fragNormal, L)); 
    

    // quantized
    vec3 postcolor = floor(precolor * discrete_steps) / discrete_steps; 
    outColor = vec4(postcolor, 1.0);
}