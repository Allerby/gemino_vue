<template>
  <div class='flex h-screen flex-row'>
    <div id='navigation' class='bg-primary-4 flex-none' style='width: 216px'>
      <img class='w-24 block mx-auto mt-8' src='images/logo@2x.png' />

      <div class='ml-4 mr-4'>
        <hr class='border-t flex-grow mt-10 border-shade-3 opacity-25'>

        <div class='flex justify-between mt-10 text-correct leading-normal'>
          <p>Choose your tool</p>
          <i class='icon check'></i>
        </div>

        <div class='flex justify-between h-6 mt-6 text-white leading-normal'>
          <p class='text-correct'>Upload CSV</p>
          <i class='icon check'></i>
        </div>

        <div class='flex justify-between h-6 mt-6 text-white leading-normal overflow-y-hidden'>
          <p>Categorise</p>
          <i class='icon check'></i>
        </div>

        <div class='flex justify-between h-6 mt-6 text-white leading-normal cursor-pointer'>
          <a>
            Logout
          </a>
        </div>
      </div>
    </div>
    <div class='flex mx-auto'>

      <slot></slot>

    </div>
  </div>
</template>

<script>
export default {
  props: [""],

  data: function() {
    return {
      
    }
  },

  methods: {
    
  }
}
</script>
