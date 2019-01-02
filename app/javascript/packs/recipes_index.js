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
      var auth_token = document.cookie.match(/auth_token=?([A-Za-z0-9]+)/)[1];
      if (auth_token) {
        axios.get('/api/recipes',{ params: { token: auth_token } }).then((response) => {
          if (response.data.status == 401) location.href = (window.location.origin + "/login");
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
      } else {
        location.href = (window.location.origin + "/login");
      }
    }
  }
})