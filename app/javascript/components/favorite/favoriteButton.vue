<template>
    <div>
        <div v-if="isFavorited" v-on:click="deleteFavorite()">
            いいねを取り消す{{ conunt}}
        </div>
        <div v-else v-on:click="registerFavorite()">
            いいねをする{{count}}
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import { csrfToken} from "rails-ujs"

axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken()

export default {
    props: ["userId","productId"],
    data(){
        return{
            favoriteList:[]
        }
    },
    computed:{
        count(){
            return this.favoriteList.length
        },
        isFavorited(){
            if (this.favoriteList.length === 0){
                return false
            }
            return Boolean(this.findFavoriteId())
        }
    },
    created: function(){
        this.fetchFavoriteByProductId()
    }

}











</script>