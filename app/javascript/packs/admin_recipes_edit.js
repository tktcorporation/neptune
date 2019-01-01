import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios'
import draggable from 'vuedraggable'

var app = new Vue({
  el: '#app',
  data: function () {
    return {
      thumbnail_url: document.getElementById('thumbnail_url').value,
      recipe_ingredient_ids: [],
      instruction_ids: []
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

var ingredientsList = Sortable.create(document.querySelector(".recipe-ingredients-list"), {
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
  }
});
var instructionsList = Sortable.create(document.querySelector(".recipe-instructions-list"), {
  group: {
    animation: 200,
    name: "recipe-instructions"
  },
  onEnd: function(){
    var recipe_instruction_ids = [];
    document.querySelectorAll('.recipe-instructions-item').forEach(function(elem) {
      recipe_instruction_ids.push(elem.id);
    });
    console.log(recipe_instruction_ids)
    app.instruction_ids = recipe_instruction_ids;
  }
});