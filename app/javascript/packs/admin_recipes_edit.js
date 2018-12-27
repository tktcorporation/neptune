import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios'
import draggable from 'vuedraggable'

var app = new Vue({
  el: '#app',
  data: function () {
    return {
      thumbnail_url: document.getElementById('thumbnail_url').value,
      recipe_ingredient_ids: []
    }
  },
  mounted: function () {

  },
  methods: {
    log: function() {
      console.log(this.recipe_ingredient_ids);
    }
  }
})

var editableList = Sortable.create(document.querySelector(".recipe-ingredients-list"), {
  group: {
    animation: 200,
    name: "recipe-ingredients"
  },
  onEnd: function(){
    var recipe_ingredient_ids = [];
    document.querySelectorAll('.recipe-ingredients-item').forEach(function(elem) {
      recipe_ingredient_ids.push(elem.id);
    });
    app.recipe_ingredient_ids = recipe_ingredient_ids;
  },
});