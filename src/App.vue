<template>
  <div id="app">
    <button @click="handleClick">欢迎点击</button>
  </div>
</template>

<script>
export default {
  name: "App",
  methods: {
    handleClick() {
      alert("你好呀，欢迎来到 vue-docker 世界！");
    },
  },
};
</script>
