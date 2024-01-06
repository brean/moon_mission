<script lang="ts">
  import { interactivity, useTexture } from "@threlte/extras";
  import { T } from "@threlte/core";
  import { SphereGeometry, Vector2, Vector3 } from "three";
  import fragmentShader from "./fragment.glsl?raw";
  import vertexShader from "./vertex.glsl?raw";

  const radius = 100;
  const segments = 50;
  const texture = useTexture("/maps/moon.jpg");
  const normal = useTexture("/maps/normal.jpg");
  const assets = Promise.all([texture, normal]);
  const moonGeo = new SphereGeometry(radius, segments, segments);
  moonGeo.computeTangents();
  const light = {
    speed: 0.1,
    distance: 100,
    position: new Vector3(1000, 1000, 1000),
  };
  interactivity();
</script>

{#await assets then [t, n]}
  <T.Mesh geometry={moonGeo} rotation.y={180} position={[0, 0, 0]}>
    <T.ShaderMaterial
      {fragmentShader}
      {vertexShader}
      uniforms={{
        lightPosition: {
          type: "v3",
          value: light.position,
        },
        textureMap: {
          type: "t",
          value: t,
        },
        normalMap: {
          type: "t",
          value: n,
        },
        uvScale: {
          type: "v2",
          value: new Vector2(1.0, 1.0),
        },
      }}
    />
  </T.Mesh>
{/await}
