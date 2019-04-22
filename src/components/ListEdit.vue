<template>
  <div>
    <div class="list-edit-overlay" @click="close()"></div>
    <div class="list-edit" :style="{width:`${width}px`, left:`${left}px`}">
      <textarea v-model="text" ref="textarea" @keyup.esc.exact="close()" @keyup.alt.enter.exact="close()"></textarea>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    width:{
      default: 300
    },
    left:{
      default: 0
    },
    list:{
      default: []
    }
  },
  created(){
    this.text = this.list.join('\n')
  },
  mounted(){
    this.$refs.textarea.focus()
  },
  data: function(){
    return {
      text: ''
    }
  },
  methods:{
    close(){
      this.$emit('close', this.text.trim().split('\n').filter(l => l.trim() !== ''))
    }
  }
};
</script>

<style>
.list-edit-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(255, 255, 255, 0.4);
  z-index:500;
}

.list-edit{
  position: fixed;
  top:0;
  bottom:0;
  background-color: #fff;
  border:2px solid #ccc;
  z-index: 510;
}

.list-edit textarea{
  height:100%;
  font-size:20px;
  border:none;
  width:100%;
  resize: none;
  outline: none;
  line-height: 1.8;
}
</style>
