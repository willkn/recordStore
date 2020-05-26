<template>
  <div>
    <h1>RECORDS</h1>
    <h3>Add a new record</h3>
    <form>
      <label for="recordTitle">Record</label>
      <br />
      <input id="recordTitle" placeholder="Record" v-model="newRecord.title" />
      <br />
      <br />
      <label for="recordYear">Year</label>
      <br />
      <input id="recordYear" placeholder="Year" v-model="newRecord.year" />
      <br />
      <br />
      <label for="recordArtist">Artist</label>
      <br />
      <input id="recordArtist" placeholder="Artist" v-model="newRecord.artist" />
      <br />
      <br />
      <button @click.prevent="addRecord">Add record</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      artists: [],
      records: [],
      newRecord: [],
      error: "",
      editedRecord: ""
    };
  },
  methods: {
    getArtist(record) {
      const recordArtistValues = this.artists.filter(
        artist => artist.id === record.artist_id
      );
      let artist;

      recordArtistValues.forEach(function(element) {
        artist = element.name;
      });

      return artist;
    },
    addRecord() {
      const value = this.newRecord;
      if (!value) {
        return;
      }
      this.$http.secured
        .post("/records", {
          record: {
            title: this.newRecord.title,
            year: this.newRecord.year,
            artist_id: this.newRecord.artist
          }
        })

        .then(response => {
          this.records.push(response.data);
          this.newRecord = "";
        })
        .catch(error => this.setError(error, "Cannot create record"));
    }
  }
};
</script>

<style scoped>
input {
  text-align: center;
}
</style>