#version 410

// Global variables for lighting calculations
uniform vec3 viewPos;
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
    vec3 N = normalize(fragNormal);
    if(dot(N, viewPos) < 0.0) {
        N = -N;
    }
    // Output the normal as color
    // outColor = vec4(abs(fragNormal), 1.0);
    outColor = vec4(kd * lightColor * dot(N, lightPos), 1); 
}