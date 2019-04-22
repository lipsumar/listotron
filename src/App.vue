<template>
  <div id="app">
    
    <SentenceGenerator></SentenceGenerator>
    
    <div class="master-regenerate">
      <IconRegenerate @click="regenerate()"></IconRegenerate>
    </div>
  </div>
</template>

<script>
import SentenceGenerator from './components/SentenceGenerator.vue'
import IconRegenerate from './components/icons/Regenerate'
import globalEventBus from './globalEventBus.js'

export default {
  name: 'app',
  methods:{
    regenerate(){
      globalEventBus.$emit('regenerate')
    }
  },
  components: {
    SentenceGenerator,
    IconRegenerate
  }
}
</script>

<style>

*{
  box-sizing: border-box;
}
html,body{
  width:100%;
  height:100%;
  padding:0;
  margin: 0;
}

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;

  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.master-regenerate{
  position: fixed;
  bottom:1rem;
  left:50%;
  margin-left:-12px;
  opacity: 0.7;
  cursor: pointer;
}
.master-regenerate:hover{
  opacity: 1;
}
</style>
