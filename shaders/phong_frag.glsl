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
    vec3 V = normalize(viewPos - fragPos);
    vec3 L = normalize(lightPos - fragPos);
    vec3 N = normalize(fragNormal);
    if(dot(N, V) < 0.0) {
        N = -N;
    }

    vec3 reflection = 2 * dot(L, N) * N - L;
    float specular = clamp(dot(reflection, V), 0, 1); 
    outColor = vec4(ks * lightColor * pow(specular, shininess), 1.0); 
}