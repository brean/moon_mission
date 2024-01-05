<script lang="ts">
  import { useTexture } from "@threlte/extras";
  import { T } from "@threlte/core";
  import { BoxGeometry, CubeTextureLoader, BackSide } from "three";
  import { writable } from "svelte/store";

  const size = 15000;
  const skyboxGeo = new BoxGeometry(size, size, size);
  const starfield = [
    "/starfield/front.png",
    "/starfield/back.png",
    "/starfield/left.png",
    "/starfield/right.png",
    "/starfield/top.png",
    "/starfield/bottom.png",
  ];

  const loader = new CubeTextureLoader();
  let loaded = writable<boolean>(false);
  const texture = loader.load(starfield, function () {
    $loaded = true;
  });
</script>

{#if $loaded}
  <T.Mesh {skyboxGeo}>
    <T.MeshBasicMaterial map={texture} side={BackSide} />
  </T.Mesh>
{/if}
