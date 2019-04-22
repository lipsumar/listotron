<template>
  <div>
    <div class="sentence-item">
      <div class="sentence-item__main">{{displayWord}}</div>
      <div class="sentence-item__list" @click="openEditList()">Edit list</div>
    </div>
    <ListEdit v-if="isListEditOpen" :left="left" :width="width" @close="closeEditList" :list="list"></ListEdit>
  </div>
</template>

<script>
import globalEventBus from "../globalEventBus.js";
import ListEdit from './ListEdit'

export default {
  created() {
    globalEventBus.$on("regenerate", this.changeRandomWord.bind(this));
  },
  props: ["item"],
  data: function() {
    return {
      wordIndex: null,
      isListEditOpen: false,
      width: null,
      left: null,
      list: []
    };
  },
  methods: {
    changeRandomWord() {
      if(this.list.length === 0) return 0
      this.wordIndex = Math.floor(Math.random() * this.list.length);
    },

    openEditList() {
      this.width = this.$el.offsetWidth;
      this.left = this.$el.offsetLeft;
      this.isListEditOpen = true;
    },

    closeEditList(list){
      this.isListEditOpen = false
      this.list = list
      if(this.wordIndex ===  null || this.wordIndex > this.list.length-1){
        this.changeRandomWord()
      }
    }
  },
  computed: {
    displayWord() {
      if (this.list.length === 0) {
        return "???";
      }
      return this.list[this.wordIndex]
    }
  },
  components:{
    ListEdit
  }
};
</script>

<style>
.sentence-item {
  border: 2px solid #ccc;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom-left-radius: 19px;
  border-bottom-right-radius: 19px;

  width: 370px;
}
.sentence-item__main {
  min-height: 160px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 45px;
  padding: 0 10px;
}

.sentence-item__list {
  font-size: 15px;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 5px;
  border-top: 2px solid #ccc;
  cursor: pointer;
}
</style>
