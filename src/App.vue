<template>
  <div id="app">
    <button @click="handleClick">点击</button>
  </div>
</template>

<script>
export default {
  name: "App",
  methods: {
    handleClick() {
      console.log("点击事件触发");
      alert("清晨");
    },
  },
};
</script>
