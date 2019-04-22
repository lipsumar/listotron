<template>
  <div class="sentence-generator">
    <div class="sentence-generator__item sentence-generator__item--add">
      <IconAdd @click="createItem(0)"></IconAdd>
    </div>

    <template v-for="(item,i) in items">
      <div class="sentence-generator__item" :key="`main-${item.id}`">
        <SentenceItem :item="item"></SentenceItem>
      </div>
      <div class="sentence-generator__item sentence-generator__item--add" :key="`add-${item.id}`">
        <IconAdd @click="createItem(i+1)"></IconAdd>
      </div>
    </template>
  </div>
</template>

<script>
import IconAdd from "./icons/Add";
import SentenceItem from "./SentenceItem";

export default {
  created() {
    this.nextItemId = 0;
    this.createItem();
  },
  data: function() {
    return {
      items: []
    };
  },
  methods: {
    createItem(index = 0) {
      const item = {
        id: this.nextItemId++
      }
      this.items.splice(index, 0, item)
    }
  },
  components: {
    IconAdd,
    SentenceItem
  }
};
</script>

<style>
.sentence-generator {
  /*display: flex;
  align-items: center;*/
  text-align: center;
}

.sentence-generator__item {
  margin:1.4rem 0.6rem;
  display: inline-block;
  vertical-align: middle;
}
.sentence-generator__item--add{
  opacity: 0.4;
  cursor: pointer;
}
.sentence-generator__item--add:hover{
  opacity: 1;
}
</style>
