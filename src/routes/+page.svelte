<script lang="ts">
  import Drawer, { AppContent, Content } from "@smui/drawer";
  import List, { Item, Text } from "@smui/list";
  import { Canvas, T } from "@threlte/core";
  import Grid from "../components/Grid.svelte";
  import Skybox from "../components/Skybox.svelte";
  import Moon from "../components/Moon.svelte";

  let mission_name = "nothing";
</script>

<div class="app">
  <div class="drawer-container">
    <Drawer>
      <Content>
        <h2>Select mission</h2>
        <List>
          <Item
            href="javascript:void(0)"
            on:click={() => (mission_name = "Aristarchus")}
          >
            <Text>Aristarchus</Text>
          </Item>
        </List>
        <List>
          <Item
            href="javascript:void(0)"
            on:click={() => (mission_name = "Orientale")}
          >
            <Text>Orientale</Text>
          </Item>
        </List>
      </Content>
    </Drawer>

    <AppContent class="app-content">
      <main class="main-content">
        <Canvas
          shadows
          size={{
            height: 600,
            width: 800,
          }}
          rendererParameters={{ logarithmicDepthBuffer: true }}
        >
          <T.PerspectiveCamera
            makeDefault
            let:ref={camera}
            position={[0, 0, 800]}
            fov={35}
            near={1}
            far={65536}
          ></T.PerspectiveCamera>

          <Moon />
        </Canvas>
      </main>
    </AppContent>
  </div>
</div>

<style>
  /* These classes are only needed because the
    drawer is in a container on the page. */
  .drawer-container {
    position: absolute;
    display: flex;
    height: 100%;
    width: 100%;
    overflow: hidden;
    z-index: 0;
  }

  .app {
    position: absolute;
    width: 100%;
    height: 100%;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
  }

  * :global(.app-content) {
    flex: auto;
    overflow: auto;
    width: 100%;
    position: relative;
    flex-grow: 1;
  }

  .main-content {
    overflow: auto;
    padding: 16px;
    height: 100%;
    box-sizing: border-box;
  }
</style>
