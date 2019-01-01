import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios'
import draggable from 'vuedraggable'

var app = new Vue({
  el: '#app',
  data: function () {
    return {
      thumbnail_url: document.getElementById('thumbnail_url').value,
      recipe_ingredient_ids: [],
      recipe_ingredients: [],
      ingredient_name: "",
      ingredient_quantity_and_unit: "",
      instructions: [],
      instruction_body: ""
    }
  },
  mounted: function () {

  },
  methods: {
    log: function() {
      console.log(this.recipe_ingredient_ids);
    },
    create_recipe_ingredient: function() {
      var recipe_ingredients = [];
      document.querySelectorAll('.recipe-ingredients-item').forEach(function(el){
        recipe_ingredients.push({name: el.querySelectorAll('input')[0].value, quantity_and_unit: el.querySelectorAll('input')[1].value});
      })
      this.recipe_ingredients = recipe_ingredients;
      this.recipe_ingredients.push({name: this.ingredient_name, quantity_and_unit: this.ingredient_quantity_and_unit});
      this.ingredient_name = "";
      this.ingredient_quantity_and_unit = "";
    },
    create_instruction: function() {
      var instructions = [];
      document.querySelectorAll('.recipe-instructions-item').forEach(function(el){
        instructions.push({body: el.querySelectorAll('input')[0].value});
      })
      this.instructions = instructions;
      this.instructions.push({body: this.instruction_body});
      this.instruction_body = "";
    },
    delete_ingredient: function(index) {
      this.recipe_ingredients.splice(index, 1);
    },
    delete_instruction: function(index) {
      this.instructions.splice(index, 1);
    }
  }
});

var editableList = Sortable.create(document.querySelector(".recipe-ingredients-list"), {
  group: {
    animation: 200,
    name: "recipe-ingredients"
  }
});
var editableList = Sortable.create(document.querySelector(".recipe-instructions-list"), {
  group: {
    animation: 200,
    name: "instructions"
  }
});