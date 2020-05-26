<template>
  <div id="app">
    <app-navbar></app-navbar>
    <app-header></app-header>
    <router-view/>
  </div>
</template>

<script>
import Header from '@/components/Header'
import Records from '@/components/Records'
import Navbar from '@/components/Navbar'

export default {
  name: 'App',
  components: {
    'app-header': Header,
    'app-navbar': Navbar
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
