#version 410

// Global variables for lighting calculations
uniform vec3 viewPos;
uniform vec3 lightPos;
uniform vec3 lightColor;
// uniform vec3 kd;
uniform vec3 ks;
uniform float shininess;

// Output for on-screen color
out vec4 outColor;

// Interpolated output data from vertex shader
in vec3 fragPos; // World-space position
in vec3 fragNormal; // World-space normal

void main()
{
    // vec3 a = ks;
    // Ensure the normal is always oriented towards the viewer
    vec3 N = normalize(fragNormal);
    if(dot(N, viewPos) < 0.0) {
        N = -N;
    }

    vec3 H = lightPos + viewPos;
    H = normalize(H);

    // vec3 reflection = 2 * dot(lightPos, fragNormal) * fragNormal - lightPos;
    // float specular = clamp(dot(reflection, viewPos), 0, 1); 
    outColor = vec4(lightColor * pow(dot(H,N), shininess), 1.0); 
}