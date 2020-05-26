<template>
  <div>
    <h1>SIGN IN</h1>
    <form>
      <label for="email">
        Email
        <input
          align="center"
          class="inputField"
          id="email"
          type="email"
          placeholder="Email"
          v-model="email"
        />
      </label>
      <br />
      <label for="password">
        Password
        <input
          align="center"
          class="inputField"
          id="password"
          type="password"
          placeholder="Password"
          v-model="password"
        />
      </label>
      <br />
      <button class="submit" @click.prevent="signin">Submit</button>
      <p class="error">{{ error }}</p>
      <br />
      <br />
      <p>email: {{ email }} password: {{ password }}</p>
    </form>
  </div>
</template>

<script>
export default {
  name: "Signin",
  data() {
    return {
      email: "",
      password: "",
      error: ""
    };
  },
  created() {
    this.checkSignedIn();
  },
  updated() {
    this.checkSignedIn();
  },
  methods: {
    signin() {
      this.$http.plain
        .post("/signin", { email: this.email, password: this.password })
        .then(response => this.signinSuccessful(response))
        .catch(error => this.signinFailed(error));
    },
    signinSuccessful(response) {
      if (!response.data.csrf) {
        this.signinFailed(response);
        return;
      }
      // Set the csrf and signedIn values to positive and reroute to records
      localStorage.csrf = response.data.csrf;
      localStorage.signedIn = true;
      this.$emit("loginSuccessful", email);
      console.log("emit");
      this.error = "";
      this.$router.replace("/home");
    },
    signinFailed() {
      this.error = "Incorrect username/password";
      this.email = "";
      this.password = "";
      delete localStorage.csrf;
      delete localStorage.signedIn;
    },
    checkSignedIn() {
      if (localStorage.signedIn) {
        return;
      } else {
        this.$router.replace("/");
      }
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
.error {
  color: red;
}
</style>