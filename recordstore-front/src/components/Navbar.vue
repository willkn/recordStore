<template>
  <div class="topnav">
    <img src="@/assets/recordlogo.png" id="logo" @click="home"/>
    <router-link to="/records">Records</router-link>
    <router-link to="/artists">Artists</router-link>
    <router-link id="signIn" to="/">Sign in</router-link>
    <router-link id="signUp" to="/signup">Sign up</router-link>
    <a id="signOut" href="/" v-if="signedIn" @click="signOut">Sign out</a>
    <!-- <app-profile id="profile" v-if="signedIn"></app-profile> -->
  </div>
</template>

<script>
import Profile from "@/components/Profile";
export default {
  
  components: {
      'app-profile': Profile
  },

  data () {
      return {
          loggedIn: Boolean,
      }
  },
  
  methods: {
    home () {
        this.$router.replace("/home")
    },
    signedIn() {
      if (localStorage.signedIn) {
        this.loggedIn = true;
      } else {
        this.loggedIn = false;
      }
    },
    signOut() {
      // Triggers the signIn controllers destroy action
      this.$http.secured
        .delete("/signin")
        .then(response => {
          console.log("logging out...");
          delete localStorage.csrf;
          delete localStorage.signedIn;
          this.$router.replace("/");
        })
        .catch(error => this.setError(error, "Cannot sign out"));
    }
  }
};
</script>

<style scoped>
.topnav {
  background-color: #333;
  overflow: hidden;
  position: relative;
  color: #ddd;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 25px 20px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #4caf50;
  color: white;
}

#logo {
  float: left;
  height: 70px;
  width: 70px;
}

#profile {
    float: right;
}

#signOut {
    float: right;
}

#signIn {
    float: right;
}
</style>