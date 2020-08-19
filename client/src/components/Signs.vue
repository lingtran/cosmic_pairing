<template>
  <div class="container">
    <tr v-for="(sign, index) in signs" :key="index">
      <td>{{ sign.name.toUpperCase() }}</td>
      <td>{{ sign.modality }}</td>
      <td>{{ sign.element }}</td>
    </tr>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Signs',
  data() {
    return {
      signs: [],
    };
  },
  methods: {
    getSigns() {
      const path = 'http://localhost:5000/signs';
      axios.get(path)
        .then((res) => {
          this.signs = res.data.signs;
        })
        .catch((error) => {
          // eslint-disable-next-line
          console.error(error);
        });
    },
  },
  created() {
    this.getSigns();
  },
};
</script>
