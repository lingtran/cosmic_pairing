<template>
  <div class="container">
    <tr v-for="(result, index) in results" :key="index">
      <td>{{ result }}</td>
    </tr>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Test',
  data() {
    return {
      results: [],
    };
  },
  methods: {
    getResults() {
      const path = 'http://localhost:5000/test';
      axios.get(path)
        .then((res) => {
          this.results = res.data.results;
        })
        .catch((error) => {
          // eslint-disable-next-line
          console.error(error);
        });
    },
  },
  created() {
    this.getResults();
  },
};
</script>
