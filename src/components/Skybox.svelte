<script lang="ts">
  import { useTexture } from "@threlte/extras";
  import { T } from "@threlte/core";
  import { BoxGeometry, BackSide, ShaderMaterial, ShaderLib } from "three";

  const size = 15000;
  const geometry = new BoxGeometry(size, size, size);

  const starfield = [
    useTexture("/starfield/front.png"),
    useTexture("/starfield/back.png"),
    useTexture("/starfield/left.png"),
    useTexture("/starfield/right.png"),
    useTexture("/starfield/top.png"),
    useTexture("/starfield/bottom.png"),
  ];
  const assets = Promise.all(starfield).then((textures) => {
    var cubemap = ShaderLib.cube;
    cubemap.uniforms.tCube.value = textures;
    return new ShaderMaterial({
      fragmentShader: cubemap.fragmentShader,
      vertexShader: cubemap.vertexShader,
      uniforms: cubemap.uniforms,
      depthWrite: false,
      side: BackSide,
    });
  });
</script>

{#await assets then material}
  <T.Mesh {geometry} {material} position={[0, 0, 0]}></T.Mesh>
{/await}
