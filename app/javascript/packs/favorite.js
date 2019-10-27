import Vue from 'vue'
import axios from "axios";
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

new Vue({
    el:"#favorite",
    data:{
        product_id: document.querySelector("[v-model='product_id']").value
    },
    methods:{
        favorite_create: function(){
           
            axios.post(`/user/products/${this.product_id}/favorites/`) 
            .then(res =>{
                window.location.href = `/user/products/${this.product_id}`;
            })
        },
        favorite_delete: function(){
            console.log("aaaaaa");
            axios.delete(`/user/products/${this.product_id}/favorites/`)
            .then(res =>{
                window.location.href = `/user/products/${this.product_id}`;
            })
        }
    }










})