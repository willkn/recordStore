<template>
  <div>
      <h1>ARTISTS</h1>
      <li v-for="artist in artists" :key="artist.id" :artist="artist"></li>
  </div>
</template>

<script>
export default {
    data () {
        return {
            artists: [],
            newArtists: [],
            error: '',
            editedArtist: ''
        }
    },

}
</script>

<style>

</style>