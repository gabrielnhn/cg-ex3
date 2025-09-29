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
    float diff[discrete_steps];
    for(int i = 0; i < discrete_steps; i++)
    {
        diff[i] = kd * (i/discrete_steps);
    }

    vec3 diffuse = kd; 


    outColor = vec4(diffuse * lightColor * dot(fragNormal, lightPos), 1); 
}