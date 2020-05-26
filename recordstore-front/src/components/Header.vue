<template>
  <div>
      <h1>RECORDSTORE</h1>
        <div>
            <router-link to="/" v-if="!signedIn()">Sign in</router-link>
            <router-link to="/signup" v-if="!signedIn">Sign Up</router-link>
            <router-link to="/records" v-if="signedIn">Records</router-link>
            <router-link to="/artists" v-if="signedIn">Artists</router-link>
            <router-link to="#" v-if="signedIn" @click.prevent="signOut">Sign out</router-link>
        </div>
      <img src="@/assets/record.jpeg">
  </div>
</template>

<script>
export default {
    name: 'Header',
    created () {
        this.signedIn()
    },
    methods: {
        signedIn () {
            // Returns a true or false bool that decides what to render.
            return localStorage.signedIn
        },
        signOut () {
            // Triggers the signIn controllers destroy action
            this.$http.secured.delete('/signin')
            .then(response => {
                delete localStorage.csrf
                delete localStorage.signedIn
                this.$router.replace('/')
            })
            .catch(error => this.setError(error, 'Cannot sign out'))
        },
        setError (error, text) {
            this.error = (error.response && error.response.data && error.response.data.error) || text
        },

    }
}
</script>

<style>

</style>