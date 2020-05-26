<template>
  <div>
      <h1>RECORDS</h1>
  </div>
</template>

<script>
export default {
    created () {
        if (!localStorage.signedIn) {
            this.$router.replace("/");
        }
        else {
            return
        }
    }
}
</script>

<style>

</style>