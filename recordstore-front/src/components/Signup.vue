<template>
  <div>
    <h1>SIGN UP</h1>
    <form>
      <label for="email">Email</label>
      <input class="inputField" id="email" type="email" placeholder="Email" v-model="email" />
      <br />
      <label for="password">Password</label>
      <input
        class="inputField"
        id="password"
        type="password"
        placeholder="Password"
        v-model="password"
      />
      <br />
      <label for="passwordConfirmation">Confirm password</label>
      <input
        class="inputField"
        id="passwordConfirmation"
        type="password"
        placeholder="Password"
        v-model="password_confirmation"
      />
      <br />
      <button class="submit" @click.prevent="signup">Submit</button>
      <br />
      <br />
      <!-- <p>email: {{ email }}</p>
      <p>password: {{ password }}</p>
      <p>password confirmation: {{ password_confirmation }}</p> -->
    </form>
  </div>
</template>

<script>
export default {
  name: "Signup",
  data() {
    return {
      email: "",
      password: "",
      password_confirmation: "",
      error: "default error"
    };
  },
  created() {
    this.checkSignedin;
  },
  methods: {
    // Performs a POST request to the rails endpoint and passes the email and pass as parameters
    signup() {
      if (this.password === this.password_confirmation) {
        this.$http.plain
          .post("http://localhost:3000/signup ", {
            email: this.email,
            password: this.password,
            password_confirmation: this.password_confirmation
          })
          // If successful execute signinSuccesful
          .then(response => {
            this.$router.replace("/home")
            this.email = ''
            this.password = ''
            this.password_confirmation = ''
            this.signinSuccessful(response)

            })
          // If it doesn't run for whatever reason, execute signupFailed
          .catch(error => this.signinFailed(error));
      }
    },
    signinSuccessful() {
      if (!response.data.csrf) {
        this.signinFailed(response);
        return;
      }
      // Set the csrf and signedIn values to positive and reroute to records
      localStorage.csrf = response.data.csrf;
      localStorage.signedIn = true;
      this.error = "";
      this.$router.replace("/records");
    },
    signinFailed() {
      // Relook at this, don't understand it
      this.error = "signin failed";
      delete localStorage.csrf;
      delete localStorage.signedIn;
    },
    checkSignedIn() {
      console.log("Success!");
      // if (localStorage.signedIn) {
      //     this.$router.replace('/records')
      // }
    }
  }
};
</script>

<style scoped>
.inputField {
  margin: auto;
  width: 10%;
  padding: 5px;
  border: 1px solid gray;
  border-radius: 1px;
}

label,
input {
  display: block;
}

label {
  margin: bottom;
}
</style>