#version 410

// Global variables for lighting calculations
uniform vec3 viewPos;
uniform vec3 lightPos;
uniform vec3 lightColor;
// uniform vec3 kd;
// uniform vec3 ks;
uniform float shininess;
uniform float threshold;

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

    vec3 H = L + V;
    H = normalize(H);

    float intensity = pow(dot(H,N), shininess);

    if (intensity > threshold)
        outColor = vec4(1, 1, 1, 1);
    else
        outColor = vec4(0, 0, 0, 1);
}