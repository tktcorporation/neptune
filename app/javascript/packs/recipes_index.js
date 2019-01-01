import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios';

var app = new Vue({
  el: '#app',
  data: function () {
    return {
      recipes: []
    }
  },
  mounted: function () {
    this.fetchRecipes();
  },
  methods: {
    fetchRecipes: function () {
      axios.get('/api/recipes').then((response) => {
        var recipe_num = 6;
        if (response.data.recipes.length < recipe_num) {
          recipe_num = response.data.recipes.length;
        }
        for(var i = 0; i < recipe_num; i++) {
          this.recipes.push(response.data.recipes[i]);
        }
      }, (error) => {
        console.log(error);
      });
    }
  }
})