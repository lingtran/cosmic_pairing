import Vue from 'vue';
import VueRouter from 'vue-router';
import Ping from '../components/Ping.vue';
import Signs from '../components/Signs.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/ping',
    name: 'Ping',
    component: Ping,
  },
  {
    path: '/signs',
    name: 'Signs',
    component: Signs,
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
