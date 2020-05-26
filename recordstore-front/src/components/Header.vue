<template>
  <div>
      <h1>RECORDSTORE</h1>
      <h1>{{ loggedIn }}</h1>
        <div>
            <router-link to="/" v-if="!loggedIn">Sign in</router-link>
            <router-link to="/signup" v-if="!loggedIn">Sign Up</router-link>
            <router-link to="/records" v-if="loggedIn">Records</router-link>
            <router-link to="/artists" v-if="loggedIn">Artists</router-link>
        </div>
      <img src="@/assets/record.jpeg">
      <br>
      <button v-if="!this.loggedIn" @click.prevent="signOut">Sign out</button>
  </div>
</template>

<script>
export default {
    data () {
        return {
            loggedIn: false
        }
    },
    methods: {
        signedIn () {
            // Returns a true or false bool that decides what to render.
            loggedIn = localStorage.signedIn
        },
        signOut () {
            // Triggers the signIn controllers destroy action
            this.$http.secured.delete('/signin')
            .then(response => {
                console.log('logging out...')
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

<style scoped>

a {
    text-decoration: none;
}

</style>