<template>
  <div>
      <h1>RECORDSTORE</h1>
        <div>
            <!-- <router-link to="/" v-if="!loggedIn">Sign in</router-link>
            <router-link to="/signup" v-if="!loggedIn">Sign Up</router-link> -->
            <!-- <router-link to="/records">Records</router-link>
            <router-link to="/artists">Artists</router-link> -->
        </div>
      <img src="@/assets/record.jpeg">
      <br>
  </div>
</template>

<script>
export default {
    methods: {
        signedIn () {
            // Returns a true or false bool that decides what to render.
             this.loggedIn = localStorage.getItem('signedIn')
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