<script lang="ts">
  import { useTexture } from "@threlte/extras";
  import { T } from "@threlte/core";
  import { SphereGeometry } from "three";

  const radius = 100;
  const segments = 50;
  const texture = useTexture("/maps/moon.jpg");
  const normal = useTexture("/maps/normal.jpg");
  const assets = Promise.all([texture, normal]);
  const moonGeo = new SphereGeometry(radius, segments, segments);
  moonGeo.computeTangents();
</script>

{#await assets then [t, n]}
  <T.Mesh {moonGeo} rotation.y={180}>
    <T.MeshStandardMaterial map={t} normalMap={n} />
  </T.Mesh>
{/await}
