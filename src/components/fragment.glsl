uniform sampler2D textureMap;
uniform sampler2D normalMap;

varying vec2 vUv;
varying mat3 tbn;
varying vec3 vLightVector;

void main() {
  /** Transform texture coordinate of normal map to a range (-1, 1) */
  vec3 normalCoordinate = texture2D(normalMap, vUv).xyz * 2.0 - 1.0;

  /** Transform the normal vector in the RGB channels to tangent space */
  vec3 normal = normalize(tbn * normalCoordinate.rgb);

  /** Lighting intensity is calculated as dot of normal vector and 
      the vertex-to-light vector */
  float intensity = max(0.07, dot(normal, vLightVector));
  vec4 lighting = vec4(intensity, intensity, intensity, 1.0);

  /** Final color is calculated with the lighting applied */
  gl_FragColor = texture2D(textureMap, vUv) * lighting;
}