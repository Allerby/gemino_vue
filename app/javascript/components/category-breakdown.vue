<template>
  <div>
    <canvas id="myChart" width="500" height="500"></canvas>
  </div>
</template>

<script>
import Chart from 'chart.js'

export default {
  props: ["categories"],

  data: function() {
    this.spending = JSON.parse(this.categories)
    return {
      spending: this.spending,
    }
  },

  mounted() {
    const ctx = document.getElementById('myChart');
    new Chart(ctx, {
      type: 'horizontalBar',
      data: {
        labels: this.spending.map((cat) => cat.category),
        datasets: [{
          label: 'Spending',
          data: this.spending.map((cat) => cat.sum),
          borderWidth: 1
        }]
      },
    });
  },
}
</script>